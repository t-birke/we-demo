/**
 * asb_ChartData
 *
 * Class for storing data points to be plotted onto a chart.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
 public class asb_ChartData {
    public Date data_date_key;
    public Integer value;
    public String label;
    
    public asb_ChartData(Date dDate, Integer dCount) {
        data_date_key = dDate;
        value = dCount;
    }
    
    public asb_ChartData(String dType, Integer dCount) {
        label = dType;
        value = dCount;
    }
    
    public static String getJSON(List<asb_ChartData> chartData) {
    	Map<String, String> reservedWords = new Map<String, String>();
    	//date is a reserved keyword. We can not use it as member variable name in this class, but it needs to be 'date' in the JSON
    	reservedWords.put('data_date_key', 'date');
    	
    	String jso = JSON.serialize(chartData);
    	//placing reserved words back into the JSON string
    	for (String key : reservedWords.keySet()) {
    		jso = jso.replaceAll(key, reservedWords.get(key));
    	}
    	
    	return jso;
    }
}