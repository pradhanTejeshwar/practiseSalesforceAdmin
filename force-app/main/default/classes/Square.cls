/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2024-12-05
 *
 * This class calculates the area and perimeter of a square. The side of the square 
 * is either set by a default constructor (10 units) or a parameterized constructor.
 *
 * Business Use Case:
 * - Provide the ability to calculate the area and perimeter of a square using the side length.
 * - Allow flexibility to either set a default side length or pass a custom side length.
 *
 * Assumptions:
 * - The side length of the square is represented by an integer (`side`).
 * - The default side length is 10 units unless specified otherwise.
 *
 * Dependencies:
 * - None.
 *
 * Change History:
 * 2024-12-05: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added comments to the code
 */

public class Square {
    
    // Declare a variable to store the side length of the square
    Integer side;

    /**
     * Default constructor initializes the side length to 10 units.
     */
    public Square() {
        side = 10; // Set the default side length to 10
    }

    /**
     * Parameterized constructor allows for custom side length initialization.
     * 
     * @param s The side length to initialize the square with
     */
    public Square(Integer s) {
        side = s; // Set the side length to the value passed as an argument
    }

    /**
     * Calculates and prints the area of the square.
     * The area is calculated as the side length squared (side * side).
     */
    public void area() {
        // Perform the area calculation and display the result
        System.debug('Area : ' + side * side); // Prints the area (side^2)
    }

    /**
     * Calculates and prints the perimeter of the square.
     * The perimeter is calculated as 4 times the side length (4 * side).
     */
    public void perimeter() {
        // Perform the perimeter calculation and display the result
        System.debug('Perimeter : ' + 4 * side); // Prints the perimeter (4 * side)
    }
}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Rectangle is a Class and here it is working as a Datatype
//r is the instance/variable of Class
//new is allocating memory in Cloud
Square s = new Square();
s.area();
s.perimeter();

Square s1 = new Square(100);
s1.area();
s1.perimeter();

*/