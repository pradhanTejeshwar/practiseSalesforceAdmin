public class AccProcessor implements Database.Batchable<sObject>, Database.stateful {
    public integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
    	return Database.getQueryLocator([SELECT Id, Active__c FROM Account]);
    }
    
    public void execute(Database.BatchableContext bc, List<Account> accList) {
        if(!accList.isEmpty()) {
            for(Account acc : accList) {
                if(acc.Active__c == null) {
                    acc.Active__c = 'No';
                }
            }
            update accList;
            recordCount += accList.size();
        }
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug('Total records processed : ' + recordCount);
    }
}

//Execute in Anonymous Window
/*
AccProcessor accProcessor = new AccProcessor();
Id batchId = Database.executeBatch(accProcessor);
*/