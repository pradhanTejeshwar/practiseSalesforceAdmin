/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2025-01-29
 * Last Modification Date: 2025-01-29
 *
 * This is a trigger on the Contact object, designed to fire after insert, delete, and undelete operations.
 * The trigger invokes the `ContactTriggerHandler` class to update the `Total_Contacts__c` field on the related Account objects.
 *
 * Business Use Case:
 * - Ensure that the `Total_Contacts__c` field on Accounts is updated whenever Contacts are inserted, deleted, or undeleted.
 * - This is critical for maintaining an accurate count of Contacts related to each Account.
 *
 * Trigger Events:
 * - **after insert**: Updates Account contact count after a new Contact is inserted.
 * - **after delete**: Updates Account contact count after a Contact is deleted.
 * - **after undelete**: Updates Account contact count after a Contact is undeleted.
 *
 * Dependencies:
 * - The `ContactTriggerHandler.totalContactCount()` method is responsible for performing the DML operations on the Account object.
 * - The trigger should be invoked on Contact DML operations (insert, delete, undelete).
 *
 * Change History:
 * 2025-01-29: Initial version created by Tejeshwar Pradhan.
 * 2025-01-29: Added detailed comments for the code
 * 2025-02-01: Write your changes here...
 */

trigger ContactTrigger on Contact (after insert, after delete, after undelete) {

    // If the trigger event is 'insert'
    if(Trigger.isInsert) {
        if(Trigger.isAfter) {
            // Call the handler to update contact count on related Account records
            ContactTriggerHandler.totalContactCount(Trigger.new);
            System.debug('Notification : Triggers executed after insertion of the Contact record.');
        }
    }
    
    // If the trigger event is 'delete'
    if(Trigger.isDelete) {
        if(Trigger.isAfter) {
            // Call the handler to update contact count on related Account records after deletion
            ContactTriggerHandler.totalContactCount(Trigger.old);
            System.debug('Notification : Triggers executed after deletion of the Contact record.');
        }
    }
    
    // If the trigger event is 'undelete'
    if(Trigger.isUndelete) {
        if(Trigger.isAfter) {
            // Call the handler to update contact count on related Account records after undelete
            ContactTriggerHandler.totalContactCount(Trigger.new);
            System.debug('Notification : Triggers executed after undeletion of the Contact record.');
        }
    }    
    // Final debug message indicating that all trigger events have been processed
    System.debug('Notification : All Triggers executed for the Contact record.');
}