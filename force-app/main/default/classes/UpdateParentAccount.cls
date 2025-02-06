public class UpdateParentAccount implements Queueable {
	//variables
    private List<Account> accList;
    private Id privateAccId;
    
    //Constructor
    public updateParentAccount(List<Account> accRecords, Id accId) {
        this.accList = accRecords;
        this.privateAccId = accId;
    }
    
    //method
    public void execute(QueueableContext context) {
        for(Account acc : accList) {
            acc.ParentId = privateAccId;
        }
        
        update accList;
    }
}