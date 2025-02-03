/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2024-12-05
* Last Modification Date: 2024-12-05
*
* This class contains static methods to calculate the area and perimeter of a square.
* Both methods take the side length of the square as input and provide the respective 
* calculation through `System.debug` statements.
*
* Business Use Case:
* - This class provides utility methods for geometric calculations related to squares.
* - It can be used in scenarios where area or perimeter calculations are required for 
*   squares, such as in real-world applications involving geometry or spatial data.
*
* Assumptions:
* - The side length of the square is provided as an `Integer`.
* - The methods use the formula for area (side^2) and perimeter (4 * side).
*
* Dependencies:
* - No external dependencies; this class uses the standard `System.debug` for output.
*
* Change History:
* 2024-12-05: Initial version created by Tejeshwar Pradhan.
* 2025-01-31: Added comments to the code
* 2025-02-02: Changed the class methods to send values instead of printin in system debug
* This class provides two static methods: one for calculating the area and another for 
* calculating the perimeter of a square, both of which output the results to the debug log.
*/

public class SquareStatic {

    /**
     * Calculates and outputs the area of a square.
     * 
     * The area of a square is given by the formula: side * side.
     * 
     * @param s The side length of the square
     * @return The area of the square
     */
    public static Integer area(Integer s) {
        return s * s;
    }

    /**
     * Calculates and outputs the perimeter of a square.
     * 
     * The perimeter of a square is given by the formula: 4 * side.
     * 
     * @param s The side length of the square
     * @return The perimeter of the square
     */
    public static Integer perimeter(Integer s) {
        return 4 * s;
    }

}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Rectangle is a Class and here it is working as a Datatype
//area and perimeter are the static methods called with parameters passed to it
SquareStatic.area(2);
SquareStatic.perimeter(10);

*/