public class updateTaskCreatedOpportunity {
    public static void updateOpportunityListField() {
        //Initialise Opportunity List oppList with List of Opportunity whose taskCreated field is true
        List<Opportunity> oppList = [SELECT Id, taskCreated__c FROM Opportunity WHERE taskCreated__c = true];
        
        //Loop through all data and set the field for taskCreated as false
        for(Opportunity opp:oppList) {
            opp.taskCreated__c=false;
        }
        
        //Insert updated Records
        update oppList;
    }
}