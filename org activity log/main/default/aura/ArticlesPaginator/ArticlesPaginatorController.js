({
	previousPage : function(component, event, helper) {
        var myEvent = $A.get("e.c:ArticlePageChange");
        myEvent.setParams({ "direction": "previous"});
        myEvent.fire();
	},
	nextPage : function(component, event, helper) {
        var myEvent = $A.get("e.c:ArticlePageChange");
        myEvent.setParams({ "direction": "next"});
        myEvent.fire();
	}
})