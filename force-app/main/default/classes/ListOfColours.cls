/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2025-01-23
* Last Modification Date: 2025-01-23
*
* This class provides a method to return a predefined list of color names.
* The method returns a list of strings representing the colors Red, Green, and Blue.
*
* Business Use Case:
* - This class can be useful in scenarios where a predefined list of colors is needed 
*   for processing, such as when creating user interfaces, charts, or visual elements 
*   that require color options.
*
* Assumptions:
* - The colors provided in the list are static and predefined for this example.
* - The method `colourList` is expected to return a list of string values, which can be 
*   used in various parts of the code where a list of colors is needed.
*
* Dependencies:
* - No external dependencies; this class simply returns a list of string values.
*
* Change History:
* 2025-01-23: Initial version created by Tejeshwar Pradhan.
*
* This class contains a method that returns a list of color names.
*/

public class ListOfColours {

    /**
     * Returns a predefined list of color names.
     * 
     * This method initializes a list of strings and populates it with predefined color 
     * values, then returns the list to the caller.
     * 
     * @return A list of string values representing color names (Red, Green, Blue).
     */
    public static List<String> colourList() {
        // Initialize a new list to hold color names
        List<String> colour = new List<String>();
        
        // Add predefined color names to the list
        colour.add('Red');
        colour.add('Green');
        colour.add('Blue');
        
        // Return the list of colors
        return colour;
    }
}