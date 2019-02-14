({
    doInit : function(component, event, helper) {
        helper.filterReasons(component);
    },
    confidenceChangeHandler : function(component, event, helper){
        helper.filterReasons(component);
	},
    formatStringChangeHandler : function(component, event, helper){
		
	},
    deleteReason : function(component, event, helper){
        let deleteReason = component.getEvent("deleteReason");
        deleteReason.setParams({
            index: component.get('v.index')
        })
        deleteReason.fire();
    }
})