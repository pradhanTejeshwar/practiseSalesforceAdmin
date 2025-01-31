/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-30
* Last Modification Date: 2025-01-30
*
* This class contains a static Boolean variable to prevent recursive calls in Apex.
* It is used as a flag to control the flow of execution and prevent infinite loops 
* or excessive recursion by tracking whether a method has already been called.
*
* Business Use Case:
* - Useful in situations where recursive or nested method calls might occur, 
*   and there's a need to prevent those to avoid excessive system resource usage or 
*   exceeding governor limits in Salesforce.
*
* Assumptions:
* - The flag `firstCall` can be used to track a single entry point for recursive 
*   methods, ensuring that the subsequent recursive calls are prevented.
*
* Dependencies:
* - No external dependencies; this is a self-contained utility for recursion management.
*
* Change History:
* 2025-01-30: Initial version created by Tejeshwar Pradhan.
*
* This class contains a static Boolean variable `firstCall` used to track and control recursion.
*/

public class preventRecursion {

    /**
     * Static Boolean variable to track whether the method has been called before.
     * 
     * This flag helps in preventing recursion by ensuring that the method 
     * doesn't get called multiple times, which could lead to infinite loops.
     */
    public static Boolean firstCall = false;
}