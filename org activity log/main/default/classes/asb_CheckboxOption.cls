/**
  * This class is used to store each checkbox option data
  *
  */
public class asb_CheckboxOption implements Comparable{
	
	private String value;
   	private String label;
   	private Boolean checked;
   		
   	public asb_CheckboxOption(String value, String label, Boolean checked){
   		this.value = value;
   		this.label = label;
   		this.checked = checked;
   	}
   		
   	public String getValue(){
   		return this.value;
   	}
   	
   	public void setValue(String val){
   		this.value = val;
   	}
   		
   	public String getLabel(){
   		return this.label;
   	}
   	
   	public void setLabel(String lab){
   		this.label = lab;
   	}
   		
   	public Boolean getChecked(){
   		return this.checked;
   	}
   	
   	public void setChecked(Boolean check){
   		this.checked = check;
   	}
   	
   	public Integer compareTo(Object objectToCompare) {
   		asb_CheckboxOption optionToCompare = (asb_CheckboxOption) objectToCompare;
   		return this.label.compareTo(optionToCompare.label);
	}
}