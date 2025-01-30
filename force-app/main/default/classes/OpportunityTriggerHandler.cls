public class OpportunityTriggerHandler {
    public static void validateAmountNull(List<Opportunity> oppList) {
        for(Opportunity opp : oppList) {
            if(opp.Amount == null) {
                opp.addError('Amount should not be null');
            }
        }
    }
    public static void udpateDescription(List<Opportunity> oppList, Map<Id, Opportunity> oppOldMap) {
		List<Opportunity> oppUpdate = new List<Opportunity>();
        for(Opportunity opp : oppList) {
            Opportunity o = new Opportunity();
            o.Id = opp.Id;
            if(opp.StageName != oppOldMap.get(opp.Id).StageName && opp.StageName == 'Closed Won') {
                o.Description = oppOldMap.get(opp.Id).Description + '\n' + 'Opportunity is Closed Won';
            }
            if(opp.StageName != oppOldMap.get(opp.Id).StageName && opp.StageName == 'Closed Lost') {
                o.Description = oppOldMap.get(opp.Id).Description + '\n' + 'Opportunity is Closed Lost';
            }
            oppUpdate.add(o);
        }
        if(!oppUpdate.isEmpty()) {
            update oppUpdate;
        }
    }
}