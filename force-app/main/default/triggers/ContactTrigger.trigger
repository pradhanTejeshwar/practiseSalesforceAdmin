trigger ContactTrigger on Contact (after insert, after delete, after undelete) {
    if(Trigger.isInsert) {
        if(Trigger.isAfter) {
            ContactTriggerHandler.totalContactCount(Trigger.new);
            System.debug('Notification : Triggers executed after insertion of the Contact record.');
        }
    }
    if(Trigger.isDelete) {
        if(Trigger.isAfter) {
            ContactTriggerHandler.totalContactCount(Trigger.old);
            System.debug('Notification : Triggers executed after deletion of the Contact record.');
        }
    }
    if(Trigger.isUndelete) {
        if(Trigger.isAfter) {
            ContactTriggerHandler.totalContactCount(Trigger.new);
            System.debug('Notification : Triggers executed after undeletion of the Contact record.');
        }
    }
    System.debug('Notification : All Triggers executed for the Contact record.');
}