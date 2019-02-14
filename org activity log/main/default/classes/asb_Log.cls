/**
 * @description Class used for creating log records (e.g., exceptions)
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_Log extends asb_BaseData {
	private asb_Log__c log;
	private List<asb_Log> logs;

	//Categories
	// NOTE: Add to the set when creating a new category! 
	//       Also, these categories should match the category picklist on asb_Log__c
	public static final String GENERAL_CATEGORY = 'General';
	public static final String SEARCH_CATEGORY = 'Search';
	public static final String DML_CATEGORY = 'DML';
	public static final String BATCH_CATEGORY = 'Batch';
    
	//Stack Trace IDs
	// NOTE: Add to the set when creating a new STI! 
	public static final String STI_SEARCH_FILTER_QUERY = 'STI-0001';
	public static final String STI_GENERIC_SEARCH = 'STI-0002';
	public static final String STI_DML_ERROR = 'STI-0003';
	public static final String STI_BATCH_INFO = 'STI-0004';
	public static final String STI_DOCUMENT_ISSUE = 'STI-0005';

    public static final String ERROR = 'Error';
	public static final String WARNING = 'Warning';
	public static final String INFO = 'Info';

	private static Set<String> categories = new Set<String>();
	private static Set<String> stackTraceIds = new Set<String>();
	static {
		categories.add(GENERAL_CATEGORY);
		categories.add(SEARCH_CATEGORY);
		categories.add(DML_CATEGORY);
		categories.add(BATCH_CATEGORY);

		stackTraceIds.add(STI_SEARCH_FILTER_QUERY);
		stackTraceIds.add(STI_GENERIC_SEARCH);
		stackTraceIds.add(STI_DML_ERROR);
		stackTraceIds.add(STI_BATCH_INFO);
		stackTraceIds.add(STI_DOCUMENT_ISSUE);
    }

	public asb_Log(){
		this.log = new asb_Log__c();
		setCustomObject(log);
	}

	public asb_Log(asb_Log__c l){
		this.log = l;
		setCustomObject(l);
	}

	public override Boolean remove (){
		return super.deleteSObject ();
	}

	public static asb_Log logGack(String category,String stackTraceId,Exception e,String data) {
		return createLog(ERROR, category, stackTraceId, data, e);
	}

	public static asb_Log log(String sev, String category,String stackTraceId,String data) {
		return createLog(sev, category, stackTraceId, data, null);
	}
	
	private static asb_Log createLog(String sev, String category,String stackTraceId,String data, Exception e) {    		
		
		if (!isValidCategory(category) || !isValidStackTraceId(stackTraceId)) {
			return null;
		}
		asb_Log l = new asb_Log();
		l.setSeverity(sev);
		l.setCategory(category);
		l.setStackTraceId(stackTraceId);
		l.setException('' + e);
		if (data != null && data.length() > Schema.sObjectType.asb_Log__c.fields.Data__c.length) {
			data = data.substring(0,Schema.sObjectType.asb_Log__c.fields.Data__c.length);
		}
		l.setData(data);
		l.save();
		
		return l;
	}

	public static Boolean isValidCategory(String category) {
		if (category == null || !categories.contains(category)) {
			return false;
		}
		return true;
	}

	public static Boolean isValidStackTraceId(String stId) {
		if (stId == null || !stackTraceIds.contains(stId)) {
			return false;
		}
		return true;
	}

	public void setSeverity(String s) {
		log.Severity__c = s;
	}

	public void setCategory(String s) {
		log.Category__c = s;
	}

	public void setStackTraceId(String s) {
		log.StackTraceId__c = s;
	}

	public void setData(String s) {
		log.Data__c = s;
	}

	public void setException(String s) {
		log.Exception__c = s;
	}

	public override ID getCreatedById (){
		return log.CreatedById;
	}

	public override ID getLastModifiedById (){
		return log.LastModifiedById;
	}

	public override DateTime getCreatedDate (){
		return log.createdDate;
	}

	public override DateTime getLastModifiedDate (){
		return log.LastModifiedDate;
	}
}