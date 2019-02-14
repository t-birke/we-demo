/**
 * @description Tests for asb_ListUtils
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestListUtils {
    public static testmethod void testRemoveElement() {
        
        // remove element in the middle
        List<String> lst = new List<String>();      
        lst.add('a1');
        lst.add('a2');
        lst.add('a3');      
        asb_ListUtils.removeElement(lst,'a2');
        System.assertEquals('a1',lst.get(0));
        System.assertEquals('a3',lst.get(1));
        
        // remove first element
        lst = new List<String>();       
        lst.add('a1');
        lst.add('a2');
        lst.add('a3');      
        asb_ListUtils.removeElement(lst,'a1');
        System.assertEquals('a2',lst.get(0));
        System.assertEquals('a3',lst.get(1));
        
        // remove last element
        lst = new List<String>();       
        lst.add('a1');
        lst.add('a2');
        lst.add('a3');      
        asb_ListUtils.removeElement(lst,'a3');
        System.assertEquals('a1',lst.get(0));
        System.assertEquals('a2',lst.get(1));
        
        // remove element that is not in list
        lst = new List<String>();       
        lst.add('a1');
        lst.add('a2');
        lst.add('a3');      
        asb_ListUtils.removeElement(lst,'a4');
        System.assertEquals('a1',lst.get(0));
        System.assertEquals('a2',lst.get(1));
        System.assertEquals('a3',lst.get(2));
        
        // remove element from null list
        asb_ListUtils.removeElement(null,'a4');
        
        // remove element from null element
        asb_ListUtils.removeElement(lst,null);
        
        // remove element from empty list
        lst = new List<String>();       
        asb_ListUtils.removeElement(lst,'a1');
    }
    
    private class TestObject extends asb_BaseData {
    	public TestObject() {super();}
    	public TestObject(SObject obj) {
    		super();
    		setCustomObject(obj);
    	}
		public override Boolean remove() { return true; }
		public override ID getCreatedById() { return UserInfo.getUserId(); }
		public override ID getLastModifiedById() { return UserInfo.getUserId(); }
		public override DateTime getCreatedDate() { return DateTime.now(); }
		public override DateTime getLastModifiedDate() { return DateTime.now(); }
    }
    
    public static testMethod void testContainsMethods() {
    	System.assertEquals(true, asb_ListUtils.isEmpty(null));
    	System.assertEquals(true, asb_ListUtils.isEmpty(new List<Object>()));
    	System.assertEquals(false, asb_ListUtils.isEmpty(new List<Object>{new TestObject()}));
    	
    	List<Id> idList = null;
    	Id userId = (Id) UserInfo.getUserId();
		System.assertEquals(-1, asb_ListUtils.containsWithIndex(idList, userId));
		idList = new List<Id>();
		System.assertEquals(-1, asb_ListUtils.containsWithIndex(idList, userId));
		idList.add(UserInfo.getOrganizationId());
		idList.add(userId);
		System.assertEquals(1, asb_ListUtils.containsWithIndex(idList, userId));
    }
    
    public static testMethod void testPicklistMethods() {
		List<Schema.PicklistEntry> emailEncodingPicklist = Schema.sObjectType.User.fields.EmailEncodingKey.getPickListValues();
		List<SelectOption> emailEncodingSelectList = asb_ListUtils.picklistToSelectOptions(emailEncodingPicklist);
		System.assertEquals(emailEncodingPicklist.size(), emailEncodingSelectList.size());
		
		emailEncodingSelectList = asb_ListUtils.picklistToSelectOptions(emailEncodingPicklist, 'Test example: {0}');
		System.assertEquals(emailEncodingPicklist.size(), emailEncodingSelectList.size());

		List<String> injectedLabels = new List<String>();
		for (Integer i = 0; i < emailEncodingSelectList.size(); i++) {
			injectedLabels.add('Injected label ' + i);
		}
		
    	Map<String, String> labelLookup = asb_ListUtils.getLabelLookup(emailEncodingPicklist);
		System.assertEquals(emailEncodingPicklist.size(), emailEncodingSelectList.size());
    }
    
    /*
    public static List<SelectOption> getSelectOptions(List<asb_BaseData> pList) {
    	List<SelectOption> options = new List<SelectOption>();
    	for (asb_BaseData bd : pList) {
	        options.add(new SelectOption(bd.getId(), bd.getName()));
    	}
        return options;
    }
    
    */
    
    public static testMethod void testGetQueryParamsMap() {

    	String params = null;
    	Map<String,String> paramsMap = asb_ListUtils.getQueryParamsAsMap(params);
    	System.assertNotEquals(null, paramsMap);
    	System.assertEquals(true, paramsMap.isEmpty());
    	
    	params = '';
    	paramsMap = asb_ListUtils.getQueryParamsAsMap(params);
    	System.assertNotEquals(null, paramsMap);
    	System.assertEquals(true, paramsMap.isEmpty());
    	
    	params = 'param1=&param2=false&param3=2014';
    	paramsMap = asb_ListUtils.getQueryParamsAsMap(params);
    	System.assertNotEquals(null, paramsMap);
    	System.assertEquals(3, paramsMap.size());
    }
    
    public static testMethod void testGetIdMap() {
	   	User u = [Select Id, Name from User where Id = :UserInfo.getUserId()];
    	
    	Map<Id, SObject> idMap = asb_ListUtils.getIdMap(new List<SObject>{u});
		System.assertNotEquals(null, idMap);
		System.assertEquals(true, idMap.containsKey(u.Id));    	    
	}
}