public class PositionAndRelatedDML {
    public static void create2PositionRecords() {
        //Initialize posList to store List of Position Records
        List<Position__c> posList = new List<Position__c>();
        
        //Initialize Position Record pos1
        Position__c pos1 = new Position__c(Name='Test Position Insert 1');
        //Add pos1 to posList
        posList.add(pos1);
        
        //Initialize Position Record pos1
        Position__c pos2 = new Position__c(Name='Test Position Insert 2');
        //Add pos2 to posList
        posList.add(pos2);
        
        //Insert posList
        insert posList;
    }
    public static void displayPositionIdSet() {
        set<Id> posId = new set<Id>();
        List<Position__c> posList = [SELECT Id FROM Position__c];
        
        for(Position__c pos : posList) {
            posId.add(pos.Id);
        }
        
        System.debug('Account Set : ' + posId);
    }
    public static void displayPositionIdNameMap() {
        //Initialise List posList and store PositionRecords Data
        List<Position__c> posList = [SELECT Name FROM Position__c];
        //Initialise Map posMap and store posList
        Map<Id,Position__c> posMap = new Map<Id,Position__c>(posList);
        
        //Display in debug the Map accMap
        System.debug('Position Map : ' + posMap);
        System.debug('Map Keys : ' + posMap.keySet());
        System.debug('Map Values : ' + posMap.values());
    }
    public static void displayPositionIdNameMapWithLoop() {
        //Initialise List posList and store PositionRecords Data
        List<Position__c> posList = [SELECT Name FROM Position__c];
        //Initialise Map posMap and store posList
        Map<Id,Position__c> posMap = new Map<Id,Position__c>();
        
        //Loop to store Position data into key and value in posMap
        for(Position__c pos:posList) {
            posMap.put(pos.id, pos);
        }
        
        //Display in debug the Map accMap
        System.debug('Position Map : ' + posMap);
        System.debug('Map Keys : ' + posMap.keySet());
        System.debug('Map Values : ' + posMap.values());
    }
}