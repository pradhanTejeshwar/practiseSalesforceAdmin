/**
* Created by [Your Name] - User
* Date of Creation: 2025-01-25
* Last Modification Date: 2025-01-31
*
* This class provides utility methods for creating Account and related records
* (Opportunity, Contact, Case) in Salesforce. The operations demonstrate basic 
* DML (Data Manipulation Language) practices in Salesforce.
*
* Business Use Case:
* - Create Account records with associated Opportunities, Contacts, and Cases.
* - Demonstrate the creation of multiple related Salesforce objects in bulk.
*
* Assumptions:
* - All required fields for each object (Account, Opportunity, Contact, Case) are provided.
* - Relationships between the objects (Account -> Opportunity, Account -> Contact, Account -> Case) are properly configured in Salesforce.
*
* Dependencies:
* - Requires proper permissions to insert and update Account, Opportunity, Contact, and Case records.
*
* Change History:
* 2025-01-25: Initial version created by User.
* 2025-01-31: Added comments in the code.
* 2025-02-01: Write your changes here...
*/

public class AccountAndRelatedDML {
    
    /**
    * Creates a new Account with the given Name, Type, and Rating.
    * 
    * @param accName The name of the Account to be created.
    * @param type The type of the Account.
    * @param rating The rating of the Account.
    */
    public static void createAccount(String accName, String type, String rating) {
        // Initialize an Account object
        Account acc = new Account();
        
        // Assign values to Account fields
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        // Insert the Account record into Salesforce
        insert acc;
    }

    /**
    * Creates a new Account and related Opportunity with the given details.
    * 
    * @param accName The name of the Account to be created.
    * @param type The type of the Account.
    * @param rating The rating of the Account.
    * @param oppName The name of the Opportunity to be created.
    * @param stage The stage of the Opportunity.
    */
    public static void createAccountWithOpportunity(String accName, String type, String rating, String oppName, String stage) {
        // Initialize an Account object
        Account acc = new Account();
        
        // Assign values to Account fields
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        // Insert the Account record into Salesforce
        insert acc;
        
        // Initialize an Opportunity object
        Opportunity opp = new Opportunity();
        
        // Assign values to Opportunity fields
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28; // Set CloseDate to 28 days from today
        opp.StageName = stage;
        opp.AccountId = acc.Id; // Link the Opportunity to the created Account
        
        // Insert the Opportunity record into Salesforce
        insert opp;
    }

    /**
    * Creates a new Account and related Contact with the given details.
    * 
    * @param accName The name of the Account to be created.
    * @param type The type of the Account.
    * @param rating The rating of the Account.
    * @param firstName The first name of the Contact.
    * @param lastName The last name of the Contact.
    */
    public static void createAccountWithContact(String accName, String type, String rating, String firstName, String lastName) {
        // Initialize an Account object
        Account acc = new Account();
        
        // Assign values to Account fields
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        // Insert the Account record into Salesforce
        insert acc;
        
        // Initialize a Contact object
        Contact con = new Contact();
        
        // Assign values to Contact fields
        con.FirstName = firstName;
        con.LastName = lastName;
        con.AccountId = acc.Id; // Link the Contact to the created Account
        
        // Insert the Contact record into Salesforce
        insert con;
    }

    /**
    * Creates a new Account and related Case with the given details.
    * 
    * @param accName The name of the Account to be created.
    * @param type The type of the Account.
    * @param rating The rating of the Account.
    * @param status The status of the Case.
    * @param origin The origin of the Case.
    */
    public static void createAccountWithCase(String accName, String type, String rating, String status, String origin) {
        // Initialize an Account object
        Account acc = new Account();
        
        // Assign values to Account fields
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        // Insert the Account record into Salesforce
        insert acc;
        
        // Initialize a Case object
        Case cas = new Case();
        
        // Assign values to Case fields
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = acc.Id; // Link the Case to the created Account
        
        // Insert the Case record into Salesforce
        insert cas;
    }

    /**
    * Creates a new Account, Opportunity, and Contact with the given details.
    * 
    * @param accName The name of the Account to be created.
    * @param type The type of the Account.
    * @param rating The rating of the Account.
    * @param oppName The name of the Opportunity to be created.
    * @param stage The stage of the Opportunity.
    * @param firstName The first name of the Contact.
    * @param lastName The last name of the Contact.
    */
    public static void createAccountWithOpportunityAndContact(String accName, String type, String rating, String oppName, String stage, String firstName, String lastName) {
        // Initialize an Account object
        Account acc = new Account();
        
        // Assign values to Account fields
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        // Insert the Account record into Salesforce
        insert acc;
        
        // Initialize an Opportunity object
        Opportunity opp = new Opportunity();
        
        // Assign values to Opportunity fields
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28; // Set CloseDate to 28 days from today
        opp.StageName = stage;
        opp.AccountId = acc.Id; // Link the Opportunity to the created Account
        
        // Initialize a Contact object
        Contact con = new Contact();
        
        // Assign values to Contact fields
        con.FirstName = firstName;
        con.LastName = lastName;
        con.AccountId = acc.Id; // Link the Contact to the created Account
        
        // Insert the Opportunity record into Salesforce
        insert opp;
        
        // Insert the Contact record into Salesforce
        insert con;
    }

    /**
    * Creates a new Account, Opportunity, and Case with the given details.
    * 
    * @param accName The name of the Account to be created.
    * @param type The type of the Account.
    * @param rating The rating of the Account.
    * @param oppName The name of the Opportunity to be created.
    * @param stage The stage of the Opportunity.
    * @param status The status of the Case.
    * @param origin The origin of the Case.
    */
    public static void createAccountWithOpportunityAndCase(String accName, String type, String rating, String oppName, String stage, String status, String origin) {
        // Initialize an Account object
        Account acc = new Account();
        
        // Assign values to Account fields
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        // Insert the Account record into Salesforce
        insert acc;
        
        // Initialize an Opportunity object
        Opportunity opp = new Opportunity();
        
        // Assign values to Opportunity fields
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28; // Set CloseDate to 28 days from today
        opp.StageName = stage;
        opp.AccountId = acc.Id; // Link the Opportunity to the created Account
        
        // Initialize a Case object
        Case cas = new Case();
        
        // Assign values to Case fields
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = acc.Id; // Link the Case to the created Account
        
        // Insert the Opportunity record into Salesforce
        insert opp;
        
        // Insert the Case record into Salesforce
        insert cas;
    }

    /**
    * Creates two new Account records in bulk.
    */
    public static void create2AccountRecords() {
        // Initialize a List to store Account records
        List<Account> accList = new List<Account>();
        
        // Create two Account records and add them to the list
        Account acc1 = new Account(Name='Test Account Insert 1');
        accList.add(acc1);
        
        //Initialize Account Record acc1
        Account acc2 = new Account(Name='Test Account Insert 2');
        //Add acc2 to accList
        accList.add(acc2);
        
        // Insert the list of Account records into Salesforce
        insert accList;
    }

    /**
    * Retrieves and displays a set of Account Ids from all Account records in Salesforce.
    */
    public static void displayAccountIdSet() {
        // Initialize a Set to store Account Ids
        Set<Id> accId = new Set<Id>();
        
        // Query for all Account records and store them in a list
        List<Account> accList = [SELECT Id FROM Account];
        
        // Loop through each Account record and add its Id to the Set
        for(Account acc : accList) {
            accId.add(acc.Id);
        }
        
        // Display the Set of Account Ids
        System.debug('Account Id Set: ' + accId);
    }
    public static void displayAccountIdNameMap() {
        //Initialise List accList and store AccountRecords Data
        List<Account> accList = [SELECT Name, Type, Rating FROM Account];
        //Initialise Map accMap and store accList
        Map<Id,Account> accMap = new Map<Id,Account>(accList);
        
        //Display in debug the Map accMap
        System.debug('Account Map : ' + accMap);
        System.debug('Map Keys : ' + accMap.keySet());
        System.debug('Map Values : ' + accMap.values());
    }
    public static void displayAccountIdNameMapWithLoop() {
        //Initialise List accList and store AccountRecords Data
        List<Account> accList = [SELECT Name, Type, Rating FROM Account];
        //Initialise Map accMap and store accList
        Map<Id,Account> accMap = new Map<Id,Account>(accList);
        
        //Loop to store Account data into key and value in accMap
        for(Account acc : accList) {
            //Store Account data in accMap
            accMap.put(acc.id, acc);
        }
        
        //Display in debug the Map accMap
        System.debug('Account Map : ' + accMap);
        System.debug('Map Keys : ' + accMap.keySet());
        System.debug('Map Values : ' + accMap.values());
    }
    public static void loopAccountListAndDisplayInformation() {
        //Initialise List accList and store AccountRecords Data
        List<Account> accList = [SELECT Id, Name, Type, Rating FROM Account LIMIT 3];
        
        //Checking for empty List
        if(accList.size()>0) {
            //Looping through accList
            for(Account acc : accList) {
                //Display in debug the instance of Account Record
                System.debug('Account Information : ' + acc);
            }
        }
    }
    public static void loopAccountListAndCreateSetOfAccountId() {
        //Initialise List accList and store AccountRecords Data
        List<Account> accList = [SELECT Id, Name, Type, Rating FROM Account LIMIT 3];
        //Initialise Map accSet and store accList
        Set<Id> accSet = new Set<Id>();
        
        //Checking for empty List
        if(!accList.isEmpty()) {
            //Looping through accList
            for(Account acc : accList) {
                //Store Ids of Account Records in accSet
                accSet.add(acc.Id);
            }
        }
        
        //Displaying Set of Ids from accSet
        System.debug('Set of Ids : ' + accSet);
    }
    public static void loopAccountListAndDisplaySetOfAccountId() {
        //Initialise List accList and store AccountRecords Data
        List<Account> accList = [SELECT Id, Name, Type, Rating FROM Account LIMIT 3];
        //Initialise Map accSet and store accList
        Set<Id> accSet = new Set<Id>();
        
        //Checking for empty List
        if(!accList.isEmpty()) {
            //Looping through accList
            for(Account acc : accList) {
                //Adding Ids of Account Record to accSet
                accSet.add(acc.Id);
            }
        }
        
        //Checking for empty List
        if(accSet.size()>0) {
            //Looping through Set with Id variable acc
            for(Id acc : accSet) {
                //Display in debug the Id of Account Record
                System.debug('Id : ' + acc);
            }
        }
    }
    public static void loopAccountListAndCreateMapOfAccountId() {
        //Initialise List accList and store AccountRecords Data
        List<Account> accList = [SELECT Id, Name, Type, Rating FROM Account LIMIT 3];
        //Initialise Map accMap and store accList
        Map<Id,Account> accMap = new Map<Id,Account>();
        
        //Checking for empty List
        if(!accList.isEmpty()) {
            //Looping through accList
            for(Account acc : accList) {
                //Saving the Account Data into accMap
                accMap.put(acc.Id,acc);
            }
        }
        
        //Displaying the Map 
        System.debug('Map of AccountList : ' + accMap);
    }
    public static void loopAccountListAndCreateMapOfAccountIdAndIterateKeys() {
        //Initialise List accList and store AccountRecords Data
        List<Account> accList = [SELECT Id, Name, Type, Rating FROM Account LIMIT 3];
        //Initialise Map accMap and store accList
        Map<Id,Account> accMap = new Map<Id,Account>();
        
        //Checking for empty List
        if(!accList.isEmpty()) {
            //Looping through accList
            for(Account acc : accList) {
                //Saving the Account data into accMap
                accMap.put(acc.Id,acc);
            }
        }
        
        //Checking for empty List
        if(accMap.size()>0) {
            //Looping through Keys of accMap
            for(Id acc : accMap.keySet()) {
                //Display in debug the Id of Account Record
                System.debug('Key : ' + acc);
            }
        }
    }
    public static void loopAccountListAndCreateMapOfAccountIdAndIterateValues() {
        //Initialise List accList and store AccountRecords Data
        List<Account> accList = [SELECT Id, Name, Type, Rating FROM Account LIMIT 3];
        //Initialise Map accMap and store accList
        Map<Id,Account> accMap = new Map<Id,Account>();
        
        //Checking for empty List
        if(!accList.isEmpty()) {
            //Looping through accList
            for(Account acc:accList) {
                //Display in debug the Id of Account Record
                accMap.put(acc.Id,acc);
            }
        }
        
        //Checking for empty List
        if(accMap.size()>0) {
            //Looping through values of accMap
            for(Account acc:accMap.values()) {
                //Display in debug the Value of Account Record
                System.debug('Value : ' + acc);
            }
        }
    }
}