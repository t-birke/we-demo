/**
 * @description Utility class for lists
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListUtils {
	
	public static Boolean isEmpty(List<Object> l) {	
		return (l == null || l.isEmpty());
	}
	
	public static  Integer containsWithIndex(List<ID> l, ID idVal) {
		if (l == null) {
			return -1;
		}
		Integer index = 0;
		for (ID i : l) {
			if (i == idVal) {
				return index;
			}
			index++;
		}
		return -1;		
	}
	
	//This method is used to create a SelectOption list from a PicklistEntry list.
    
    public static List<SelectOption> picklistToSelectOptions(List<Schema.PicklistEntry> pPicklist, String labelText) {
    	return picklistToSelectOptions(pPicklist,labelText,false);
    }
    
	public static List<SelectOption> picklistToSelectOptions(List<Schema.PicklistEntry> pPicklist, String labelText,Boolean toLowerCase) {
    	List<SelectOption> options = new List<SelectOption>();
    	if(pPicklist != null){
	    	for (Schema.PicklistEntry e : pPicklist) {	    		
		        if( String.isEmpty(labelText) ){
		        	options.add(new SelectOption(e.getValue(),e.getLabel()));
		        }else{
		        	String label;
		        	if (toLowerCase && e.getLabel() != null) label = e.getLabel().toLowerCase();
		        	else label = e.getLabel();
		        	options.add(new SelectOption(e.getValue(), labelText.replace('{0}', label) ));
		        }
	    	}
    	}
        return options;
    }
    
	public static List<asb_CheckboxOption> picklistToCheckboxOptions(List<Schema.PicklistEntry> pPicklist, String labelText,Boolean toLowerCase,Set<String> checkedValues) {
    	List<asb_CheckboxOption> options = new List<asb_CheckboxOption>();
    	if(pPicklist != null){
	    	for (Schema.PicklistEntry e : pPicklist) {	    		
		        if( String.isEmpty(labelText) ){
		        	options.add(new asb_CheckboxOption(e.getValue(),e.getLabel(),checkedValues.contains(e.getValue())));
		        }else{
		        	String label;
		        	if (toLowerCase && e.getLabel() != null) label = e.getLabel().toLowerCase();
		        	else label = e.getLabel();
		        	options.add(new asb_CheckboxOption(e.getValue(), labelText.replace('{0}', label) ,checkedValues.contains(e.getValue())));
		        }
	    	}
    	}
        return options;
    }
	
	public static List<SelectOption> picklistToSelectOptions(List<Schema.PicklistEntry> pPicklist) {
     	return picklistToSelectOptions(pPicklist, '');
    }
	
    /*
     * Return a list of all the values in a picklist.
     */
    public static List<String> getPicklistValues(List<Schema.PicklistEntry> pPicklist) {
    	List<String> values = new List<String>();
    	for (Schema.PicklistEntry e : pPicklist) {
    		values.add(e.getValue());
    	}
    	return values;
    }
    
    public static List<SelectOption> getSelectOptionsFromCheckboxList(List<asb_CheckboxOption> checkboxOptionList){
    	
    	List<SelectOption> options = new List<SelectOption>();
    	if (!isEmpty(checkboxOptionList)){
	    	checkboxOptionList.sort();
	    	for (asb_CheckboxOption cb: checkboxOptionList){
	    		options.add(new SelectOption(cb.getValue(), cb.getLabel()));
	    	}
    	}
    	return options;
    }
    
    public static void removeElement(List<String> lst, String s) {
		if (lst == null) return;
		Integer index = -1;
		for(String item : lst) {
			index++;
			if (item == s) {
				lst.remove(index);
				break;
			}
		}
	}
	
	public static Map<String, String> getLabelLookup(List<Schema.PicklistEntry> picklistEntries) {
		Map<String, String> labelLookup = new Map<String, String>();
		for (Schema.PicklistEntry ple : picklistEntries) {
			labelLookup.put(ple.getValue(), ple.getLabel());
		}
		return labelLookup;
	}

	public static Map<Id, SObject> getIdMap(List<SObject> objList) {
		if (objList == null) return null;
		Map<Id, SObject> idMap = new Map<Id, SObject>();
		for (SObject o : objList) {
			idMap.put(o.id, o);
		}
		return idMap;
	}
	
    public static Map<String,String> getQueryParamsAsMap(String queryParams) {
    	Map<String,String> queryParamsAsMap = new Map<String,String>();
    	if (String.isEmpty(queryParams)) return queryParamsAsMap;
    	
    	String key,value;
    	
    	for(String s : queryParams.split('&')) {
			if (String.isEmpty(s)) continue;
			
    		String[] keyValPair = s.split('=');
    		if (keyValPair.size() >= 1) {
    			key = keyValPair[0];
    			value = null;
    		}
    		
    		if (keyValPair.size() >= 2) {
    			key = keyValPair[0];
    			value = keyValPair[1];
    		}
    		queryParamsAsMap.put(key,value);
    	}
    	return queryParamsAsMap;
    }
    
}