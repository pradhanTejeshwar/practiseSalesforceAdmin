@isTest
public class DailyOpportunityProcessorTest {
    
    @isTest
    private static void testScheduleApex() {
        String sch = '0 0 0 ? * * * *';
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=0 ; i<500 ; i++) {
            if(i<250) {
                oppList.add(new Opportunity(Name = 'Test Opportunity ' + i, CloseDate = System.today(), StageName = 'Prospecting', Amount = 1000));
            }
            else {
                oppList.add(new Opportunity(Name = 'Test Opportunity ' + i, CloseDate = System.today(), StageName = 'Prospecting', Amount = 1000 , LeadSource = 'Email'));
            }
        }
        
        if(!oppList.isEmpty()) {
            insert oppList;
        }
        
        Test.startTest();
        String JobId = System.schedule('Process Opportunities', sch, new DailyOpportunityProcessor());
        Test.stopTest();
        
        List<Opportunity> updatedOpps = [SELECT Id, LeadSource FROM Opportunity WHERE LeadSource = 'Web'];
        
        System.assertEquals(0,updatedOpps.size());
    }
}