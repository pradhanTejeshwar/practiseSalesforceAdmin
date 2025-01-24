public class RecordDML {
	public static Account accountRecord(String accName, String type, String rating) {
        //Initialize Account Object
        Account acc = new Account();
        
        //Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        //Return Account Record
        return acc;
    }
    public static Opportunity opportunityRecord(String oppName, String stage, String accName, String type, String rating) {
        //Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        
        //Opportunity Field Assignment
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28;
        opp.StageName = stage;
        if(accName != null || type != null || rating != null)
        	opp.AccountId = createAccount(accName, type, rating);
        
        //Return Opportunity Record
        return opp;
    }
    public static Contact contactRecord(String firstName, String lastName, String accName, String type, String rating) {
        //Initialize Contact Object
        Contact con = new Contact();
        
        //Contact Field Assignment
        con.FirstName = firstName;
        con.LastName = lastname;
        con.AccountId = createAccount(accName, type, rating);
        
        //Return Contact Record
        return con;
    }
    public static Case caseRecord(String status, String origin, String accName, String type, String rating) {
        //Initialize Case Object
        Case cas = new Case();
        
        //Case Field Assignment
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = createAccount(accName, type, rating);
            
        //Return Case Record
        return cas;
    }
    public static Id createAccount(String name, String type, String rating) {
        //Initialize Account Object
        //System.debug('3 createAccount Method called');
        Account acc = accountRecord(name,type,rating);
        //System.debug('6 Before Account Insert');
        //Insertion of Account Record
        insert acc;
        //System.debug('7 After Account Insert');
        //Return Account Id
        return acc.Id;
    }
    public static Id createOpportunity(String oppName, String stage, String accName, String type, String rating) {
        //Initialize Opportunity Object
        //System.debug('1 createOpportunity Method Called');
        Opportunity opp = opportunityRecord(oppName,stage,accName,type,rating);
        //System.debug('9 Before inserting Opportunity with opportunityRecord opp : ' + opp);
        //Insertion of Opportunity Record
        insert opp;
        //System.debug('10 After Opportunity Insert');
        //Return Opportunity Id
        //System.debug('11 Before returning OpportunityId');
        return opp.Id;
    }
    public static Id createContact(String firstName, String lastName, String accName, String type, String rating) {
        //Initialize Contact Object
        Contact con = ContactRecord(firstName,lastName,accName,type,rating);
        
        //Insertion of Contact Record
        insert con;
        
        //Return Contact Id
        return con.Id;
    }
    public static Id createCase(String status, String origin, String accName, String type, String rating) {
        //Initialize Case Object
        Case cas = CaseRecord(status,origin,accName,type,rating);
        
        //Insertion of Case Record
        insert cas;
        
        //Return Case Id
        return cas.Id;
    }
    public static void createContactWithAccount(String firstName, String lastName, String name, String type, String rating) {
        //Initialize Contact Object
        Contact con = new Contact();
        //Contact Field Assignment
        con.FirstName = firstName;
        con.LastName = lastName;
        con.AccountId = RecordDML.createAccount(name, type, rating);
        //Insertion of Contact Record
        insert con;
    }
    public static void createOpportunityWithAccount(String name, String stage, String accountName, String type, String rating) {
        //Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        //Opportunity Field Assignment
        opp.Name = name;
        opp.CloseDate = System.today() + 28;
        opp.StageName = stage;
        opp.AccountId = RecordDML.createAccount(name, type, rating);
        //Insertion of Opportunity Record
        insert opp;
    }
    public static void createCaseWithAccount(String status, String origin, String name, String type, String rating) {
        //Initialize Case Object
        Case cas = new Case();
        //Case Field Assignment
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = RecordDML.createAccount(name, type, rating);
        //Insertion of Case Record
        insert cas;
    }
    public static void createOpportunityAndContactWithAccount(String firstName, String lastName, String name, String stage, String accountName, String type, String rating) {
        //Initialize Contact Object
        Contact con = new Contact();
        //Contact Field Assignment
        con.FirstName = firstName;
        con.LastName = lastName;
        con.AccountId = RecordDML.createAccount('Apex Contact and Account Linked Create', 'Prospect', 'Warm');
        //Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        //Opportunity Field Assignment
        opp.Name = name;
        opp.CloseDate = System.today() + 28;
        opp.StageName = stage;
        opp.AccountId = con.AccountId;
        //Insertion of Opportunity Record and Contact Record
        insert opp;
        insert con;
    }
	/*
	public static void createOpportunityAndCaseWithAccount(String name, String stage, String accountName, String type, String rating) {
        //Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        //Opportunity Field Assignment
        opp.Name = name;
        opp.CloseDate = System.today() + 28;
        opp.StageName = stage;
        opp.AccountId = RecordDML.createAccount(name, type, rating);
        //Initialize Case Object
        Case cas = new Case();
        //Case Field Assignment
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = opp.AccountId;
        //Insertion of Case Record
        insert cas;
        insert opp;
    }
    createCaseAndContactWithAccount() {   
    }
    createOpportunityAndCaseAndContactWithAccount() {
    }
	*/
}