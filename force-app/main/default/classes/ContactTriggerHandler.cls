/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2025-01-29
 * Last Modification Date: 2025-01-28
 *
 * This class serves as a trigger handler for managing the total number of Contacts 
 * related to each Account. The main method updates the `Total_Contacts__c` field on 
 * the Account object, reflecting the total number of related Contacts.
 *
 * Business Use Case:
 * - Maintain an up-to-date count of Contacts associated with each Account.
 * - Triggered by DML operations on the Contact object (such as insert or update).
 *
 * Assumptions:
 * - Contacts are related to Accounts using the `AccountId` field.
 * - The `Total_Contacts__c` field on the Account object is used to store the count of related Contacts.
 * - This logic is expected to be invoked by a trigger on the Contact object.
 *
 * Dependencies:
 * - Contact object must be related to the Account object via `AccountId`.
 * - `Total_Contacts__c` field exists on the Account object.
 * - This class is used by a trigger to update contact count after modifications.
 *
 * Change History:
 * 2025-01-29: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added detailed comment for the code
 * 2025-02-01: Write your changes here...
 */

public class ContactTriggerHandler {

    /**
     * Updates the `Total_Contacts__c` field on the related Account object 
     * based on the number of Contacts linked to each Account.
     * 
     * This method is typically invoked by a trigger after a Contact is inserted, 
     * updated, or deleted.
     * 
     * @param conList A list of Contact records that were inserted, updated, or deleted.
     */
    public static void totalContactCount(List<Contact> conList) {
        // Initialize a list to hold Account records that need to be updated
        List<Account> accList = new List<Account>();
        
        // Set to hold unique Account IDs associated with the modified Contacts
        Set<Id> accIds = new Set<Id>();
        
        // Loop through the list of modified Contacts to gather related Account IDs
        for(Contact con : conList) {
            // If the Contact is linked to an Account, add the Account ID to the set
            if(con.AccountId != null) {
                accIds.add(con.AccountId);
            }
        }
        
        // Query for Accounts that have Contacts linked to them
        // Retrieve the related Contacts count and the Account's Total_Contacts__c field
        for(Account acc : [SELECT Id, Total_Contacts__c, (SELECT Id FROM Contacts) 
                           FROM Account WHERE Id IN : accIds]) {
            // Update the Account's Total_Contacts__c field with the actual number of Contacts
            acc.Total_Contacts__c = acc.Contacts.size();
            
            // Add the Account to the list for later update
            accList.add(acc);
        }
        
        // If there are any Accounts to update, perform the update operation
        if(!accList.isEmpty()) {
            try {
                // Update the Account records with the new contact counts
                update accList;
            } catch (Exception e) {
                // Catch and log any exceptions that occur during the update
                System.debug('Exception Occurred: ' + e.getMessage());
            }
        }
    }
}