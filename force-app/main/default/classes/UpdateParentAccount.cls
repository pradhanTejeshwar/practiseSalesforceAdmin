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

//Execute in Anonymous Window
/*
List<Account> accList = [SELECT Id FROM Account WHERE Name LIKE '%Test%'];
Id parentId = [SELECT Id FROM Account WHERE Name = 'Demo Account'][0].Id;
UpdateParentAccount updateJob = new UpdateParentAccount(accList, parentId);
Id jobId = System.enqueueJob(updateJob);
*/