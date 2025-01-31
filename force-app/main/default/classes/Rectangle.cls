/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2024-12-05
 *
 * This class provides methods to calculate the area and perimeter of a rectangle.
 * The rectangle's length and breadth are initialized either through the default constructor 
 * or a parameterized constructor.
 *
 * Business Use Case:
 * - Calculate the area and perimeter of a rectangle using its length and breadth.
 * - Allow flexibility to either set default dimensions or pass custom dimensions.
 *
 * Assumptions:
 * - The length and breadth of the rectangle are represented by integers.
 *
 * Dependencies:
 * - None.
 *
 * Change History:
 * 2024-12-05: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added comments to the code
 */

public class Rectangle {
    
    // Declare variables to store the length and breadth of the rectangle
    Integer length; // Length of the rectangle
    Integer breadth; // Breadth (width) of the rectangle

    /**
     * Default constructor initializes the rectangle's length to 10 and breadth to 20.
     */
    public Rectangle() {
        length = 10; // Set the default length to 10
        breadth = 20; // Set the default breadth to 20
    }

    /**
     * Parameterized constructor allows for custom initialization of the rectangle's length and breadth.
     * 
     * @param l The length of the rectangle
     * @param b The breadth of the rectangle
     */
    public Rectangle(Integer l, Integer b) {
        length = l; // Set the length to the value passed as an argument
        breadth = b; // Set the breadth to the value passed as an argument
    }

    /**
     * Calculates and prints the area of the rectangle.
     * The area is calculated using the formula: Area = length * breadth.
     */
    public void area() {
        // Perform the area calculation and display the result
        System.debug('Area : ' + length * breadth); // Prints the area (length * breadth)
    }

    /**
     * Calculates and prints the perimeter of the rectangle.
     * The perimeter is calculated using the formula: Perimeter = 2 * (length + breadth).
     */
    public void perimeter() {
        // Perform the perimeter calculation and display the result
        System.debug('Perimeter : ' + 2 * (length + breadth)); // Prints the perimeter (2 * (length + breadth))
    }
}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Rectangle is a Class and here it is working as a Datatype
//r is the instance/variable of Class
//new is allocating memory in Cloud
Rectangle r = new Rectangle();
r.area();
r.perimeter();

Rectangle r1 = new Rectangle(100,200);
r1.area();
r1.perimeter();

*/