public class ContactTriggerHandler {
    public static void totalContactCount(List<Contact> conList) {
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        
        for(Contact con : conList) {
            if(con.AccountId != null) {
                accIds.add(con.AccountId);
            }
        }
        for(Account acc : [SELECT Id, Total_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : accIds]) {
            acc.Total_Contacts__c = acc.Contacts.size();
            accList.add(acc);
        }
        if(!accList.isEmpty()) {
            try {
                update accList;
            } catch (Exception e) {
                System.debug('Exception Occurred: ' + e.getMessage());
            }
        }
    }
}