/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-28
* Last Modification Date: 2025-01-31
*
* This class serves as a trigger handler for Account operations.
* It contains utility methods to update Account fields, manage related records,
* and ensure data consistency based on business requirements.
*
* Business Use Case:
* - Auto-populate the Description field for new Account records.
* - Update the Rating field for Accounts in the 'Media' Industry.
* - Create related Opportunity records for newly inserted Accounts.
* - Maintain accurate Phone data between Account and related Contacts.
*
* Assumptions:
* - The trigger invoking this handler is properly configured on Account object.
* - Industry, Rating, and Description fields exist on the Account object.
* - Related Opportunities and Contacts are correctly associated.
*
* Dependencies:
* - Requires appropriate CRUD/FLS permissions for Account, Contact, and Opportunity.
*
* Change History:
* 2025-01-28: Initial version created by Tejeshwar Pradhan.
* 2025-01-29: Added new methods, inline comments, and enhanced documentation.
* 2025-01-31: Added new methods to the class
* 2025-02-01: Write your changes here...
*/

public class AccountTriggerHandler {
    /**
    * Prevents recursion when updating the Description field.
    * Ensures that an Account’s Description is modified only once per trigger execution.
    */
    public static void updateDescriptionNoRecursion(List<Account> accList, Map<Id, Account> accOldMap) {
        List<Account> accUpdate = new List<Account>();
        
        for (Account acc : accList) {
            Account a = new Account();
            a.Id = acc.Id;
            a.Description = (acc.Description != null ? acc.Description : '') + '\n' + 'Prevention of Recursion';
            accUpdate.add(a);
        }
        
        // Perform update only if there are modified records
        if (!accUpdate.isEmpty()) {
            update accUpdate;
        }
    }
    
    /**
    * Prevents deletion of active Account records by non-Administrators.
    */
    public static void preventDeletion(List<Account> accList) {
        Profile adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        
        for (Account acc : accList) {
            // Restrict deletion to System Administrators
            if (UserInfo.getProfileId() != adminProfile.Id) {
                acc.addError(Label.Active_Account_cannot_be_Deleted);
            }
            // Prevent deletion if Active__c field is set to 'Yes'
            if (acc.Active__c == 'Yes') {
                acc.addError(Label.Only_System_Administrator_can_delete_Account_Records);
            }
        }
    }
    
    /**
    * Auto-populates Description if null and updates Rating for 'Media' industry.
    */
    public static void updateDescription(List<Account> accList) {
        for (Account acc : accList) {
            if (acc.Description == null) {
                acc.Description = 'Description was auto-populated as it was blank before Insertion by AccountTrigger';
            }
            if (acc.Industry == 'Media') {
                acc.Rating = 'Hot';
            }
        }
    }
    
    /**
    * Updates Rating when Industry field changes to 'Media'.
    */
    public static void updateRating(List<Account> accList, Map<Id, Account> accOldMap) {
        for (Account acc : accList) {
            if (accOldMap.containsKey(acc.Id) && acc.Industry != accOldMap.get(acc.Id).Industry && acc.Industry == 'Media') {
                acc.Rating = 'Hot';
            }
        }
    }
    
    /**
    * Creates a related Opportunity when a new Account is inserted.
    */
    public static void createRelatedOpportunity(List<Account> accList) {
        List<Opportunity> oppList = new List<Opportunity>();
        
        for (Account acc : accList) {
            if (acc.Id != null) {
                Opportunity opp = new Opportunity(
                    Name = acc.Name + ' Opportunity',
                    CloseDate = System.today() + 10,
                    Amount = 10000,
                    StageName = 'Prospecting',
                    AccountId = acc.Id
                );
                oppList.add(opp);
            }
        }
        
        if (!oppList.isEmpty()) {
            insert oppList;
        }
    }
    
    /**
    * Appends old and new Phone values to Description if Phone is updated.
    */
    public static void updateDescription(List<Account> accList, Map<Id, Account> accOldMap) {
        for (Account acc : accList) {
            if (accOldMap.containsKey(acc.Id) && acc.Phone != accOldMap.get(acc.Id).Phone) {
                acc.Description += '\nDescription updated by AccountTrigger' + '\nOld: ' + accOldMap.get(acc.Id).Phone + '; New: ' + acc.Phone;
            }
        }
    }
    
    /**
    * Updates related Contact Phone numbers when Account Phone changes.
    */
    public static void updateRelatedContactPhoneWithMap(List<Account> accList, Map<Id, Account> accOldMap) {
        List<Contact> conList = new List<Contact>();
        Map<Id, Account> accMap = new Map<Id, Account>();
        
        for (Account acc : accList) {
            if (accOldMap.containsKey(acc.Id) && acc.Phone != accOldMap.get(acc.Id).Phone) {
                accMap.put(acc.Id, acc);
            }
        }
        
// Fetch Contacts related to the modified Accounts
        for (Contact con : [SELECT Id, Phone, AccountId FROM Contact WHERE AccountId IN :accMap.keySet()]) {
            if (accMap.containsKey(con.AccountId)) {
                con.Phone = accMap.get(con.AccountId).Phone;
                conList.add(con);
            }
        }
        
// Usadasdte Contacts if any were modified
        if (!conList.isEmpty()) {
try {
            update conList;
} catch (Exception e) {
    System.debug('Exception Occurred: ' + e.getMessage());
}
        }
    }
    
    /**
    * Alternative method using SOQL relationship queries to update Contact Phones.
    */
    public static void updateRelatedContactPhoneWithSet(List<Account> accList, Map<Id, Account> accOldMap) {
        List<Contact> conList = new List<Contact>();
        Set<Id> accIds = new Set<Id>();
        
// Store only those Account IDs where the Phone has changed
        for (Account acc : accList) {
            if (accOldMap.containsKey(acc.Id) && acc.Phone != accOldMap.get(acc.Id).Phone) {
                accIds.add(acc.Id);
            }
        }
        
// Fetch Accounts with related Contacts
        for (Account acc : [SELECT Id, Phone, (SELECT Id, Phone FROM Contacts) FROM Account WHERE Id IN :accIds]) {
if (acc.Contacts != null) {
            for (Contact con : acc.Contacts) {
                con.Phone = acc.Phone;
                conList.add(con);
            }
        }
}
        
// Update Contacts if any were modified
        if (!conList.isEmpty()) {
try {
            update conList;
} catch (Exception e) {
    System.debug('Exception Occurred: ' + e.getMessage());
}
        }
    }
}