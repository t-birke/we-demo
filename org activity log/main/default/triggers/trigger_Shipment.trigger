trigger trigger_Shipment on Shipment (after insert) {
     
    if(trigger.isAfter && trigger.isInsert){

        Shipment []newShipment = Trigger.new;
        blogic_Shipment_CreateTransfer.InsertAfter(newShipment);
        }
     
    }