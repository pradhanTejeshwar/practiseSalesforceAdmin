/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2024-12-05
* Last Modification Date: 2024-12-31
*
* This class provides static methods for calculating the area and perimeter of a rectangle.
* The methods take the length and breadth of the rectangle as input and output the 
* results using `System.debug`.
*
* Business Use Case:
* - This class is useful for applications related to geometry, construction, and design, 
*   where calculations for area and perimeter of a rectangle are frequently needed.
*
* Assumptions:
* - The inputs for the length and breadth of the rectangle are provided as integers.
* - The formulas used for area and perimeter are as follows:
*   - Area = Length * Breadth
*   - Perimeter = 2 * (Length + Breadth)
*
* Dependencies:
* - No external dependencies; this class uses the standard `System.debug` for output.
*
* Change History:
* 2024-12-05: Initial version created by Tejeshwar Pradhan.
* 2024-12-31: Added comments to the code
*
* This class contains two static methods: one for calculating the area of a rectangle 
* and another for calculating its perimeter.
*/

public class RectangleStatic {
    
    /**
     * Calculates and outputs the area of a rectangle.
     * 
     * The area of a rectangle is calculated using the formula:
     * Area = Length * Breadth
     * 
     * @param length The length of the rectangle
     * @param breadth The breadth of the rectangle
     */
    public static void area(Integer length, Integer breadth) {
        // Calculate area and output the result to the debug log
        System.debug('Area : ' + length * breadth);
    }
    
    /**
     * Calculates and outputs the perimeter of a rectangle.
     * 
     * The perimeter of a rectangle is calculated using the formula:
     * Perimeter = 2 * (Length + Breadth)
     * 
     * @param length The length of the rectangle
     * @param breadth The breadth of the rectangle
     */
    public static void perimeter(Integer length, Integer breadth) {
        // Calculate perimeter and output the result to the debug log
        System.debug('Perimeter : ' + 2 * (length + breadth));
    }
}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//RectangleStatic is a Class
//area and perimeter are the methods being called from the class
RectangleStatic.area(1,20);
RectangleStatic.perimeter(300,4000);

RectangleStatic.area(400,30);
RectangleStatic.perimeter(20,1);

*/