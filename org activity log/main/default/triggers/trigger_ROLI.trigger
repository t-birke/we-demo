trigger trigger_ROLI on ReturnOrderLineItem (after insert) {
     
    if(trigger.isAfter && trigger.isInsert){

        ReturnOrderLineItem[] newReturnOrderLineItem = Trigger.new;
        blogic_ROLI_CreateTransfer.InsertAfter(newReturnOrderLineItem);
        }
     
    
}