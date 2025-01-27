/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2025-01-28
 * Last Modification Date: 2025-01-28
 *
 * This class contains methods to perform database operations
 * for inserting Contact records in Salesforce using normal DML
 * and the Database.insert method for error handling. These methods
 * demonstrate handling errors and logging useful information for
 * debugging purposes.
 *
 * Business Use Case:
 * - Insert multiple Contact records into Salesforce while handling errors
 *   gracefully, ensuring failed records are logged and success details are captured.
 *
 * Assumptions:
 * - The Contact records will contain minimal data, and some records may 
 *   have missing mandatory fields, which will trigger errors.
 * - The system is configured to handle both DML and Database.insert operations.
 *
 * Dependencies:
 * - Requires proper permissions to insert Contact records in Salesforce.
 *
 * Change History:
 * 2025-01-28: Initial version created by Tejeshwar Pradhan.
 * 2025-01-29: Write your changes here...
 *
 * This class demonstrates the use of standard DML and Database.insert methods
 * to insert Contact records and handle potential errors using detailed logging.
 */
public class DatabaseOperations {

    /**
     * Inserts a list of Contact records using normal DML.
     * Demonstrates handling exceptions with a try-catch block.
     * Logs error messages for failed insertions.
     */
    public static void normalInsertContact() {
        // Create a list of Contact records with some sample data
        List<Contact> conList = new List<Contact> {
            new Contact(lastName = 'Dennis'),
            new Contact(lastName = 'Harrison'),
            new Contact() // A Contact record with missing mandatory fields
        };

        try {
            // Attempt to insert the Contact records using DML
            insert conList;
        } catch (Exception e) {
            // Log the exception details to debug logs
            System.debug('Exception Occurred: ' + e);
            System.debug('Error Message: ' + e.getMessage());
        }
    }

    /**
     * Inserts a list of Contact records using the Database.insert method.
     * Demonstrates detailed error handling and logging for failed operations.
     * This method is more suitable for bulk insertions as it provides feedback
     * for each record’s success or failure.
     */
    public static void databaseInsertContact() {
        // Create a list of Contact records with some sample data
        List<Contact> conList = new List<Contact> {
            new Contact(lastName = 'Dennis'),
            new Contact(lastName = 'Harrison'),
            new Contact() // A Contact record with missing mandatory fields
        };

        try {
            // Use Database.insert to perform the operation and capture the results
            Database.SaveResult[] srList = Database.insert(conList);

            // Iterate over the SaveResult list to check the success or failure of each record
            for (Database.SaveResult sr : srList) {
                if (sr.isSuccess()) {
                    // Log success details for each successfully inserted record
                    System.debug('Successfully Inserted Contact Id: ' + sr.getId());
                } else {
                    // Handle errors for records that failed to insert
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('The Following Error has Occurred:');
                        System.debug('Error Details: ' + err);
                        System.debug('Status Code: ' + err.getStatusCode());
                        System.debug('Error Message: ' + err.getMessage());
                        System.debug('Affected Fields: ' + err.getFields());
                    }
                }
            }
        } catch (Exception e) {
            // Log any unexpected exceptions to debug logs
            System.debug('Exception Occurred: ' + e);
            System.debug('Error Message: ' + e.getMessage());
        }
    }
}