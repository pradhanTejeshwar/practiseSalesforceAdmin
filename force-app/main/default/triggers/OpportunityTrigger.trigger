trigger OpportunityTrigger on Opportunity (before insert, after update) {
    if (Trigger.isInsert) {
        // Before Insert: Validation Amount Null
        if (Trigger.isBefore) {
            OpportunityTriggerHandler.validateAmountNull(Trigger.new);
        }
    }
    if (Trigger.isUpdate) {
        // After Update: Update Description
        if (Trigger.isAfter) {
            if(!preventRecursion.firstCall){
                preventRecursion.firstCall = true;
                OpportunityTriggerHandler.udpateDescription(Trigger.new, Trigger.oldMap);
            }
            System.debug('Notification : Triggers executed before update of the Opportunity record.');
        }
    }
}