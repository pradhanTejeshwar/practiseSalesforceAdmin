/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-25
* Last Modification Date: 2025-01-31
*
* This class provides a utility method to update Opportunity records where the 
* `taskCreated__c` field is set to true. The method updates the `taskCreated__c` 
* field to false for all such Opportunity records.
*
* Business Use Case:
* - Update Opportunities where a task was previously created, and now 
*   the task creation status needs to be reset to false.
*
* Assumptions:
* - `taskCreated__c` is a custom field on the Opportunity object used to track 
*   whether a task has been created for the Opportunity.
* - Opportunities where the `taskCreated__c` field is true need to be updated.
*
* Dependencies:
* - Requires proper permissions to query and update Opportunity records.
*
* Change History:
* 2025-01-25: Initial version created by Tejeshwar Pradhan.
* 2025-01-31: Added detailed comments to explain the code flow.
* This class contains a method to update the `taskCreated__c` field on Opportunity 
* records based on specific conditions.
*/

public class updateTaskCreatedOpportunity {
    
    /**
     * This method updates the `taskCreated__c` field of Opportunity records
     * where the field is set to true, by resetting it to false.
     * 
     * @return void
     */
    public static void updateOpportunityListField() {
        // Query Opportunity records where taskCreated__c is true
        // and retrieve their Ids and taskCreated__c field
        List<Opportunity> oppList = [SELECT Id, taskCreated__c FROM Opportunity WHERE taskCreated__c = true];
        
        // Loop through the queried Opportunity records to update the taskCreated__c field
        // Set taskCreated__c to false for each Opportunity in the list
        for(Opportunity opp : oppList) {
            opp.taskCreated__c = false;  // Set taskCreated__c field to false
        }
        
        // Perform the update operation on the Opportunity records
        // This will save the updated Opportunity records with taskCreated__c set to false
        update oppList; 
    }
}