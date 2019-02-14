/**
 * All Data layer classes must extend this class
 * @author Copyright (c) 2013 Salesforce.com.
 */
public abstract class asb_BaseData {

	private static final String NAME_FIELD = 'Name';

	/**
	 * Represents the list of errors that might have occured during an inserrt/update or delete operation
	 */
	protected Database.Error [] dmlErrors; // to be used by save & remove methods
	protected String securityDmlError;

	/**
	 *  The ID of the custom object
	 **/
	protected ID objectId;
	
	/**
	 *  The custom object. This is set in the constructor of the child class, by calling the setCustomObject method.
	 **/
	private sObject customObject;

	protected asb_BaseData (){
		this.customObject       = null;
		this.dmlErrors          = null;
		this.securityDmlError   = null;
		this.objectId           = null;
	}

	/**
	 *   This is called by the constructor of the child class.
	 **/
	protected void setCustomObject (sObject obj){
		this.customObject = obj;
		if (obj != null) {
			this.objectId     = obj.ID;
		}
	}
	
	public sObject getSObject() {
		return customObject;
	}
	
	public String getSobjectName() {
		if (customObject == null) return null;
		
		return customObject.getSObjectType().getDescribe().getName();	
	}

	/**
	 * Return the ID associated with the SObject
	 **/
	public ID getId (){
		return objectId;
	}
	
    public void refresh(){
    	if(this.customObject != null)
    		this.objectId = this.customObject.Id;
    }
    
	/**
	 *   Return the Name of the SObject
	 **/
	public virtual String getName() {
		return (String) customObject.get(NAME_FIELD);
	}
	
	public Boolean getIsNew() {
		return objectId == null;
	}

	/**
	 * set the ID associated with the SObject
	 **/
	protected void setId (ID val){
		this.objectId = val;
	}

	/**
	 * set the Name associated with the SObject
	 **/
	public void setName(String name) {
		if (this.customObject != null) this.customObject.put(NAME_FIELD, name);
	}
	
	/**
	* manually set the Created By ID value if you are using something like an email service where the CreatedByID value will not be the person you are looking to have
	* in the audit field
	**/	
	public void setCreatedById(Id uId) {
		if(this.customObject != null) {
			this.customObject.put('CreatedById', String.valueOf(uId));
		} 
	}

	/**
	 * Returns a list of Database.Error objects. These are errors associated with the current DML operation (insert/update/delete).
	 * The saveObject, deleteSObject methods populates this list, if errors were encounterd.
	 **/
	public String getDmlErrorMessage (){
		String err = '';

		if (this.dmlErrors != null){
			for (Database.Error er : this.dmlErrors){
				err += '   ' + er.getMessage () + ' Error Code:' + er.getStatusCode ();
			}
		}
		if (!String.isEmpty(this.securityDmlError)) {
			err += '   ' + securityDmlError;
		}
		return err;
	}

	/**
	 * Default implementation of the save/update operation.
	 **/
	protected Boolean saveSObject (){
		Boolean retVal = false;

		if (customObject != null){
			this.dmlErrors = null;
			this.securityDmlError = null;
	 		if (this.objectId == null)  {
	 			this.securityDmlError = asb_BaseDataDML.insertData(this);
	 		}
	 		else {
	 			this.securityDmlError = asb_BaseDataDML.updateData(this);
	 		}

		    if (this.dmlErrors != null || this.securityDmlError != null){
		    	this.objectId  = null;
		    	retVal         = false;
		    	if(!(customObject instanceof asb_Log__c)){
		    		asb_Log.log(asb_Log.ERROR, asb_Log.DML_CATEGORY, asb_LOG.STI_DML_ERROR, getDmlErrorMessage());
		    	}else{
		    		if (this.dmlErrors != null){
			    		for (Database.Error er : this.dmlErrors){
							System.debug(LoggingLevel.ERROR, ' There was an error in DML operation, error code: ' + er.getStatusCode());
						}
		    		}
		    	}
		    } else {
		    	retVal = true;
		    }
		}
		return retVal;
	}

	/**
	 * Default implementation of the delete operation.
	 **/
	protected Boolean deleteSObject (){
		Boolean retVal = false;

		if (customObject != null){
			this.dmlErrors = null;
			this.securityDmlError = asb_BaseDataDML.deleteData(this);

			if (this.dmlErrors == null && this.securityDmlError == null){
				retVal = true;
			    this.objectId           = null;
			    this.customObject       = null;
			}
		}
		return retVal;
	}
	
	public void setErrors(LIST<Database.Error> errors) {
		this.dmlErrors = errors;
	}
	
	/**
	 * Default implementation of the save/update operation.
	 **/
	public virtual Boolean save (){
		return this.saveSObject ();
	}
	
	public virtual asb_BaseData cloneObject(){
		return null;
	}

	/**
	 * This needs to be overiden by the subclass. Usually calling the deleteSObject would suffice, but some data objects might
	 * need additional cleanup on delete.
	 **/
	public abstract Boolean remove ();

	public abstract ID getCreatedById ();
	public abstract ID getLastModifiedById ();
	public abstract DateTime getCreatedDate ();
	public abstract DateTime getLastModifiedDate ();
}