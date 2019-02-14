({

    doInit: function(component, event, helper) {
        helper.getArticles(component);
    },

    searchKeyChange: function(component, event, helper) {
        component.set ("v.searchKey", event.getParam("searchKey"));
        if(component.get("v.dataCategory")){
	        helper.getArticlesOfDataCategory(component);
        }else{
	        helper.getArticles(component);
        }
    },

    pageChange: function(component, event, helper) {
		var page = component.get("v.page") || 1;
        var direction = event.getParam("direction");
        page = direction === "previous" ? (page - 1) : (page + 1);
        if(component.get("v.dataCategory")){
	        helper.getArticlesOfDataCategory(component, page);
        }else{
					helper.getArticles(component, page);
        }
	},

    doneRendering: function(component, event, helper){
        let doneRendering = component.get('v.doneRendering');
        if(!doneRendering){
            component.set('v.doneRendering', true);
            var parentWidth = $('.searchKey').parent().parent().parent().width();
            if(parentWidth < 280) {
                $(".summaryCol").hide();
                
            }
            
            var allowCS = component.get("v.contactSupport");
            if(!(component.get("v.contactSupport"))){
                $(".csLink").hide();
            }
            
            var newPlaceholder = component.get("v.searchPlaceholder");
            $(".searchKey").attr('placeholder', newPlaceholder);
        }
	},
    showCategoryArticles: function(component, event, helper){
        component.set("v.dataCategory", event.getParam("data_category") );
  	    helper.getArticlesOfDataCategory(component);
    }
})