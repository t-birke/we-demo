/**
 * asb_FilterNode
 *
 * Presents a model for the various 'search filter' categories.  The
 * 'Search Results' and the 'Browse Apps' pages both present category
 * structures that look like this:
 *
 * Key Attributes      Type of App              Industry Solutions
 * - Free              - Dashboards & Reports   - Communications
 * - Paid              - Plugins                - Education
 *   ...                 ...                      ...
 *
 * The purpose of this class is to encapsulate everything we have to know
 * about this structure.  This will allow for easy extension if new
 * filtering requirements present themselves.
 *
 * The FilterNode class actually does several things:
 *
 * 1. Provides a unified API for 'builtin' and 'category' filters
 * 2. Describes a hierarchical display grouping of the filters
 * 3. Encapsulates logic for constructing search predicates
 * 4. Provides state management for search filter selections (i.e. checkboxes)
 *
 * Each of these responsibilities is described in more detail below.
 *
 * NOTE: Given the variety of purposes this class serves, it
 * could well be argued that it is overloaded.  At the
 * moment, things here are simple enough that it doesn't really seem worth
 * the overhead to factor it into separate abstractions, but it may make
 * sense to do so in the future.
 *
 *
 * 1. Provide a unified API for 'builtin' and 'category' filters
 *
 * Conceptually, there are two kinds of 'filters': Builtin filters and
 * Category filters.  Builtin filters use hard-coded criteria to describe
 * a subset of the Listings, such as 'Edition == Professional' or
 * 'PriceFree == True.'  Category filters, on the other hand, define subsets
 * of Listings based on the Listings' associations with Category objects in
 * the database.  Therefore, additional category filters can be added by simply
 * adding new Category objects to the database; the set of Builtin filters,
 * on the other hand, cannot be changed without modifying the code in
 * this file.
 *
 *
 * 2. Describe a hierarchical display grouping of the filters
 *
 * A second purpose of this class is to organize the filters into a
 * display hierarchy.  This tree structure in general looks something
 * like this:
 *
 *                          Root
 *               +-----------+-----------+
 *             Group                   Group (based on CategoryType)
 *       +-------+------+          +-----+-------+
 *      Builtin      Builtin    Category     Category
 *                                        +------+-------+
 *                                 (sub)Category  (sub)Category
 *
 *
 * Note that there is a Root FilterNode, which doesn't do anything other
 * than provide the convenience of a single-rooted hierarchy.  There also
 * is a first tier of grouping FilterNodes, which are simply used to
 * visually organize the filters into broad groups per the spec (e.g.,
 * 'Key Attributes' or 'Industry Solutions').
 *
 * Each of these different types of FilterNodes is handled by a different
 * private FilterNode subclass.  Consumers of the API should never care
 * that these subclasses exist.
 *
 *
 * 3. Encapsulate logic for constructing search predicates
 *
 * FilterNode provides methods for constructing dynamic SOQL WHERE clauses
 * that can be used in actually executing queries that take the filters
 * into account.  These methods work by descending the tree and allowing
 * each node to append a piece of the predicate that expresses wat
 * the filter represents.
 *
 *
 * 4. Provide state management for filter checkboxes in the UI
 *
 * Finally, the FilterNode class also provides a way for us to track a user's
 * selections in the filter tree that appears on the left side of the
 * search results page.  Most nodes have a boolean 'isSelected' value that
 * can be toggled by the checkbox; this in turn affects which filters
 * are used in generating search predicates.
 *
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author pcal@salesforce.com,pnambiar@salesforce.com
 */

public virtual class asb_FilterNode  {

    // =======================================================================
    // Constants

    /**
     * Provides static identifiers for the various builtin filters.  This
     * is mainly useful in constructing links into the search results page.
     * (See ResultsPageController createLink()).
     *
     * IMPORTANT: These enum names are used to recongnize inbound links
     * from outside the appexchange application - they embody part of our
     * contract with the outside world.  Accordingly, these cannot be
     * changed.  If you need something new, you can add a new one, but you
     * must ensure that the old ones continue to be supported.
     */

    // =======================================================================
    // Main entry point


    // =======================================================================
    // Fields

    protected String label;
    protected Boolean isSelected = false;

    protected List<asb_FilterNode> children = null;

    protected Integer count = 0;
    protected String summaryLabel;
    protected asb_FilterNode parentNode;
    protected asb_FilterNode childNodeWithAtleastOneChildSelected;
    protected String styleClass;
    public String idValue {get; set;}
    public ShowAsType showAs {get; set;}
    public enum ShowAsType {LEFT_NAV_FILTER,TOP_FILTER}
    public Boolean multiSelect {get;set;}
    
    public List<String> preSelectedFilterQueryParams {get;set;}
    public String preSelectedQueryParams {get;set;}
    public String pageName {get;set;}
    public Boolean showUserFriendlyURLs {get;set;}
    public Boolean hideInGUI {get;set;}
    
    public asb_FilterNode selectedChild {get;set;}
    
    /**
     * selectedVal and listValues are only used by asb_ListFilterNode. But in the VF page (results), if I use dynamic binding f1['listValues'] to refer to it, 
     * it works fine initially, but gives apex errors during partial page refresh (screenshot overlays dont work for example). Moving them here, fixes the 
     * problem.
     **/
    public String selectedVal {get;set;}
    public List<ListOption> listValues {get;set;}
 
    public virtual Boolean getShowInLeftNav() {
    	return showAs == null && parentNode != null ? parentNode.getShowInLeftNav() : showAs == ShowAsType.LEFT_NAV_FILTER;
    }
    
    public virtual Boolean getShowAsTopFilter() {
    	return showAs == null && parentNode != null ? parentNode.getShowAsTopFilter() : showAs == ShowAsType.TOP_FILTER;
    }
    
    public virtual Boolean getShowListAsLinks() {
    	return false;
    }
    
   
    public virtual Boolean getShowAsSlider() {
    	return false;
    }
    
    public virtual String getSummaryLabel() {
    	if (!getIsSelectable()) {
    		return null;
    	}
        return (summaryLabel == null) ?  label : summaryLabel;
    }

    public String getId() {
        return (summaryLabel == null) ?  label : summaryLabel;
    }

    /**
     * Returns a displayable name for this filter.
     */
    public String getLabel() {
    	return label;
    }

    /**
     * Returns a displayable style-class for this filter.
     */    
    public virtual String getStyleClass() {
        return styleClass;
    }

    /**
     * Return whether the given node is selected (i.e. checked) in the view.
     */
    public virtual Boolean getIsSelected() {
        return isSelected;
    }

	public virtual String getLandingPage() {
		return null;
	}
	
	public virtual void setSelectedValue(String s) {
	}
	
	
	public virtual String getFilterString() {
		return idValue;
	}
		
    /**
     * Set whether the given node is selected (i.e. checked) in the view.
     */
    public virtual void setIsSelected(Boolean b) {
        isSelected = b;
        if (parentNode != null) parentNode.updateSelectedChild(this,this);
    }
    
    /*
     * Show me on the GUI only if none of my siblings are selected or my sibling's children are selected. 
     * This method is only used in the first level of filters
     */
    public virtual Boolean getShow() {
    	return parentNode.childNodeWithAtleastOneChildSelected == null || 
    	(parentNode.childNodeWithAtleastOneChildSelected == this) ||
    	(parentNode.childNodeWithAtleastOneChildSelected != null && !parentNode.childNodeWithAtleastOneChildSelected.getHasChildren());
    }
    
    /*
     * Show my children if I am selected or if one of my children is selected
     */
    public virtual Boolean getShowChildren() {
    	return getIsSelected() || getIsAtleastOneChildSelected();
    }

	/*
	 * This method generates the filter URL to select this filter only. All otehr filers will be deselected. 
	 * Only type and show tiles param are remembered 
	 */
	public virtual String getThisFilterOnlyURL() {
		return getThisFilterOnlyURL(this.idValue);
	}
	
	protected String getThisFilterOnlyURL(String idVal) {
		Map<String,String> tempMap = asb_ListUtils.getQueryParamsAsMap(preSelectedQueryParams);
		String searchType = null;
		
		if (tempMap != null) {
			searchType = tempMap.get(asb_SearchUtil.SEARCHTYPE_PARAM);
		}
		
		String qs = '';
		if (!String.isEmpty(searchType)) {
        	qs = asb_SearchUtil.SEARCHTYPE_PARAM + '=' + searchType;
        }  
        
        qs += '&' + asb_SearchUtil.FILTER_PARAM + '=' + idVal;
        
        if (qs.indexOf('&') == 0) {
        	qs = qs.substring(1);
        }
        
		return '/apex/asb_home?' + qs;
	}
	
	public virtual String getThisFilterOnlyEscapedURL() {
		return EncodingUtil.urlEncode(getThisFilterOnlyURL(),'UTF-8');
	}
	
	
	public virtual String getURL() {
		if (preSelectedFilterQueryParams == null) preSelectedFilterQueryParams = new List<String>();
		
		cleanUpURL();
		
		if (parentNode != null && parentNode.multiSelect != null && parentNode.multiSelect && getIsSelected()) {
			asb_ListUtils.removeElement(preSelectedFilterQueryParams,idValue);
		}
		else addMySelfToURL();
		

		return constructURL();
	}
	
	public virtual String getEscapedURL() {
		return EncodingUtil.urlEncode(getURL(),'UTF-8');
	}
	
	public virtual void cleanUpURL() {
		/*
		 * If parent or any of the siblings are selected, unselect them when constructing the URL for this node.
		 */
		if (parentNode != null) {
			if (parentNode.getIsAtleastOneChildSelected()) {
				asb_ListUtils.removeElement(preSelectedFilterQueryParams,parentNode.selectedChild.idValue);				
			}
			
			if (parentNode.getIsSelected()) {
				asb_ListUtils.removeElement(preSelectedFilterQueryParams,parentNode.idValue);
			}
		}
	}
	
	public virtual void addMySelfToURL() {
		preSelectedFilterQueryParams.add(idValue);
	}
	
	protected Boolean removeFilterIfSelected() {
		Boolean bFound = false;
		Integer index = 0;
		for (String s : preSelectedFilterQueryParams) {
			if ((s.contains('=') && s.contains(idValue)) || s.equals('#' + idValue + '#')) {
				preSelectedFilterQueryParams.remove(index);
				bFound = true;
				break;
			}
			index++;
		}
		return bFound;
	}
	
	public virtual String getResetURL() {
		if (preSelectedFilterQueryParams == null) preSelectedFilterQueryParams = new List<String>();
		cleanUpURL();
		if (parentNode != null) {
			if (getIsAtleastOneChildSelected()) {
				asb_ListUtils.removeElement(preSelectedFilterQueryParams,selectedChild.idValue);
			}			
		}
		return constructURL();
	}
	
	public virtual String getEscapedResetURL() {
		return EncodingUtil.urlEncode(getResetURL(),'UTF-8');
	}
	
	
	protected String constructURL() {
		String f = '';
		if (preSelectedFilterQueryParams != null && preSelectedFilterQueryParams.size() > 0) {
		for (String s : preSelectedFilterQueryParams) {
			if (f != '') f += ',';
			f += s;
		}
		}
		
		String qs = '';
		if (!String.isEmpty(preSelectedQueryParams)) {
			qs += '?' + preSelectedQueryParams;
			if (!String.isEmpty(f)) qs += '&filter=' + EncodingUtil.urlEncode(f,'UTF-8');
		}
		else if (!String.isEmpty(f)) {
			qs += '?filter=' + EncodingUtil.urlEncode(f,'UTF-8');
		}
		return String.isEmpty(pageName) ? qs : pageName + qs;
	}
	
	/*
	 * Let the parent know that a child was selected. So that the parent can be shown as a link on the page.
	 */
	private virtual void updateSelectedChild(asb_FilterNode n,asb_FilterNode mySelectedChild) {
		if (parentNode == null || (getShowAsCheckbox() != null && getShowAsCheckbox())) {
			return;
		}
		if (n.getIsSelected()) {
			if (selectedChild != null) selectedChild.isSelected = false;
			childNodeWithAtleastOneChildSelected = mySelectedChild;
			selectedChild = n;
		}
		else {
			if (selectedChild != null && selectedChild.idValue == n.idValue) {
				selectedChild = null;
				childNodeWithAtleastOneChildSelected = null;
			}
			
		}
		if (parentNode != null) parentNode.updateSelectedChild(n,this);
	}
	
	public Boolean getIsAtleastOneChildSelected() {
		return selectedChild != null && selectedChild.getIsSelected();
	}
	
	/*
	 * unselect the children to clear this filter
	 */
	public virtual void resetSelectedChild() {
		if (selectedChild != null) {
			selectedChild.setIsSelected(false);
			selectedChild = null;
		}
	}
	
    /**
     * Returns whether the given node can potentially be selected in
     * the search filter tree.  The root node and nodes one tier below
     * it cannot be selected.
     */
    public virtual Boolean getIsSelectable() {
        return false;
    }

    public virtual void setParentNode(asb_FilterNode n) {
    	parentNode = n;
    	if (parentNode != null) {   		
    		this.preSelectedFilterQueryParams = parentNode.preSelectedFilterQueryParams != null ? parentNode.preSelectedFilterQueryParams.clone() : null;
    		this.preSelectedQueryParams = parentNode.preSelectedQueryParams;
    		this.pageName = parentNode.pageName;
    		this.showUserFriendlyURLs = parentNode.showUserFriendlyURLs;
    	}
    }
	
	public asb_FilterNode getParentNode(){
		return parentNode;
	}

	protected virtual String getPredicate() {
		return null;
	}

	public virtual asb_FilterNode findNode(String label) {
			if (getHasChildren()) {
				for(asb_FilterNode n : getChildren()) {
					if (n.getId() != null && n.getId().equals(label)) {
						return n;
					}
					else {
						asb_FilterNode n2 = n.findNode(label);
						if (n2 != null) {
							return n2;
						}
					}
				}
			}
			return null;
	}

    /**
     * Returns a SOQL WHERE clause fragment that can be used in queries using
     * this filter.  The where clauses returned by multiple filters can be
     * used to gether by simply concatenating them with the string ' AND '.
     */
     public virtual String getWhereClause(String objRef,Boolean bWithCategoryClause) {
     	return null;
	 }

    /**
     * Returns a SOQL WITH DATA CATEGORY clause fragment that can be used in queries using
     * this filter.  The with data category clauses returned by multiple filters can be
     * used together by simply concatenating them with the string ' AND '.
     */
     public virtual String getWithDataCategoryClause() {
     	return null;
	 }


    /**
     * Returns the children of this node.
     */
    public List<asb_FilterNode> getChildren() {
        return children;
    }
    
    /**
     * Returns the children of this node.
     */
    public List<asb_FilterNode> getDisplayChildren() {
    	if (children == null) return children;
    	List<asb_FilterNode> subList = new List<asb_FilterNode>();
    	for(asb_FilterNode n : children) {
    		if (n.hideInGUI == null || !n.hideInGUI) {
    			subList.add(n);
    		}
    	}
        return subList;
    }

    /**
     * Convenience method for the view, just returns whether this node
     * has children.
     */
    public Boolean getHasChildren() {
        return children != null && children.size() > 0;
    }
    
    public virtual void reinitialize() {
    	
    }

    // =======================================================================
    // Private/protected methods


    /**
     * No need to construct these yourself - just use getFilterTree().
     */
    protected asb_FilterNode(String label,asb_FilterNode parent) {
       System.assert(label != null, 'label must not be null');
       this.label = label;
       this.parentNode = parent;
       hideInGUI = false;
       if (parent != null) {
			this.preSelectedFilterQueryParams = parent.preSelectedFilterQueryParams != null ? parent.preSelectedFilterQueryParams.clone() : null;
       		this.preSelectedQueryParams = parent.preSelectedQueryParams;
       		this.pageName = pageName;
       		this.showUserFriendlyURLs = parentNode.showUserFriendlyURLs;
       }
    }

    protected asb_FilterNode(String label,String styleClass) {
       System.assert(label != null, 'label must not be null');
       this.label = label;
       this.idValue = label;
       this.styleClass = styleClass;
       hideInGUI = false;
    }

    /**
     * Adds a child asb_FilterNode.
     */
    public void add(asb_FilterNode node) {
        if (node == null) return;
        if (children == null) children = new List<asb_FilterNode>();
        children.add(node);
        node.setParentNode(this);
    }

    public virtual Boolean getShowAsCheckbox() {
    	return multiSelect != null && multiSelect;
    }
  

    // =======================================================================
    // Inner classes - API consumers never see these

    /**
     * A GroupFilterNode at the root of the tree.  This is never rendered or
     * really used for much - it's just a little bit easier for us to process
     * a singly-rooted hierarchy.
     */
    public class RootFilterNode extends GroupFilterNode {
    	List<asb_FilterNode> orderedSelectedNodes = new List<asb_FilterNode>();
        public RootFilterNode() {
            super('[root]',null);
            
        }
        
        public RootFilterNode(String filterQS, String qs) {
            super('[root]',null);
            this.preSelectedFilterQueryParams = filterQS != null ? filterQS.split(',') : new List<String>();           
            this.preSelectedQueryParams = qs;
        }
        
        public RootFilterNode(String filterQS, String qs,String pg,Boolean showUserFriendlyURLs) {
            super('[root]',null);
            this.preSelectedFilterQueryParams = filterQS != null ? filterQS.split(',') : new List<String>();           
            this.preSelectedQueryParams = qs;
            this.pageName = pg;
            this.showUserFriendlyURLs = showUserFriendlyURLs;
        }
        
        public void updateSelectedList(asb_FilterNode n) {
			if (n.getIsSelected()) {
				Boolean alreadySelected = false;
				for (asb_FilterNode so : orderedSelectedNodes) {
					if (so.idValue == n.idValue) {
						alreadySelected = true;
						break;
					}
				}
				if (!alreadySelected) orderedSelectedNodes.add(n);
			}
			else {
				Integer i = 0;
				for(asb_FilterNode fn : orderedSelectedNodes) {
					if (fn.idValue == n.idValue) {
						orderedSelectedNodes.remove(i);
						break;
					}
					i++;
				}
			}
		}
		
		public void resetTopFilters() {
			for (asb_FilterNode so : orderedSelectedNodes) {
				if (so.getShowAsTopFilter()) {
					so.setIsSelected(false);
				}
			}
			
		}
		
		public void resetLeftNavFilters() {
			for (asb_FilterNode so : orderedSelectedNodes) {
				if (so.getShowInLeftNav()) {
					so.setIsSelected(false);
				}
			}
			
		}
        
        public List<asb_FilterNode> getOrderedSelectedNodes() {	
        	List<asb_FilterNode> tempList = new List<asb_FilterNode>();
        	if (orderedSelectedNodes != null) {
        		for(asb_FilterNode n : orderedSelectedNodes) {
        			if (n.getIsSelected()) tempList.add(n);
        		}
        	}
        	orderedSelectedNodes = tempList;
        	return orderedSelectedNodes;
        }

        public String getFiltersForURL() {
        	String s = '';
        	if (orderedSelectedNodes == null) return s;
        	for(asb_FilterNode n : orderedSelectedNodes) {
        		String str = n.getFilterString();
        		if (!String.isEmpty(str)) {
        			s = s == '' ?  str : s + ',' + str;
        		}
        	}
        	return s;
        }
        
        public String getLeftNavFiltersForURL() {
        	String s = '';
        	if (orderedSelectedNodes == null) return s;
        	for(asb_FilterNode n : orderedSelectedNodes) {
        		if (!n.getShowInLeftNav()) continue;
        		String str = n.getFilterString();
        		if (!String.isEmpty(str)) {
        			s = s == '' ?  str : s + ',' + str;
        		}
        	}
        	return s;
        }

		public override virtual String getWhereClause(String objRef,Boolean bWithCategoryClause) {

     		List<asb_FilterNode> selectedNodes = getOrderedSelectedNodes();
     		if (selectedNodes == null || selectedNodes.size() == 0) return null;
     		String whereClause = '';
     		String clause;
     		for(asb_FilterNode n : selectedNodes) {
     			clause = n.getWhereClause(objRef,bWithCategoryClause);
     			if (clause != null && clause != '')
     				whereClause = (whereClause == '') ? clause : whereClause + ' AND ' + clause;
     		}
     		return whereClause;
		}

		public override virtual String getWithDataCategoryClause() {

     		List<asb_FilterNode> selectedNodes = getOrderedSelectedNodes();
     		if (selectedNodes == null || selectedNodes.size() == 0) return null;
     		String withClause = '';
     		String clause;
     		for(asb_FilterNode n : selectedNodes) {
     			clause = n.getWithDataCategoryClause();
     			if (!String.isEmpty(clause))
     				withClause = (withClause == '') ? clause : withClause + ' AND ' + clause;
     		}
     		return withClause;
		}


		public asb_FilterNode findPicklistNode(String filter, String fieldname) {

			List<asb_FilterNode> allnodes = getChildren();
			for(asb_FilterNode node : allnodes){
			if (node instanceof PickListGroupFilterNode) {
					if(((PickListGroupFilterNode)node).getFieldName() == fieldname){
				for (asb_FilterNode n : node.getChildren()) {
					if (((PickListItemFilterNode)n).getKey() == filter) {
						return n;
					}
				}
			}
				}
			}
			return null;
		}

		public void unselectAllNodes() {
			if (orderedSelectedNodes == null || orderedSelectedNodes.size() < 1) {
				return;
			}

     		for(asb_FilterNode n : orderedSelectedNodes) {
     			n.setIsSelected(false);
     		}
     		orderedSelectedNodes.clear();
		}
    }


    /**
     * FilterNode which represents a fixed, unselectable grouping of
     * other FilterNodes.
     */
    public virtual class GroupFilterNode extends asb_FilterNode {
       
        public GroupFilterNode(String label) {
            super(label,'');
            this.showAs = ShowAsType.LEFT_NAV_FILTER;
        }
        
        public GroupFilterNode(String label,ShowAsType s) {
            super(label,'');
            this.showAs = s;
        }

		public override virtual Boolean getShowAsCheckbox() {
    		return (multiSelect != null && multiSelect);
    	}
    
        private asb_FilterNode findSelectedNode(List<asb_FilterNode> children) {
        	if (children == null) return null;
        	for(asb_FilterNode n1 : children) {
        		if (n1.getIsSelected()) return n1;
				asb_FilterNode n2 = findSelectedNode(n1.getChildren());
				if (n2 != null) return (asb_FilterNode)n2;
        	}
        	return null;
        }

        public asb_FilterNode findSelectedNode() {
			if (!getHasChildren()) {
				return null;
			}
			return findSelectedNode(getChildren());
		}

		public asb_FilterNode findNodeById(String selectedIdVal,List<asb_FilterNode> nodes) {
        	if (nodes == null) return null;
        	for(asb_FilterNode n1 : nodes) {
        		if (n1.idValue == selectedIdVal) return n1;
				asb_FilterNode n2 = findNodeById(selectedIdVal,n1.getChildren());
				if (n2 != null) return (asb_FilterNode)n2;
        	}
        	return null;
        }

        public asb_FilterNode findNodeById(String catId) {
			if (!getHasChildren()) {
				return null;
			}
			return findNodeById(catId,getChildren());
		}


    }

   public virtual class PicklistGroupFilterNode extends GroupFilterNode {
        String fieldName;
        public PicklistGroupFilterNode(String label,String fieldName) {
            super(label,null);
            this.fieldName = fieldName;
        }

        public String getFieldName(){
        	return fieldName;
        }

    }

    public class PickListItemFilterNode extends asb_FilterNode {

        private String key;
        private String predicate;
        private String fieldName;
		private Boolean isMultipicklist;

        public PickListItemFilterNode(String fieldName,String label, String pred, String key) {
            super(label,'');            
            System.assert(key != null, 'key must not be null');
            System.assert(pred != null, 'pred must not be null');
            this.key = key;
            this.predicate = pred;
            this.fieldName = fieldName;
            this.idValue = key;
			this.isMultipicklist = true;
        }
		
		public PickListItemFilterNode(String fieldName,String label, String pred, String key, Boolean isMP) {
            super(label,'');            
            System.assert(key != null, 'key must not be null');
            System.assert(pred != null, 'pred must not be null');
            this.key = key;
            this.predicate = pred;
            this.fieldName = fieldName;
            this.idValue = key;
			this.isMultipicklist = isMP;
        }
		
        public override Boolean getIsSelectable() {
            return true;
        }

        public override String getWhereClause(String objRef,Boolean bWithCategoryClause) {
			if (!isMultipicklist)
				return (objRef != null  ? objRef + '.' : '') + fieldName + ' = \'' + predicate + '\'';
        	return (objRef != null  ? objRef + '.' : '') + fieldName + ' includes (\'' + predicate + '\')';
        }

        public String getKey() {
        	return key;
        }
    }

    /**
     * A FilterNode for filtering by Salesforce edition.
     *
     * FIXME need to add logic and/or subclasses here to handle
     * generating the appropriate WHERE clauses for the various
     * builtin filters.
     */
    public class BuiltinFilterNode extends asb_FilterNode {

        private String key;
        private String predicate;
		private String landingPageId;

        public BuiltinFilterNode(String label, String pred, String key,String landingPageId,String styleClass) {
            super(label, styleClass);
            System.assert(key != null, 'key must not be null');
            System.assert(pred != null, 'pred must not be null');
            this.key = key;
            this.predicate = pred;
            this.idValue = key;
            this.multiSelect = true;
            this.landingPageId = landingPageId;
        }
        
        public override Boolean getIsSelectable() {
            return true;
        }

        public override String getWhereClause(String objRef,Boolean bWithCategoryClause) {
        	if (getIsSelected()) {
        		return (objRef != null  ? objRef + '.' : '') + predicate;
        	}
        	return null;
        }

        public String getKey() {
        	return key;
        }

        public override String getLandingPage() {
        	return landingPageId; //(landingPageId == null) ? null : LandingPage.getById(landingPageId);
        }
    }

        
        
        public class ListOption {
        	public String value {get;set;}
        	public String label {get;set;}
        	public String styleClass {get;set;}
        	public Boolean isSelected {get;set;}
        	
        	public ListOption(String v,String l) {
        		value = v;
        		label = l;
        		isSelected = false;
        	}
        	
        	public ListOption(String v,String l,String sc) {
        		value = v;
        		label = l;
        		isSelected = false;
        		styleClass = sc;
        	}
        }
}