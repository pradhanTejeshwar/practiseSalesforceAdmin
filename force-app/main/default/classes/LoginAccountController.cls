// Apex Controller
public class LoginAccountController {
    public String username { get; set; }
    public String password { get; set; }
    public List<Account> accounts { get; set; }
    public Boolean isLoggedIn { get; set; }
    public Integer totalRecords { get; set; }
    
    public LoginAccountController() {
        isLoggedIn = false;
        accounts = new List<Account>();
        totalRecords = 0;
    }
    
    public PageReference login() {
        try {
            User u = [SELECT Id FROM User WHERE Username = :username LIMIT 1];
            isLoggedIn = true;
            fetchAccounts(u.Id);
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Invalid login credentials'));
        }
        return null;
    }
    
    private void fetchAccounts(Id userId) {
        Set<Id> accountIds = new Set<Id>();
        
        // Fetch Account Ids from Contacts
        for (Contact c : [SELECT AccountId FROM Contact WHERE CreatedById = :userId]) {
            if (c.AccountId != null) {
                accountIds.add(c.AccountId);
            }
        }
        
        // Fetch Account Ids from Opportunities
        for (Opportunity o : [SELECT AccountId FROM Opportunity WHERE CreatedById = :userId]) {
            if (o.AccountId != null) {
                accountIds.add(o.AccountId);
            }
        }
        
        // Fetch Account Ids from Cases
        for (Case c : [SELECT AccountId FROM Case WHERE CreatedById = :userId]) {
            if (c.AccountId != null) {
                accountIds.add(c.AccountId);
            }
        }
        
        // Fetch Accounts based on collected Account Ids
        if (!accountIds.isEmpty()) {
            accounts = [SELECT Id, Name FROM Account WHERE Id IN :accountIds];
        } else {
            accounts.clear();
        }
        
        totalRecords = accounts.size();
    }
    
}