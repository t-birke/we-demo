trigger trigger_AR_SAUpdate on AssignedResource (after insert, after update) {     
   
    if(trigger.isAfter && trigger.isUpdate){

        AssignedResource []newAssignedResource = Trigger.new;
           blogic_SA_AssignedResourceUpdate.UpdateAfterSchedule(newAssignedResource);
        }
}