/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2025-01-25
 * Last Modification Date: 2025-01-25
 *
 * This class contains various methods that demonstrate DML operations (insertion, querying) on the custom Position__c object.
 *
 * Business Use Case:
 * - Insert multiple Position records.
 * - Query and display Position records using different techniques like Set and Map.
 *
 * Methods:
 * - `create2PositionRecords()`: Inserts two Position records into Salesforce.
 * - `displayPositionIdSet()`: Queries all Position records and stores their IDs in a Set.
 * - `displayPositionIdNameMap()`: Queries all Position records and stores the results in a Map using the Position ID as the key.
 * - `displayPositionIdNameMapWithLoop()`: Demonstrates a manual loop to populate a Map with Position records.
 *
 * Change History:
 * 2025-01-25: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added detailed comments for the code
 * 2025-02-01: Write your changes here...
 */

public class PositionAndRelatedDML {

    // Method to create two Position records
    public static void create2PositionRecords() {
        // Initialize posList to store List of Position Records
        List<Position__c> posList = new List<Position__c>();
        
        // Initialize Position Record pos1 and add it to posList
        Position__c pos1 = new Position__c(Name='Test Position Insert 1');
        posList.add(pos1);
        
        // Initialize Position Record pos2 and add it to posList
        Position__c pos2 = new Position__c(Name='Test Position Insert 2');
        //Add pos2 to posList
        posList.add(pos2);
        
        // Insert the list of Position records into Salesforce
        insert posList;
    }

    // Method to query all Position records and display their IDs in a Set
    public static void displayPositionIdSet() {
        // Initialize a Set to store Position record IDs
        Set<Id> posId = new Set<Id>();
        
        // Query all Position records and store the result in posList
        List<Position__c> posList = [SELECT Id FROM Position__c];
        
        // Loop through posList and add the Position IDs to the Set
        for(Position__c pos : posList) {
            posId.add(pos.Id);
        }
        
        // Display the set of Position IDs
        System.debug('Account Set : ' + posId);
    }

    // Method to query all Position records and store them in a Map with Position ID as the key
    public static void displayPositionIdNameMap() {
        // Query all Position records and store the result in posList
        List<Position__c> posList = [SELECT Name FROM Position__c];
        
        // Initialize a Map with Position ID as the key and Position__c as the value
        Map<Id, Position__c> posMap = new Map<Id, Position__c>(posList);
        
        // Display the Position Map in debug logs
        System.debug('Position Map : ' + posMap);
        System.debug('Map Keys : ' + posMap.keySet());
        System.debug('Map Values : ' + posMap.values());
    }

    // Method to demonstrate manually populating a Map with Position records using a loop
    public static void displayPositionIdNameMapWithLoop() {
        // Query all Position records and store the result in posList
        List<Position__c> posList = [SELECT Name FROM Position__c];
        
        // Initialize an empty Map to store Position records using ID as the key
        Map<Id, Position__c> posMap = new Map<Id, Position__c>();
        
        // Loop through the Position records and populate the Map manually
        for(Position__c pos : posList) {
            posMap.put(pos.Id, pos);
        }
        
        // Display the Position Map in debug logs
        System.debug('Position Map : ' + posMap);
        System.debug('Map Keys : ' + posMap.keySet());
        System.debug('Map Values : ' + posMap.values());
    }
}