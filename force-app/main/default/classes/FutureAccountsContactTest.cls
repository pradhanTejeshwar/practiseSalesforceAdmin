@isTest
public class FutureAccountsContactTest {
	@isTest
    private static void testCountContacts() {
        //Creating Test Data
        List<Account> accList = new List<Account>();

        for(Integer i=0 ; i<300 ; i++) {
            accList.add(new Account(Name = 'Test ' + i));
        }
        
        //Start Test
        Test.startTest();
        
        //Insert Account List to Test Data
        insert accList;
        
        //Variables
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new List<Id>();
        
        //Looping through accList
        for(Account acc : accList) {
            //Creating a single Contact for every Account created inside Test Data
            Contact con = new Contact(firstName = 'Test', lastName = acc.Name, AccountId = acc.Id);
            //adding new Contact to the List
            conList.add(con);
            //adding Id for each Account iterated to accIds
            accIds.add(acc.Id);
        }
        
        //Insert ContactList to Test Data 
        insert conList;
        
        //Calling the method of the class in test passing the accIds
        FutureAccountsContact.countContacts(accIds);
        
        //Stop Test
        Test.stopTest();
        
        //Fetching updated Account List with new Data created to check business logic
        List<Account> accs = [SELECT Id, Total_Contacts__c FROM Account];
        
        //Checking whether TotalContact field updated with data created
        System.assertEquals(1,accs[0].Total_Contacts__c,'Contacts are not counted successfully!');
    }
}