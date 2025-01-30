/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-28
* Last Modification Date: 2025-01-29
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
* 2025-01-29: Added new methods, inline comments and enhanced documentation.
* 2025-01-30: Write your changes here...
*/

public class AccountTriggerHandler {
public static void updateDescriptionNoRecursion(List<Account> accList, Map<Id, Account> accOldMap) {
Map<Id, Account> accMap = new Map<Id, Account>();
List<Account> accUpdate = new List<Account>();
for(Account acc : accList) {
    Account a = new Account();
    a.Id = acc.Id;
    a.Description = a.Description + '\n' + 'Prevention of Recursion';
    
    accUpdate.add(a);
}
if(accUpdate.size()>0) {
    update accUpdate;
}
}

public static void preventDeletion(List<Account> accList) {

Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
for(Account acc : accList) {
    if(UserInfo.getProfileId() != p.Id) {                
        acc.addError(Label.Active_Account_cannot_be_Deleted);
    }
    if(acc.Active__c == 'Yes') {
        acc.addError(Label.Only_System_Administrator_can_delete_Account_Records);
    }
}
}
/**
* Updates the Description field for Accounts.
* If Description is null, auto-populates it with a default message.
* If the Industry is 'Media', sets the Rating field to 'Hot'.
*/
public static void updateDescription(List<Account> accList) {
for (Account acc : accList) {
    // Auto-populate Description if it is null
    if (acc.Description == null) {
        acc.Description = 'Description was auto-populated as it was Blank before Insertion by AccountTrigger on Account';
    }
    // Set Rating to 'Hot' if the Industry is 'Media'
    if (acc.Industry != null && acc.Industry == 'Media') {
        acc.Rating = 'Hot';
    }
}
}

/**
* Updates the Rating field for Accounts when the Industry field is changed.
* If the Account is in the 'Media' industry, the Rating is set to 'Hot'.
*/
public static void updateRating(List<Account> accList, Map<Id, Account> accOldMap) {
for (Account acc : accList) {
    // Check if the Account's Industry has changed to 'Media'
    if ((accOldMap == null && acc.Industry != null && acc.Industry == 'Media') ||
        (acc.Industry != accOldMap.get(acc.Id).Industry && acc.Industry == 'Media')) {
            acc.Rating = 'Hot';
        }
}
}

/**
* Creates a related Opportunity for each newly inserted Account.
* The Opportunity is named after the Account and set to 'Prospecting' stage.
*/
public static void createRelatedOpportunity(List<Account> accList) {
List<Opportunity> oppList = new List<Opportunity>();
for (Account acc : accList) {
    if (acc.Id != null) { // Ensure Account has been inserted
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
// Insert Opportunities if the list is not empty
if (!oppList.isEmpty()) {
    Database.SaveResult[] srList = Database.insert(oppList, false);
    
    
    for(Integer i=0; i<srList.size(); i++) {
        if (!srList[i].isSuccess()) {
            String errors = '';
        for(Database.Error err:srList[i].getErrors()) {
            errors += err.getMessage();
        }
        accList[i].addError(errors);
}
}
}
}

/**
* Updates the Description field for Accounts when the Phone field is changed.
* Appends the old and new Phone values to the Description.
*/
public static void updateDescription(List<Account> accList, Map<Id, Account> accOldMap) {
for (Account acc : accList) {
if (acc.Phone != accOldMap.get(acc.Id).Phone) {
    acc.Description += '\nDescription was updated by AccountTrigger on Account for Before Update Event' +
        '\nOld Value: ' + accOldMap.get(acc.Id).Phone + '; New Value: ' + acc.Phone;
}
}
}

/**
* Updates related Contact Phone numbers when the Account Phone changes.
* Uses a Map-based approach to fetch related Contacts efficiently.
*/
public static void updateRelatedContactPhoneWithMap(List<Account> accList, Map<Id, Account> accOldMap) {
List<Contact> conList = new List<Contact>();
Map<Id, Account> accMap = new Map<Id, Account>();

// Store only those Accounts where the Phone has changed
for (Account acc : accList) {
if (acc.Phone != accOldMap.get(acc.Id).Phone) {
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
* Updates related Contact Phone numbers when the Account Phone changes.
* Uses a Set-based approach with Parent-Child SOQL to fetch related Contacts.
*/
public static void updateRelatedContactPhoneWithSet(List<Account> accList, Map<Id, Account> accOldMap) {
List<Contact> conList = new List<Contact>();
Set<Id> accIds = new Set<Id>();

// Store only those Account IDs where the Phone has changed
for (Account acc : accList) {
if (acc.Phone != accOldMap.get(acc.Id).Phone) {
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