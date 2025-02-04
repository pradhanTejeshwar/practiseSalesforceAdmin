public class DataFactory {
    public static List<Account> createTestAccountRecords(String name, Integer count, Boolean isInsert) {
        List<Account> accList = new List<Account>();
        
        for(Integer i=0 ; i<count ; i++) {
            accList[i].Name = name + ' ' + i;
        }
        
        if(isInsert) {
            insert accList;
        }
        
        return accList;
    }
    public static void testRunAs() {
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        User u = new User(Alias = 'standt', Email = 'standarduser@testorg.com', EmailEncodingKey = 'UTF-8', LastName = 'Testing', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', ProfileId = p.Id, TimeZoneSidKey = 'America/Los_Angeles', UserName = uniqueUserName);
        
        System.runAs(u) {
            System.debug('Current User : ' + UserInfo.getUserName());
            System.debug('Current Profile : ' + UserInfo.getProfileId());
        }
    }
}