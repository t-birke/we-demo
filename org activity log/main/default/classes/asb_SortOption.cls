/**
 * Represents a Search Sort Option
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_SortOption {

	public String label {get;set;}
	public Integer sortByCode {get;set;}
	public String sortByAttribute {get;set;}
	public Boolean selected {get;set;}
	public String resultsLabel {get;set;}
	
	public asb_SortOption(String label, Integer sortByCode, String sortByAttribute, Boolean isSelected) {
		this(label, sortByCode, sortByAttribute, null);
	}
	
	public asb_SortOption(String label, Integer sortByCode, String sortByAttribute, String resultsLabel, Integer currentSortCode) {
		this.label = label;
		this.sortByCode = sortByCode;
		this.sortByAttribute = sortByAttribute;
		this.resultsLabel = resultsLabel;
		this.selected = sortByCode == currentSortCode;
	}
	
	public class ColumnSortOptions {
		public asb_SortOption ascendingOption {get; private set;}
		public asb_SortOption descendingOption {get; private set;}
		public Boolean ascendingIsDefault {get; private set;}
		public Boolean columnIsSelected {get; private set;}
		
		public ColumnSortOptions(asb_SortOption ascendingOption, asb_SortOption descendingOption, Boolean ascendingIsDefault) {
			this.ascendingOption = ascendingOption;
			this.descendingOption = descendingOption;
			this.ascendingIsDefault = ascendingIsDefault;

			this.columnIsSelected = ascendingOption.selected || descendingOption.selected; 
		}

		public asb_SortOption getNextOption() {
			asb_SortOption defaultOption = ascendingIsDefault ? ascendingOption : descendingOption;
			asb_SortOption nondefaultOption = ascendingIsDefault ? descendingOption : ascendingOption;
			return defaultOption.selected ? nondefaultOption : defaultOption;
		}
	}
}