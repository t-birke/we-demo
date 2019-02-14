/**
 * A asb_FilterNode for a list.
 * @author Copyright (c) 2013 Salesforce.com.
 * @author pnambiar@salesforce.com
 */    
public virtual class asb_ListFilterNode extends asb_FilterNode {
    
        public static final String INCLUDE_ALL_TOKEN = '_ALL_';
    
        private String fieldName;
        public String selectedLabel {get;set;}

        public List<SelectOption> values {get;set;}
        private List<asb_FilterNode> dependents {get;set;}
        public String labelIfNoneSelected;
        private Boolean isMultiSelectDataType;
        
        public asb_ListFilterNode(String idVal, String label,String labelIfNoneSelected,String fieldName,asb_FilterNode parentNode,List<SelectOption> values) {
            super(label,parentNode);
            init(idVal,label,labelIfNoneSelected,fieldName,parentNode,values,asb_FilterNode.ShowAsType.TOP_FILTER,false);
        } 
        
        public asb_ListFilterNode(String idVal, String label,String labelIfNoneSelected,String fieldName,asb_FilterNode parentNode,List<SelectOption> values,ShowAsType showAs,Boolean isMultiSelectDataType) {
            super(label,parentNode);
            init(idVal,label,labelIfNoneSelected,fieldName,parentNode,values,showAs,isMultiSelectDataType);
        }
        
        private void init(String idVal, String label,String labelIfNoneSelected,String fieldName,asb_FilterNode parentNode,List<SelectOption> values,ShowAsType showAs,Boolean isMultiSelectDataType) {
            this.idValue = idVal;
            this.fieldName = fieldName;
            this.values = values;
            if (this.values != null && !String.isEmpty(labelIfNoneSelected)) {
                if (this.values.isEmpty()) {
                    this.values.add(new SelectOption('',labelIfNoneSelected));
                }
                else {
                    this.values.add(0,new SelectOption('',labelIfNoneSelected));
                }
            }
            
            this.showAs = showAs;
            
            listValues = new List<ListOption>();
            if(values!=null){
                for(SelectOption so : values) {
                    listValues.add(new ListOption(String.escapeSingleQuotes(so.getValue()),so.getLabel()));
                }
            }
            
            
            this.labelIfNoneSelected = labelIfNoneSelected;
            this.isMultiSelectDataType = isMultiSelectDataType;
            setSelectedValue('');
        }

        public override void setSelectedValue(String val) {
            this.selectedVal = val;
            
            for(ListOption lo : listValues) {
                if (lo.value == selectedVal) {
                    selectedLabel = lo.label;
                    lo.isSelected = true;
                    break;
                }
            }
            
            if (!String.isEmpty(val)){
                 setIsSelected(true);        
                 if (this.listValues!= null && this.listValues.size() > 0 && this.listValues.get(0).value == '') {
                      this.listValues.get(0).isSelected = false;
                 }
            }    
            else {
                setIsSelected(false);
            }
            
            if (dependents != null) {
                for(asb_FilterNode n : dependents) {
                    n.reinitialize();
                }
            }
        }
        
        public override virtual String getSummaryLabel() {
            if (dependents != null) {
                for(asb_FilterNode n : dependents) {
                    if (n.getIsSelected()) return null;
                }
            }
            return selectedLabel;
        }
        
        public void addDependent(asb_FilterNode n) {
            if (dependents == null) dependents = new List<asb_FilterNode>();
            dependents.add(n);
        }
        
        public virtual override Boolean getIsSelectable() {
            return true;
        }
     
        public override Boolean getShowListAsLinks() {
            return true;
        }
        
        public override String getFilterString() {
            return String.isEmpty(selectedVal) ? null : idValue + '=' + this.selectedVal;
        }
    
        /**
         * Remove me and my dependents from my URL. So that we can set it to the new value selected by the user.
         */
        public override void cleanUpURL() {
            removeFilterIfSelected();
            if (dependents != null) {
                for(asb_FilterNode n : dependents) {
                    Integer index = 0;
                    for (String s : preSelectedFilterQueryParams) {
                        if ((s.contains('=') && s.contains(n.idValue)) || s.equals('#' + n.idValue + '#')) {
                            preSelectedFilterQueryParams.remove(index);
                            break;
                        }
                        index++;
                    }
                }
            }
        }
        
        public virtual override String getResetURL() {
            if (preSelectedFilterQueryParams == null) preSelectedFilterQueryParams = new List<String>();
                removeFilterIfSelected();
            return constructURL();
        }
        
        public override void addMySelfToURL() {         
            preSelectedFilterQueryParams.add('#' + idValue + '#');
        }
        
        public virtual override String getThisFilterOnlyURL() {
            return getThisFilterOnlyURL('#' + this.idValue + '#');
        }

        public virtual override String getWhereClause(String objRef,Boolean bWithCategoryClause) {
                String clause = null;
                if (!String.isBlank(selectedVal) && selectedVal != INCLUDE_ALL_TOKEN) {
                    if (isMultiSelectDataType) {
                        clause = (objRef != null  ? objRef + '.' : '') + fieldName + ' includes (\'' + selectedVal + '\')';
                    }
                    else {
                        clause = (objRef != null  ? objRef + '.' : '') + fieldName + ' = \'' + selectedVal + '\'';
                    }
                }else if(selectedVal == INCLUDE_ALL_TOKEN) {
                    String valuesString = '(\'';
                    for (SelectOption opt : values) {
                        valuesString += opt.getValue() + '\',\'';
                    }
                    if(valuesString != '(\''){
                        valuesString = valuesString.substring(0,valuesString.length()-2);                   
                    }else{
                        valuesString = '(';
                    }
                    valuesString += ')';
                    
                    clause = (objRef != null  ? objRef + '.' : '') + fieldName + ' in ' + valuesString;
                    
                }
                return clause;
        }

}