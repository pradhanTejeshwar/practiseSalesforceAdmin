public class ContactController {
    
    private String sortOrder = 'FirstName';
    
    public List<Contact> getContacts() {
        
        List<Contact> results = Database.query(
            'SELECT Id, FirstName, LastName, Email ' + 
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' DESC ' +
            'LIMIT 10'
        );
        return results;
    }
    
    public void sortByLastName() {
        this.sortOrder = 'LastName';
    }
    
    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
    }
    
    public void sortByEmail() {
        this.sortOrder = 'Email';
    }
}