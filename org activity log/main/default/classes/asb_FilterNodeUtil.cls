/**
 * @description Utility class for asb_FilterNode
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_FilterNodeUtil {
	
	public static void preSelectFilters(asb_FilterNode.RootFilterNode root,String filterParams) {
		if (filterParams != null && filterParams.length() > 0) {
			String[] filters = filterParams.split(',',0);
			for(String key : filters) {
				asb_FilterNode n = null;
				Integer eqIdx = key.indexOf('=');
				if (eqIdx > 0) {
					String idVal = key.substring(0,eqIdx);
					String value =  key.substring(eqIdx + 1);
					n = root.findNodeById(idVal,root.getChildren());
					if (n != null) n.setSelectedValue(String.escapeSingleQuotes(value));
				}
				else {					
					try {
						n  = root.findNodeById(key,root.getChildren());
					}catch(Exception e) {

					}
				}
				if (n != null) {
					n.setIsSelected(true);
					root.updateSelectedList(n);
				}
			}
		}
	}   
}