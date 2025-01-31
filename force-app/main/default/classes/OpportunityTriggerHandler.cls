/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-31
* Last Modification Date: 2025-01-31
*
* This class serves as a trigger handler for Opportunity object-related operations.
* It ensures data integrity by validating required fields and updating descriptions
* based on changes in the Opportunity's stage.
*
* Business Use Case:
* - Prevent Opportunities from having a null Amount value.
* - Maintain a history of stage changes in the Opportunity Description field.
*
* Assumptions:
* - The Opportunity object has an Amount field that should always be non-null.
* - The Description field stores a history of stage transitions.
*
* Dependencies:
* - Requires appropriate field-level security permissions to update Opportunity records.
*
* Change History:
* 2025-01-30: Initial version created by Tejeshwar Pradhan.
* 2025-01-31: Added comments to the code
* 2025-02-01: Write your changes here...
*/

public class OpportunityTriggerHandler {
    
    /**
    * Validates that the Amount field in an Opportunity record is not null.
    * If the Amount is null, an error is added to prevent record insertion or update.
    *
    * @param oppList List of Opportunity records to validate.
    */
    public static void validateAmountNull(List<Opportunity> oppList) {
        for (Opportunity opp : oppList) {
            // Check if the Amount field is null
            if (opp.Amount == null) {
                // Prevent the operation and show an error message
                opp.addError('Amount should not be null');
            }
        }
    }
    
    /**
    * Updates the Description field of an Opportunity when the StageName changes.
    * If an Opportunity moves to 'Closed Won' or 'Closed Lost', it appends a corresponding
    * message to the Description field to maintain a history of stage changes.
    *
    * @param oppList List of Opportunity records being updated.
    * @param oppOldMap Map of old Opportunity records before update (Id to Opportunity mapping).
    */
    public static void updateDescription(List<Opportunity> oppList, Map<Id, Opportunity> oppOldMap) {
        List<Opportunity> oppUpdate = new List<Opportunity>(); // List to hold Opportunities that need updating
        
        for (Opportunity opp : oppList) {
            Opportunity o = new Opportunity(); // Create a new instance to update only specific fields
            o.Id = opp.Id; // Assign the existing Opportunity Id
            
            // Check if the StageName has changed
            if (opp.StageName != oppOldMap.get(opp.Id).StageName) {
                // Append a history message based on the new StageName
                if (opp.StageName == 'Closed Won') {
                    o.Description = oppOldMap.get(opp.Id).Description + '\n' + 'Opportunity is Closed Won';
                }
                if (opp.StageName == 'Closed Lost') {
                    o.Description = oppOldMap.get(opp.Id).Description + '\n' + 'Opportunity is Closed Lost';
                }
                oppUpdate.add(o); // Add the modified Opportunity to the list for update
            }
        }
        
        // Perform the update if there are records to modify
        if (!oppUpdate.isEmpty()) {
            update oppUpdate;
        }
    }
}