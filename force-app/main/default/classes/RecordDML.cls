/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-24
* Last Modification Date: 2025-01-31
*
* This class provides utility methods for creating and inserting various Salesforce records, 
* including Account, Opportunity, Contact, and Case. The methods are designed to handle 
* object creation and field assignment dynamically based on the input parameters. 
*
* Business Use Case:
* - Create and manage related records (Account, Opportunity, Contact, Case) 
*   within Salesforce to maintain proper relationships between objects.
* - Useful for data population, testing, or automating record creation in Salesforce.
*
* Assumptions:
* - The required custom fields (e.g., taskCreated__c) and relationships between objects 
*   (e.g., Account-Contact, Account-Opportunity) are properly set up.
*
* Dependencies:
* - Requires permissions to insert and update Salesforce records (Account, Opportunity, Contact, Case).
*
* Change History:
* 2025-01-25: Initial version created by Tejeshwar Pradhan.
* 2025-01-31: Added detailed comments to explain the code flow.
*
* This class contains methods to create and insert records for various Salesforce objects 
* such as Account, Opportunity, Contact, and Case.
*/

public class RecordDML {

    /**
     * Creates and returns an Account record with the provided field values.
     * 
     * @param accName Name of the Account.
     * @param type Type of the Account.
     * @param rating Rating of the Account.
     * @return Account record with assigned field values.
     */
    public static Account accountRecord(String accName, String type, String rating) {
        // Initialize Account Object
        Account acc = new Account();
        
        // Account Field Assignment
        acc.Name = accName;
        acc.Type = type;
        acc.Rating = rating;
        
        // Return Account Record
        return acc;
    }

    /**
     * Creates and returns an Opportunity record with the provided field values, 
     * and associates it with a new Account.
     * 
     * @param oppName Name of the Opportunity.
     * @param stage Stage of the Opportunity.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     * @return Opportunity record with assigned field values and related Account.
     */
    public static Opportunity opportunityRecord(String oppName, String stage, String accName, String type, String rating) {
        // Initialize Opportunity Object
        Opportunity opp = new Opportunity();
        
        // Opportunity Field Assignment
        opp.Name = oppName;
        opp.CloseDate = System.today() + 28; // Set CloseDate to 28 days from today
        opp.StageName = stage;
        opp.AccountId = createAccount(accName, type, rating); // Create and link related Account
        
        // Return Opportunity Record
        return opp;
    }

    /**
     * Creates and returns a Contact record with the provided field values, 
     * and associates it with a new Account.
     * 
     * @param firstName First name of the Contact.
     * @param lastName Last name of the Contact.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     * @return Contact record with assigned field values and related Account.
     */
    public static Contact contactRecord(String firstName, String lastName, String accName, String type, String rating) {
        // Initialize Contact Object
        Contact con = new Contact();
        
        // Contact Field Assignment
        con.FirstName = firstName;
        con.LastName = lastName;
        con.AccountId = createAccount(accName, type, rating); // Create and link related Account
        
        // Return Contact Record
        return con;
    }

    /**
     * Creates and returns a Case record with the provided field values, 
     * and associates it with a new Account.
     * 
     * @param status Status of the Case.
     * @param origin Origin of the Case.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     * @return Case record with assigned field values and related Account.
     */
    public static Case caseRecord(String status, String origin, String accName, String type, String rating) {
        // Initialize Case Object
        Case cas = new Case();
        
        // Case Field Assignment
        cas.Status = status;
        cas.Origin = origin;
        cas.AccountId = createAccount(accName, type, rating); // Create and link related Account
            
        // Return Case Record
        return cas;
    }

    /**
     * Creates and inserts an Account record and returns its Id.
     * 
     * @param name Name of the Account.
     * @param type Type of the Account.
     * @param rating Rating of the Account.
     * @return Id of the newly created Account record.
     */
    public static Id createAccount(String name, String type, String rating) {
        // Initialize Account Object and assign fields using accountRecord method
        Account acc = accountRecord(name, type, rating);
        
        // Insertion of Account Record into Salesforce
        insert acc;
        
        // Return Account Id
        return acc.Id;
    }

    /**
     * Creates and inserts an Opportunity record and returns its Id.
     * 
     * @param oppName Name of the Opportunity.
     * @param stage Stage of the Opportunity.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     * @return Id of the newly created Opportunity record.
     */
    public static Id createOpportunity(String oppName, String stage, String accName, String type, String rating) {
        // Initialize Opportunity Object and assign fields using opportunityRecord method
        Opportunity opp = opportunityRecord(oppName, stage, accName, type, rating);
        
        // Insertion of Opportunity Record into Salesforce
        insert opp;

        // Return Opportunity Id
        return opp.Id;
    }

    /**
     * Creates and inserts a Contact record and returns its Id.
     * 
     * @param firstName First name of the Contact.
     * @param lastName Last name of the Contact.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     * @return Id of the newly created Contact record.
     */
    public static Id createContact(String firstName, String lastName, String accName, String type, String rating) {
        // Initialize Contact Object and assign fields using contactRecord method
        Contact con = contactRecord(firstName, lastName, accName, type, rating);
        
        // Insertion of Contact Record into Salesforce
        insert con;
        
        // Return Contact Id
        return con.Id;
    }

    /**
     * Creates and inserts a Case record and returns its Id.
     * 
     * @param status Status of the Case.
     * @param origin Origin of the Case.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     * @return Id of the newly created Case record.
     */
    public static Id createCase(String status, String origin, String accName, String type, String rating) {
        // Initialize Case Object and assign fields using caseRecord method
        Case cas = caseRecord(status, origin, accName, type, rating);
        
        // Insertion of Case Record into Salesforce
        insert cas;
        
        // Return Case Id
        return cas.Id;
    }

    /**
     * Creates and inserts a Contact record with a related Account.
     * 
     * @param firstName First name of the Contact.
     * @param lastName Last name of the Contact.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     */
    public static void createContactWithAccount(String firstName, String lastName, String accName, String type, String rating) {
        // Initialize Contact Object and assign fields using contactRecord method
        Contact con = contactRecord(firstName, lastName, accName, type, rating);
        
        // Insertion of Contact Record into Salesforce
        insert con;
    }

    /**
     * Creates and inserts an Opportunity record with a related Account.
     * 
     * @param oppName Name of the Opportunity.
     * @param stage Stage of the Opportunity.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     */
    public static void createOpportunityWithAccount(String oppName, String stage, String accName, String type, String rating) {
        // Initialize Opportunity Object and assign fields using opportunityRecord method
        Opportunity opp = opportunityRecord(oppName, stage, accName, type, rating);

        // Insertion of Opportunity Record into Salesforce
        insert opp;
    }

    /**
     * Creates and inserts a Case record with a related Account.
     * 
     * @param status Status of the Case.
     * @param origin Origin of the Case.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     */
    public static void createCaseWithAccount(String status, String origin, String accName, String type, String rating) {
        // Initialize Case Object and assign fields using caseRecord method
        Case cas = caseRecord(status, origin, accName, type, rating);
        
        // Insertion of Case Record into Salesforce
        insert cas;
    }

    /**
     * Creates and inserts both an Opportunity and a Contact record with the same related Account.
     * 
     * @param firstName First name of the Contact.
     * @param lastName Last name of the Contact.
     * @param oppName Name of the Opportunity.
     * @param stage Stage of the Opportunity.
     * @param accName Name of the related Account.
     * @param type Type of the related Account.
     * @param rating Rating of the related Account.
     */
    public static void createOpportunityAndContactWithAccount(String firstName, String lastName, String oppName, String stage, String accName, String type, String rating) {
        // Initialize Opportunity Object and assign fields using opportunityRecord method
        Opportunity opp = opportunityRecord(oppName, stage, accName, type, rating);
        
        // Initialize Contact Object and assign fields using contactRecord method
        Contact con = contactRecord(firstName, lastName, accName, type, rating);
        con.AccountId = opp.AccountId; // Link Contact to the created Opportunity's Account
        
        // Insertion of Opportunity and Contact Records into Salesforce
        insert opp;
        insert con;
    }
	/*
	public static void createOpportunityAndCaseWithAccount(String name, String stage, String accName, String type, String rating) {
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