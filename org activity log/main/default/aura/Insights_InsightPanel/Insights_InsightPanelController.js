({
	doInit : function(component, event, helper) {
        let recordId = component.get('v.recordId');
        helper.renderPanel(component, {
            type: recordId.startsWith('001') ? 'c:Insights_AccountInsights' : 'c:Insights_OpportunityInsights',
            attributes: {
                recordId: component.get('v.recordId')
            }
        });
	},
    renderPanel: function(component, event, helper) {
        var params = event.getParams();
        helper.renderPanel(component, params);
    },
})