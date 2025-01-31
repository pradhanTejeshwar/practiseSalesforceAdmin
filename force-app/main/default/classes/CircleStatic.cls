/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2024-12-05
* Last Modification Date: 2024-12-05
*
* This class contains static methods to calculate the area and circumference of a circle.
* Both methods take the radius of the circle as input and provide the respective 
* calculations through `System.debug` statements.
*
* Business Use Case:
* - This class provides utility methods for geometric calculations related to circles.
* - It can be used in scenarios requiring circle measurements, such as in engineering, 
*   architectural designs, or scientific applications.
*
* Assumptions:
* - The radius of the circle is provided as a `Decimal`.
* - The methods use the formulas for area (π * r^2) and circumference (2 * π * r), 
*   with an approximation for π (3.14).
*
* Dependencies:
* - No external dependencies; this class uses the standard `System.debug` for output.
*
* Change History:
* 2024-12-05: Initial version created by Tejeshwar Pradhan.
* 2024-01-31: Added comments to the code
* 
* This class provides two static methods: one for calculating the area and another for 
* calculating the circumference of a circle, both of which output the results to the debug log.
*/

public class CircleStatic {

    /**
     * Calculates and outputs the area of a circle.
     * 
     * The area of a circle is given by the formula: π * r^2.
     * Here, we use an approximation of π (3.14).
     * 
     * @param r The radius of the circle
     */
    public static void area(Decimal r) {
        // Calculate the area of the circle and output the result to the debug log
        System.debug('Area : ' + 3.14 * r * r);
    }
    
    /**
     * Calculates and outputs the circumference of a circle.
     * 
     * The circumference of a circle is given by the formula: 2 * π * r.
     * Here, we use an approximation of π (3.14).
     * 
     * @param r The radius of the circle
     */
    public static void circumference(Decimal r) {
        // Calculate the circumference of the circle and output the result to the debug log
        System.debug('Circumference : ' + 2 * 3.14 * r);
    }
}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//CircleStatic is a Class
//area and circumference are the static methods called with parameters passed to it
CircleStatic.area(10);
CircleStatic.circumference(2);

*/