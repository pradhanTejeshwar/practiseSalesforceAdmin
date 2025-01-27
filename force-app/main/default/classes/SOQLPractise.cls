/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-28
* Last Modification Date: 2025-01-28
*
* This class provides utility methods for performing SOQL-based operations
* on Salesforce objects (e.g., Account, Contact). These operations focus on
* maintaining data integrity and adhering to specific business requirements.
*
* Business Use Case:
* - Ensure Account records reflect accurate counts of related Contacts.
* - Populate missing fields (e.g., OtherPhone) in Contact records using related Account data.
*
* Assumptions:
* - Total_Contacts__c is a custom field on Account to store the count of related Contacts.
* - Relationships between Account and Contact are properly configured in Salesforce.
*
* Dependencies:
* - Requires proper permissions to query and update Account and Contact records.
*
* Change History:
* 2025-01-28: Initial version created by Tejeshwar Pradhan.
* 2025-01-29: Write your changes here...
*
* This class contains methods to practice SOQL queries and perform specific 
* business logic operations on Account, Contact, and Opportunity records.
*/
public class SOQLPractise {

    /**
    * Fetches Accounts with Contacts where the Phone field is not null.
    * Logs the Account Name and the count of related Contacts.
    */
    public static void getAccountWithContactAndPhoneNotNull() {
        // Initialize a list of Accounts with related Contacts
        List<Account> accList = [
            SELECT Id, Name, (SELECT Id FROM Contacts) 
            FROM Account 
            WHERE Phone != null
        ];
        
        // Check if the Account list is not empty
        if (!accList.isEmpty()) {
            // Loop through the list of Accounts to log account and contact details
            for (Account acc : accList) {
                // Log the Account name and the number of related Contacts
                System.debug('Account: ' + acc.Name + 
                             ' has ' + acc.Contacts.size() + 
                             ' Contacts related to it.');
            }
        }
    }
    
    /**
    * Fetches Accounts with Opportunities where the Phone field is not null.
    * Calculates the total amount of Opportunities for each Account and logs the details.
    */
    public static void getAccountWithOpportunitiesAndPhoneNotNull() {
        // Initialize a list of Accounts with related Opportunities
        List<Account> accList = [
            SELECT Id, Name, (SELECT Id, Amount FROM Opportunities) 
            FROM Account 
            WHERE Phone != null
        ];
        
        // Check if the Account list is not empty
        if (!accList.isEmpty()) {
            // Loop through the list of Accounts to log account and opportunity details
            for (Account acc : accList) {
                // Initialize a variable to hold the total amount of Opportunities
                Decimal totalAmountOfOpportunities = 0;
                
                // Check if the Opportunities list is not null
                if (acc.Opportunities != null) {
                    // Loop through the Opportunities related to the Account
                    for (Opportunity opp : acc.Opportunities) {
                        // Add the Opportunity Amount to the total if it's not null
                        if (opp.Amount != null) {
                            totalAmountOfOpportunities += opp.Amount;
                        }
                    }
                }
                
                // Log the Account name and the total Opportunities amount
                System.debug('Account: ' + acc.Name + 
                             ' has ' + totalAmountOfOpportunities + 
                             ' worth of Opportunities.');
            }
        }
    }
    
    /**
    * Updates the Description field of Opportunities created in the current year.
    * Description is updated based on the StageName:
    * - "Closed Won": "Opportunity is Closed Won"
    * - "Closed Lost": "Opportunity is Closed Lost"
    * - Other stages: "Opportunity is Open"
    */
    public static void updateDescriptionCurrentYear() {
        // Initialize a list of Opportunities created in the current year
        List<Opportunity> oppList = [
            SELECT Id, Name, StageName, Description 
            FROM Opportunity 
            WHERE CreatedDate = THIS_YEAR
        ];
        
        // Check if the Opportunity list is not empty
        if (!oppList.isEmpty()) {
            // Loop through the list of Opportunities to update the Description field
            for (Opportunity opp : oppList) {
                // Update Description based on the StageName
                if (opp.StageName == 'Closed Won') {
                    opp.Description = 'Opportunity is Closed Won';
                } 
                else if (opp.StageName == 'Closed Lost') {
                    opp.Description = 'Opportunity is Closed Lost';
                } 
                else {
                    opp.Description = 'Opportunity is Open';
                }
            }
        }
        
        // Attempt to update the Opportunities and handle any exceptions
        try {
            update oppList;
        } 
        catch (Exception e) {
            // Log the exception message
            System.debug('Exception caught: ' + e.getMessage());
        }
    }
    
    /**
    * Updates the Total_Contacts__c field of Accounts created in the current year.
    * The Total_Contacts__c field is updated to the count of related Contacts.
    */
    public static void updateTotalContactsFieldOfAccountCurrentYear() {
        // Initialize a list of Accounts created in the current year
        List<Account> accList = [
            SELECT Id, Name, Total_Contacts__c, (SELECT Id FROM Contacts) 
            FROM Account 
            WHERE CreatedDate = THIS_YEAR
        ];
        
        // Check if the Account list is not empty
        if (!accList.isEmpty()) {
            // Loop through the list of Accounts to update the Total Contacts field
            for (Account acc : accList) {
                // Initialize Total_Contacts__c to 0 if it is null
                if (acc.Total_Contacts__c == null) {
                    acc.Total_Contacts__c = 0;
                }
                // Set Total_Contacts__c to the count of related Contacts
                acc.Total_Contacts__c = acc.Contacts.size();
            }
        }
        
        // Attempt to update the Accounts and handle any exceptions
        try {
            update accList;
        } catch (Exception e) {
            // Log the exception message
            System.debug('Exception caught: ' + e.getMessage());
        }
    }
    
    /**
    * Updates the OtherPhone field of Contacts created in the last week.
    * If OtherPhone is null and the related Account's Phone field is not null,
    * OtherPhone is updated to the Account's Phone value.
    */
    public static void updateOtherPhoneFieldContactsIfNullOfAccountLastWeek() {
        // Initialize a list of Contacts created in the last week
        List<Contact> conList = [
            SELECT Id, Name, OtherPhone, Account.Phone 
            FROM Contact 
            WHERE CreatedDate = LAST_WEEK
        ];
        
        // Check if the Contact list is not empty
        if (!conList.isEmpty()) {
            // Loop through the list of Contacts to update the OtherPhone field
            for (Contact con : conList) {
                // Update OtherPhone if it is null and the Account's Phone is not null
                if (con.OtherPhone == null && con.Account.Phone != null) {
                    con.OtherPhone = con.Account.Phone;
                }
            }
        }
        
        // Attempt to update the Contacts and handle any exceptions
        try {
            update conList;
        } catch (Exception e) {
            // Log the exception message
            System.debug('Exception caught: ' + e.getMessage());
        }
    }
}