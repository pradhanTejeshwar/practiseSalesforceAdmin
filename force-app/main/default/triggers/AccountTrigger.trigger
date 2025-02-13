/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-29
* Last Modification Date: 2025-01-29
*
* This trigger handles business logic operations on the Account object.
* It is designed to ensure data consistency and automation through
* various trigger events (before insert, after insert, before update, after update, before delete).
*
* Business Use Case:
* - Automatically update the Description field when an Account is inserted or updated.
* - Automatically set or update the Rating field for new and updated Accounts.
* - Create a related Opportunity when an Account is inserted.
* - Update the related Contact's Phone field when an Account is updated.
*
* Assumptions:
* - The AccountTriggerHandler class contains necessary logic for handling these operations.
* - All required fields and relationships are properly configured in Salesforce.
*
* Dependencies:
* - Requires appropriate field-level security and object permissions.
* - Relies on AccountTriggerHandler for handling business logic.
*
* Change History:
* 2025-01-29: Initial version created by Tejeshwar Pradhan.
* 2025-01-31: Added comments to the code
* 2025-02-01: Write your changes here...
*/
trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete) {    
    
    // Handle Account Insert Operations
    if (Trigger.isInsert) {
        
        // Before Insert: Update Description and Rating fields
        if (Trigger.isBefore) {
            AccountTriggerHandler.updateDescription(Trigger.new); // Populate Description if it's null
            AccountTriggerHandler.updateRating(Trigger.new, null); // (Commented out) Optionally update Rating
            System.debug('Notification : Triggers executed before insertion of the Account record.');
        }
        
        // After Insert: Create a related Opportunity
        if (Trigger.isAfter) {
            AccountTriggerHandler.createRelatedOpportunity(Trigger.new); // Creates an Opportunity linked to the Account
            System.debug('Notification : Triggers executed after insertion of the Account record.');
        }
        
        System.debug('Notification : All Triggers executed for the insertion of the Account record.');
    }
    
    // Handle Account Update Operations
    if (Trigger.isUpdate) {
        
        // Before Update: Update Description and Rating fields based on old and new values
        if (Trigger.isBefore) {
            AccountTriggerHandler.updateDescription(Trigger.new, Trigger.oldMap); // Modify Description if needed
            AccountTriggerHandler.updateRating(Trigger.new, Trigger.oldMap); // Update Rating when Industry changes
            System.debug('Notification : Triggers executed before update of the Account record.');
        }
        
        // After Update: Update related Contact Phone numbers
        if (Trigger.isAfter) {
            
            // Ensure Contact Phone fields stay in sync with Account Phone
            AccountTriggerHandler.updateRelatedContactPhoneWithMap(Trigger.new, Trigger.oldMap);
            AccountTriggerHandler.updateRelatedContactPhoneWithSet(Trigger.new, Trigger.oldMap);
            
            // Prevent recursive updates by checking a static flag
            if (!preventRecursion.firstCall) {
                preventRecursion.firstCall = true;
                AccountTriggerHandler.updateDescriptionNoRecursion(Trigger.new, Trigger.oldMap);
            }
            System.debug('Notification : Triggers executed after update of the Account record.');
        }
        
        System.debug('Notification : All Triggers executed for the update of the Account record.');
    }
    
    // Handle Account Delete Operations
    if (Trigger.isDelete) {
        
        // Before Delete: Prevent unauthorized deletions
        if (Trigger.isBefore) {
            AccountTriggerHandler.preventDeletion(Trigger.old); // Restrict Account deletion based on business rules
            System.debug('Notification : Triggers executed before deletion of the Account record.');
        }
        
        System.debug('Notification : All Triggers executed for the deletion of the Account record.');
    }
    
    // Final notification for trigger execution
    System.debug('Notification : All Triggers executed for the Account record.');
}