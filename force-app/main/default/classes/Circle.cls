/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2024-12-05
 *
 * This class provides methods to calculate the area and circumference of a circle. 
 * The circle's radius is initialized through the constructor.
 *
 * Business Use Case:
 * - Perform calculations for a circle, including area and circumference, based on the given radius.
 * - Utilize a constant value of π (pi) for accurate calculations.
 *
 * Assumptions:
 * - The radius of the circle is represented by a decimal number.
 * - The value of pi is assumed to be 3.14 for calculations.
 *
 * Dependencies:
 * - None.
 *
 * Change History:
 * 2024-12-05: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added comments to the code
 */

public class Circle {
    
    // Declare a variable to store the radius of the circle
    Decimal radius;
    
    // Declare a constant value for Pi (π), used in area and circumference calculations
    final Decimal pi = 3.14;

    /**
     * Constructor to initialize the radius of the circle.
     * 
     * @param r The radius of the circle
     */
    public Circle(Decimal r) {
        radius = r; // Set the radius to the value passed as an argument
    }

    /**
     * Calculates and prints the area of the circle.
     * The area is calculated using the formula: Area = π * radius^2.
     */
    public void area() {
        // Perform the area calculation and display the result
        System.debug('Area : ' + pi * radius * radius); // Prints the area (π * radius^2)
    }

    /**
     * Calculates and prints the circumference of the circle.
     * The circumference is calculated using the formula: Circumference = 2 * π * radius.
     */
    public void circumference() {
        // Perform the circumference calculation and display the result
        System.debug('Circumference : ' + 2 * pi * radius); // Prints the circumference (2 * π * radius)
    }
}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Circle is a Class and here it is working as a Datatype
//c is the instance/variable of Class
//new is allocating memory in Cloud
Circle c = new Circle(5);
c.area();`
c.circumference();

*/