public class CreateAccountRecord {
    public static Id create(String name, String type) {
        Account acc = new Account();
        acc.Name = name;
        acc.Type = type;
        insert acc;
        return acc.Id;
    }
}