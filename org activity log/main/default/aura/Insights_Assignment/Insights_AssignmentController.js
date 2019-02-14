({
    handleSelect : function(component, event, helper) {
        let selected = event.getParam("value")
        let assignment = component.get('v.assignment')
        let sessionId = component.get('v.sessionId')
        
        switch(selected){
            case 'activate':
                
                helper.sendRequest(component, 'c.httpRequest', {
                    auth: sessionId,
                    endpoint: '/services/data/v43.0/sobjects/RecordRecommendation/' + assignment.Id + '?_HttpMethod=PATCH',
                    method: 'POST',
                    data: JSON.stringify({"RecommendationStatus": "New"})
                }, function(component){
                    component.set('v.assignment', Object.assign(assignment, {RecommendationStatus: 'New'}))
                })
                .then(function(){
                    return helper.showToast(component, {
                        message: 'Recommendation Successfully Updated',
                        type: 'success'
                    })
                })
                break;
                
            case 'delete':
                helper.sendRequest(component, 'c.deleteData', { 
                    recordIds: assignment.Id
                })
                .then(function(){
                    return helper.showToast(component, {
                        message: 'Recommendation Successfully Deleted',
                        type: 'success'
                    });
                })
                .then(function(){
                    component.destroy()
                })
                
                break;
            default:
                return false;
                break;
        }
    },
})