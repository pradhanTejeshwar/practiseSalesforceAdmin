public class FutureAccountsContact {
    
    //Using future annotation to create a future method for asynchronous process
	@future
    public static void countContacts(List<Id> accIds) {
        //Fetch all Account with accIds and storing Id, TotalContacts fields
        List<Account> accList = [SELECT Id, Total_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accIds];
        
        //Looping through the list
        for(Account acc : accList) {
            //Assigning TotalContacts field with the Account Related Contacts size
            acc.Total_Contacts__c = acc.Contacts.size();
        }
        
        //Null Check for the oppList
        if(!accList.isEmpty()) {
            //Updating the List in the System
			update accList;   
        }
    }
}