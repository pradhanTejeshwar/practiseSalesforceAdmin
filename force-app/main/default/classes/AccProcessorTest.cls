@isTest
public class AccProcessorTest {
	@isTest
    public static void testBatchClass() {
        List<Account> accList = new List<Account>();
        
        for(Integer i=0 ; i<200 ; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            accList.add(acc);
        }
        
        Test.startTest();
        
        insert accList;
        
        AccProcessor accProcessor = new AccProcessor();
        Id batchId = Database.executeBatch(accProcessor, 200);
        
        Test.stopTest();
        
        List<Account> accListUpdated = [SELECT Id FROM Account WHERE Active__c = 'No'];
        
        System.assertEquals(200, accListUpdated.size());
    }
}