/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2025-01-28
 * Last Modification Date: 2025-01-28
 *
 * This class demonstrates DML (Data Manipulation Language) operations in Apex.
 * It includes operations for inserting, updating, deleting, and undeleting records.
 *
 * Business Use Case:
 * - Perform common database operations for Account and Contact objects.
 * - Demonstrate inserting multiple related records (Account and Contact).
 * - Support bulk operations to insert, update, delete, and undelete records efficiently.
 *
 * Assumptions:
 * - Methods handle standard DML operations for typical Salesforce objects.
 * - Appropriate access to the Salesforce database is assumed.
 *
 * Dependencies:
 * - Relies on Salesforce objects such as `Account` and `Contact`.
 * - Utilizes standard DML statements (`insert`, `update`, `delete`, `upsert`, `undelete`).
 *
 * Change History:
 * 2025-01-28: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added detailed comments to the code
 * 2025-02-01: Write your changes here...
 */

public class DMLPractise {

    /**
     * Inserts a single Account record.
     * @param name The name to be assigned to the Account record.
     */
    public static void insertSingleAccount(String name) {
        // Initialize new Account
        Account acc = new Account();
        // Assigning value to the fields from input
        acc.Name = name;
        
        // Insertion of Account
        insert acc;
    }

    /**
     * Inserts a single Account record and displays its Account Id.
     * @param name The name to be assigned to the Account record.
     */
    public static void insertSingleAccountShowId(String name) {
        // Initialize new Account
        Account acc = new Account();
        // Assigning value to the fields from input
        acc.Name = name;
        
        // Insertion of Account
        insert acc;
        
        // Display Account Id
        System.debug('Account Id : ' + acc.Id);
    }

    /**
     * Inserts two Account records.
     * @param name1 The name of the first Account.
     * @param name2 The name of the second Account.
     */
    public static void insert2Accounts(String name1, String name2) {
        // Initialize new Account 1
        Account acc1 = new Account();
        // Assigning value to the fields from input 1
        acc1.Name = name1;
        
        // Initialize new Account 2
        Account acc2 = new Account();
        // Assigning value to the fields from input 2
        acc2.Name = name2;
        
        // Insertion of Accounts
        insert acc1;
        insert acc2;
    }

    /**
     * Inserts two Account records and their related Contact records.
     * @param name1 The name of the first Account.
     * @param name2 The name of the second Account.
     * @param lastName The last name for the Contact records.
     */
    public static void insert2AccountWithRelatedContact(String name1, String name2, String lastName) {
        // Initialize new List of Accounts
        List<Account> accList = new List<Account>();
        // Initialize new List of Contacts
        List<Contact> conList = new List<Contact>();
        
        // Initialize new Account 1
        Account acc1 = new Account();
        acc1.Name = name1;
        accList.add(acc1);
        
        // Initialize new Account 2
        Account acc2 = new Account();
        //Assigning value to the fields from input 2
        acc2.Name = name2;
        accList.add(acc2);
        
        // Insertion of Accounts
        upsert accList;
        
        // Initialize new Contact 1
        Contact con1 = new Contact();
        //Assigning value to the fields from input 1
        con1.LastName = lastName;
        con1.AccountId = acc1.Id;
        
        //Adding record to the Contact List
        conList.add(con1);
        
        // Initialize new Contact 2
        Contact con2 = new Contact();
        //Assigning value to the fields from input 2
        con2.LastName = lastName;
        con2.AccountId = acc2.Id;
        
        //Adding record to the Contact List
        conList.add(con2);
        
        // Insertion of Contacts related to Accounts
        upsert conList;
    }

    /**
     * Inserts n Account records and their related Contact records in bulk.
     * @param n The number of records to insert.
     * @param name The name to assign to the Account records.
     * @param lastName The last name to assign to the Contact records.
     */
    public static void insertAccountWithRelatedContactBulk(Integer n, String name, String lastName) {
        // Initialize new List of Accounts
        List<Account> accList = new List<Account>();
        // Initialize new List of Contacts
        List<Contact> conList = new List<Contact>();
        
        //Loop to create total number of records
        for(Integer i=0; i<n; i++) {
            //Initialise new Account 1
            Account acc = new Account();
            
            //Assigning value to the fields from input 1
            acc.Name = name + ' ' + i;
            
            //Adding record to the Account List
            accList.add(acc);
        }
        
        // Insertion of Accounts
        upsert accList;
        
        for(Integer i=0; i<n; i++) {
            //Initialise new Contact 1
            Contact con = new Contact();
            
            //Assigning value to the fields from input 1
            con.LastName = lastName + ' ' + i;
            con.AccountId = accList[i].Id;
            
            //Adding record to the Contact List
            conList.add(con);
        }
        
        // Insertion of Contacts related to Accounts
        upsert conList;
    }

    /**
     * Updates Contact records where the LastName contains the specified value.
     * @param lastName The last name to search for and update.
     */
    public static void updateContactRecords(String lastName) {
        // Query Contact records with LastName like the specified value
        List<Contact> conList = [SELECT LastName FROM Contact WHERE LastName LIKE : ('%' + lastName + '%')];
        
        if(!conList.isEmpty()) {
            for(Contact con : conList) {
                // Assigning new value to LastName
                con.LastName = 'Apex Test ' + lastName;
            }
            // Updating List of Contacts
            update conList;
        }
        
        // Count of Records updated
        System.debug('Contacts Updated : ' + conList.size());
        
        // Display changed List of Contacts
        for(Contact con : conList) {
            System.debug('Contact LastName : ' + con.LastName);            
        }
    }

    /**
     * Upserts Contact records where the LastName contains the specified value.
     * @param lastName The last name to search for and upsert.
     */
    public static void upsertContactRecords(String lastName) {
        // Query Contact records with LastName like the specified value
        List<Contact> conList = [SELECT LastName FROM Contact WHERE LastName LIKE : ('%' + lastName + '%')];
        
        if(!conList.isEmpty()) {
            for(Contact con : conList) {
                // Assigning new value to LastName
                con.LastName = lastName + ' Apex Test';
            }
            // Upserting List of Contacts
            upsert conList;
        }
        
        // Count of Records upserted
        System.debug('Contacts Upserted : ' + conList.size());
        
        // Display changed List of Contacts
        for(Contact con : conList) {
            System.debug('Contact LastName : ' + con.LastName);            
        }
    }

    /**
     * Deletes Contact records where the LastName contains the specified value.
     * @param lastName The last name to search for and delete.
     */
    public static void deleteContactRecords(String lastName) {
        // Query Contact records with LastName like the specified value
        List<Contact> conList = [SELECT LastName FROM Contact WHERE LastName LIKE : ('%' + lastName + '%')];
        
        if(!conList.isEmpty()) {
            // Deleting List of Contacts
            delete conList;
        }
        
        // Count of Records deleted
        System.debug('Contacts Deleted : ' + conList.size());
    }

    /**
     * Undeletes Contact records where the LastName contains the specified value.
     * @param lastName The last name to search for and undelete.
     */
    public static void undeleteContactRecords(String lastName) {
        // Query Contact records with LastName like the specified value, including deleted ones
        List<Contact> conList = [SELECT LastName FROM Contact WHERE LastName LIKE : ('%' + lastName + '%') ALL ROWS];
        
        if(!conList.isEmpty()) {
            // Undeleting List of Contacts
            undelete conList;
        }
        
        // Count of Records undeleted
        System.debug('Contacts Undeleted : ' + conList.size());
    }
}