public class AccountAndRelatedDML {
    public static void createAccount(String accName, String type, String rating) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Insert Account Record
        insert acc;
    }
    public static void createAccountWithOpportunity(String accName, String type, String rating, String oppName, String stage) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Insert Account Record
        insert acc;
        
        //Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        
        //Opportunity Field Assignment
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28;
        opp.StageName = stage;
        opp.AccountId = acc.Id;
        
        //Insert Opportunity Record
        Insert opp;
    }
    public static void createAccountWithContact(String accName, String type, String rating, String firstName, String lastName) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Insert Account Record
        insert acc;
        
        //Initialize Contact Object
        Contact con = new Contact();
        
        //Contact Field Assignment
        con.FirstName = firstName;
        con.LastName = lastname;
        con.AccountId = acc.Id;
        
        //Insert Contact Record
        Insert con;
    }
    public static void createAccountWithCase(String accName, String type, String rating, String status, String origin) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Insert Account Record
        insert acc;
        
        //Initialize Case Object
        Case cas = new Case();
        
        //Case Field Assignment
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = acc.Id;
            
        //Insert Case Record
        Insert cas;
    }
    public static void createAccountWithOpportunityAndContact(String accName, String type, String rating, String oppName, String stage, String firstName, String lastName) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Insert Account Record
        insert acc;
        
        //Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        
        //Opportunity Field Assignment
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28;
        opp.StageName = stage;
        opp.AccountId = acc.Id;
        
		//Initialize Contact Object
        Contact con = new Contact();
        
        //Contact Field Assignment
        con.FirstName = firstName;
        con.LastName = lastname;
        con.AccountId = acc.Id;
        
        //Insert Opportunity Record
        Insert opp;
        //Insert Contact Record
        Insert con;
    }
    public static void createAccountWithOpportunityAndCase(String accName, String type, String rating, String oppName, String stage, String status, String origin) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Insert Account Record
        insert acc;
        
        //Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        
        //Opportunity Field Assignment
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28;
        opp.StageName = stage;
        opp.AccountId = acc.Id;
        
		//Initialize Case Object
        Case cas = new Case();
        
        //Case Field Assignment
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = acc.Id;
           
        //Insert Opportunity Record
        Insert opp;
        //Insert Case Record
        Insert cas;
    }
    public static void createAccountWithContactAndCase(String accName, String type, String rating, String firstName, String lastName, String status, String origin) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Insert Account Record
        insert acc;
        
        //Initialize Contact Object
        Contact con = new Contact();
        
        //Contact Field Assignment
        con.FirstName = firstName;
        con.LastName = lastname;
        con.AccountId = acc.Id;
        
		//Initialize Case Object
        Case cas = new Case();
        
        //Case Field Assignment
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = acc.Id;
           
        //Insert Contact Record
        Insert con;
        //Insert Case Record
        Insert cas;
    }
    public static void createAccountWithOpportunityAndContactAndCase(String accName, String type, String rating, String oppName, String stage, String firstName, String lastName, String status, String origin) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Insert Account Record
        insert acc;
        
        //Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        
        //Opportunity Field Assignment
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28;
        opp.StageName = stage;
        opp.AccountId = acc.Id;
        
        //Initialize Contact Object
        Contact con = new Contact();
        
        //Contact Field Assignment
        con.FirstName = firstName;
        con.LastName = lastname;
        con.AccountId = acc.Id;
        
		//Initialize Case Object
        Case cas = new Case();
        
        //Case Field Assignment
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = acc.Id;
           
        //Insert Opportunity Record
        Insert opp;
        //Insert Contact Record
        Insert con;
        //Insert Case Record
        Insert cas;
    }
    public static void create2AccountRecords() {
        //Initialize accList to store List of Account Records
        List<Account> accList = new List<Account>();
        
        //Initialize Account Record acc1
        Account acc1 = new Account(Name='Test Account Insert 1');
        //Add acc1 to accList
        accList.add(acc1);
        
        //Initialize Account Record acc1
        Account acc2 = new Account(Name='Test Account Insert 2');
        //Add acc2 to accList
        accList.add(acc2);
        
        //Insert accList
        insert accList;
    }
    public static void displayAccountIdSet() {
        //Initialise Set accId
        set<Id> accId = new set<Id>();
        //Initialise List accList and store AccounRecords with Id
        List<Account> accList = [SELECT Id FROM Account];
        
        //Loop through all accountRecords to store Id into Set accId
        for(Account acc : accList) {
            accId.add(acc.Id);
        }
        
        //Display in debug the Set accId
        System.debug('Account Set : ' + accId);
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
        for(Account acc:accList) {
            accMap.put(acc.id, acc);
        }
        
        //Display in debug the Map accMap
        System.debug('Account Map : ' + accMap);
        System.debug('Map Keys : ' + accMap.keySet());
        System.debug('Map Values : ' + accMap.values());
    }
}