/**
 * @description Class to handle DML operations with asb_BaseData objects
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_BaseDataDML {

	//Property to set if it must fail on error
	public static Boolean FAIL_ON_ERROR = false;
	
	private static final String INSERT_OPERATION = 'insert';
	private static final String UPDATE_OPERATION = 'update';
	private static final String DELETE_OPERATION = 'delete';
	private static final String UPSERT_OPERATION = 'upsert';
	
	/******************************* PUBLIC METHODS ************************************/
	//Inserts a asb_BaseData object into database
	public static String insertData(asb_BaseData obj){ return insertData(new List<asb_BaseData>{ obj }); }
	//Inserts a list of asb_BaseData objects into database
	public static String insertData(List<asb_BaseData> objList){
		return process(objList, INSERT_OPERATION);
	}
	//Updates a asb_BaseData object into database
	public static String updateData(asb_BaseData obj){ return updateData(new List<asb_BaseData>{ obj }); }
	//Updates a list of asb_BaseData objects into database
	public static String updateData(List<asb_BaseData> objList){
		return process(objList, UPDATE_OPERATION);
	}
	//Deletes a asb_BaseData object into database
	public static String deleteData(asb_BaseData obj){ return deleteData(new List<asb_BaseData>{ obj }); }
	//Deletes a list of asb_BaseData objects into database
	public static String deleteData(List<asb_BaseData> objList){
		return process(objList, DELETE_OPERATION);
	}

	public static String upsertData(List<asb_BaseData> objList){
		return process(objList, UPSERT_OPERATION);
	}
	
	/******************************* PUBLIC METHODS ************************************/
	
	/******************************* PRIVATE METHODS ************************************/
	private static List<SObject> getListOfCustomObjects(asb_BaseData[] objList){
		List<SObject> customObjectList = new List<SObject>();
		for(asb_BaseData obj : objList) customObjectList.add(obj.getSObject());
		return customObjectList;
	}

	private static String process(List<asb_BaseData> objList, String processType) {
		if (objList.isEmpty()) return null;
		
		// Cannot upsert generic list:
		// System.TypeException: DML on generic List<SObject> only allowed for insert, update or delete
		// So split and do two operations
		if (processType == UPSERT_OPERATION) {
			List<asb_BaseData> insertList = new List<asb_BaseData>();
			List<asb_BaseData> updateList = new List<asb_BaseData>();
			for (asb_BaseData bd : objList) {
				if (bd.getIsNew()) insertList.add(bd);
				else updateList.add(bd);
			}
			
			String result = process(insertList, INSERT_OPERATION);
			if (!String.isEmpty(result)) return result;
			
			return process(updateList, UPDATE_OPERATION);
		}
		
		if (processType == INSERT_OPERATION) {
			Database.Saveresult[] results = Database.insert(getListOfCustomObjects(objList), FAIL_ON_ERROR);
			processResults(results, objList);
		}		
		else if (processType == UPDATE_OPERATION) {
			Database.Saveresult[] results = Database.update(getListOfCustomObjects(objList), FAIL_ON_ERROR);
			processResults(results, objList);
		}
		else {
			Database.Deleteresult[] results = Database.delete(getListOfCustomObjects(objList), FAIL_ON_ERROR);
			processResults(results, objList);
		}

		return null;
	}

	private static void processResults(Database.Saveresult[] results, asb_BaseData[] objList){
		Integer index = 0;
		for(Database.Saveresult result : results){
			asb_BaseData obj = objList[index];
			if(!result.isSuccess()) obj.setErrors(result.getErrors());
			else obj.refresh();
			index++;
		}
	}

	private static void processResults(Database.Deleteresult[] results, asb_BaseData[] objList){
		Integer index = 0;
		for(Database.Deleteresult result : results){
			asb_BaseData obj = objList[index];
			if(!result.isSuccess()) obj.setErrors(result.getErrors());
			else obj.refresh();
			index++;
		}
	}
	
	//Instantiate an sObject with the type passed in as an argument at run time.
	public static sObject createObject(String typeName) {
        sObject obj;
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(typeName);
        
        if (targetType != null) {
            obj = targetType.newSObject();
        }
        
        return obj; 
    }
}