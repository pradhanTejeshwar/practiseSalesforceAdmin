public class DailyOpportunityProcessor implements Schedulable {
	public void execute(SchedulableContext ctx) {
        List<Opportunity> oppList = [SELECT Id, Account.Name, LeadSource FROM Opportunity WHERE Account.Name LIKE '%Test%'];
        
        for(Opportunity opp : oppList) {
            opp.LeadSource = null;
        }
        
        if(!oppList.isEmpty()) {
            update oppList;
        }
    }
}