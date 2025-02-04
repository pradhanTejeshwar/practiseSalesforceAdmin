@isTest
private class AccountTriggerHandlerTest {
    
    @isTest
    static void testUpdateDescription() {
        List<Account> accList = new List<Account>();
        
        for(Integer i=1 ; i < 10 ; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            if(i<5) {
                acc.Industry = 'Media';
            }
            accList.add(acc);
        }
        
        Test.startTest();
        
        insert accList;
        
        Test.stopTest();
        
        List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE AccountId =: accList[0].Id];
        
        System.assert(oppList!=null,'Opportunity was not created !');
    }
    
    @isTest
    static void testUpdateRatingInsert() {
        List<Account> accList = new List<Account>();
        
        for(Integer i=1 ; i < 10 ; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            if(i>5) {
                acc.Industry = 'Chemicals';
            }
            else {
                acc.Industry = 'Media';
            }
            accList.add(acc);
        }       
        
        Test.startTest();
        
        insert accList;
        
        Test.stopTest();
        
        List<Account> updatedAccountList = [SELECT Id, Rating FROM Account WHERE Id =: accList[0].Id];
        
        System.assertEquals('Hot',updatedAccountList[0].Rating,'Account Rating Value is not Updated to Hot !');
    }
    
    @isTest
    static void testUpdateRatingUpdate() {
        List<Account> accList = new List<Account>();
        
        for(Integer i=1 ; i < 10 ; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            if(i<5) {
                acc.Industry = 'Chemicals';
            }
            else {
                acc.Industry = 'Media';
            }
            accList.add(acc);
        }       
        
        Test.startTest();
        
        insert accList;
        
        for(Account acc : accList) {
            acc.Industry = 'Media';
        }
        
        update accList;
        Test.stopTest();
        
        List<Account> updatedAccountList = [SELECT Id, Rating FROM Account WHERE Id =: accList[0].Id];
        System.assertEquals('Hot',updatedAccountList[0].Rating,'Account Rating Value is not Updated to Hot !');
    }
}