public class DMLPractise {
    public static void insertSingleAccount(String name) {
        //Initialise new Account
        Account acc = new Account();
        //Assigning value to the fields from input
        acc.Name = name;
        
        //Insertion of Account
        insert acc;
    }
    public static void insertSingleAccountShowId(String name) {
        //Initialise new Account
        Account acc = new Account();
        //Assigning value to the fields from input
        acc.Name = name;
        
        //Insertion of Account
        insert acc;
        
        //Display Account Id
        System.debug('Account Id : ' + acc.Id);
    }
    public static void insert2Accounts(String name1, String name2) {
        //Initialise new Account 1
        Account acc1 = new Account();
        //Assigning value to the fields from input 1
        acc1.Name = name1;
        
        //Initialise new Account 2
        Account acc2 = new Account();
        //Assigning value to the fields from input 2
        acc2.Name = name2;
        
        //Insertion of Accounts
        insert acc1;
        insert acc2;
    }
    public static void insert2AccountWithRelatedContact(String name1, String name2, String lastName) {
        //Initialise new List of Accounts
        List<Account> accList = new List<Account>();
        //Initialise new List of Contacts
        List<Contact> conList = new List<Contact>();
        
        //Initialise new Account 1
        Account acc1 = new Account();
        //Assigning value to the fields from input 1
        acc1.Name = name1;
        //Adding record to the Account List
        accList.add(acc1);
        
        //Initialise new Account 2
        Account acc2 = new Account();
        //Assigning value to the fields from input 2
        acc2.Name = name2;
        accList.add(acc2);
        
        //Insertion of Account
        upsert accList;
        
        //Initialise new Contact 1
        Contact con1 = new Contact();
        //Assigning value to the fields from input 1
        con1.LastName = lastName;
        con1.AccountId = acc1.Id;
        
        //Adding record to the Contact List
        conList.add(con1);
        
        //Initialise new Contact 2
        Contact con2 = new Contact();
        //Assigning value to the fields from input 2
        con2.LastName = lastName;
        con2.AccountId = acc2.Id;
        
        //Adding record to the Contact List
        conList.add(con2);
        
        //Insertion of Account's related Contact
        upsert conList;
    }
    public static void insertAccountWithRelatedContactBulk(Integer n, String name, String lastName) {
        //Initialise new List of Accounts
        List<Account> accList = new List<Account>();
        //Initialise new List of Contacts
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
        
        //Insertion of Account
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
        
        //Insertion of Account's related Contact
        upsert conList;
    }
    public static void updateContactRecords(String lastName) {
        //Initialise new Contact
        List<Contact> conList = [SELECT lastName FROM Contact WHERE lastName LIKE : ('%' + lastName + '%')];
        
        if(!conList.isEmpty()) {
            for(Contact con : conList) {
                //Assigning value to the fields from input
                con.lastName = 'Apex Test ' + lastName;
            }
            //Updating List of Contacts
            update conList;
        }
        
        //Count of Records updated
        System.debug('Contacts Updated : ' + conList.size());
        
        //Display changed List of Contacts
        for(Contact con : conList) {
            System.debug('Contacts lastName : ' + con.LastName);            
        }
    }
    public static void upsertContactRecords(String lastName) {
        //Initialise new Contact
        List<Contact> conList = [SELECT lastName FROM Contact WHERE lastName LIKE : ('%' + lastName + '%')];
        
        if(!conList.isEmpty()) {
            for(Contact con : conList) {
                //Assigning value to the fields from input
                con.lastName =  lastName + ' Apex Test';
            }
            //Updating List of Contacts
            upsert conList;
        }
        
        //Count of Records updated
        System.debug('Contacts Updated : ' + conList.size());
        
        //Display changed List of Contacts
        for(Contact con : conList) {
            System.debug('Contacts lastName : ' + con.LastName);            
        }
    }
    public static void deleteContactRecords(String lastName) {
        //Initialise new Contact
        List<Contact> conList = [SELECT lastName FROM Contact WHERE lastName LIKE : ('%' + lastName + '%')];
        
        if(!conList.isEmpty()) {
            //Deleting List of Contacts
            delete conList;
        }
        
        //Count of Records updated
        System.debug('Contacts Deleted : ' + conList.size());
    }
    public static void undeleteContactRecords(String lastName) {
        //Initialise new Contact
        List<Contact> conList = [SELECT lastName FROM Contact WHERE lastName LIKE : ('%' + lastName + '%') ALL ROWS];
        
        if(!conList.isEmpty()) {
            //Deleting List of Contacts
            undelete conList;
        }
        
        //Count of Records updated
        System.debug('Contacts Deleted : ' + conList.size());
    }
}