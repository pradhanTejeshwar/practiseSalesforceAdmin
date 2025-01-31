/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-31
* Last Modification Date: 2025-01-31
*
* This trigger handles validation and updates for Opportunity records.
* It ensures data integrity by enforcing required field constraints
* and maintaining stage transition history.
*
* Business Use Case:
* - Prevent Opportunities from having a null Amount value before insertion.
* - Maintain a history of stage changes in the Opportunity Description field.
*
* Assumptions:
* - The Opportunity object has an Amount field that should always be non-null.
* - The Description field stores a history of stage transitions.
* - A helper class, OpportunityTriggerHandler, exists to handle logic.
*
* Dependencies:
* - Requires appropriate field-level security permissions to update Opportunity records.
* - Uses the preventRecursion class to avoid recursive updates.
*
* Change History:
* 2025-01-30: Initial version created by Tejeshwar Pradhan.
* 2025-01-31: Added comments to the code
* 2025-02-01: Write your changes here...
*/

trigger OpportunityTrigger on Opportunity (before insert, after update) {
    
    // Handle operations before inserting a new Opportunity record
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            // Validate that Amount is not null before inserting the record
            OpportunityTriggerHandler.validateAmountNull(Trigger.new);
        }
    }
    
    // Handle operations after updating an Opportunity record
    if (Trigger.isUpdate) {
        if (Trigger.isAfter) {
            // Prevent recursion to avoid infinite loops
            if (!preventRecursion.firstCall) {
                preventRecursion.firstCall = true;
                // Update the Description field based on stage changes
                OpportunityTriggerHandler.updateDescription(Trigger.new, Trigger.oldMap);
            }
            
            // Log debug information for tracking trigger execution
            System.debug('Notification: Triggers executed after the update of the Opportunity record.');
        }
    }
}