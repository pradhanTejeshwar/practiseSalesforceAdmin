/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2024-12-05
 *
 * This class provides basic arithmetic operations (addition, subtraction, multiplication, division)
 * on two decimal numbers, `a` and `b`. The operations are performed through methods and the results 
 * are printed using `System.debug`.
 *
 * Business Use Case:
 * - Perform basic arithmetic calculations such as addition, subtraction, multiplication, and division.
 * - Ensure proper validation for division operations to prevent division by zero or invalid conditions.
 *
 * Assumptions:
 * - The class operates on two decimal numbers: `a` and `b`.
 * - Results of calculations are displayed via `System.debug`.
 * - Division requires the first number to be greater than the second number and non-zero denominator.
 *
 * Dependencies:
 * - None.
 *
 * Change History:
 * 2024-12-05: Initial version created by Tejeshwar Pradhan.
 * 2024-12-31: Added comments to the code
 */

public class Calculator {
    
    // Declare variables to store the two decimal numbers for calculation
    Decimal a, b;
    
    /**
     * Constructor to initialize the two decimal numbers for the calculation.
     * 
     * @param a First decimal value
     * @param b Second decimal value
     */
    public Calculator(Decimal a, Decimal b) {
        this.a = a; // Initialize the first number `a`
        this.b = b; // Initialize the second number `b`
    }

    /**
     * Performs the addition operation on the two decimal numbers and outputs the result.
     */
    public void add() {
        // Perform addition and output the result
        System.debug('Addition : ' + (a + b)); // Displays the result of a + b
    }

    /**
     * Performs the subtraction operation on the two decimal numbers and outputs the result.
     */
    public void subtract() {
        // Perform subtraction and output the result
        System.debug('Subtraction : ' + (a - b)); // Displays the result of a - b
    }

    /**
     * Performs the multiplication operation on the two decimal numbers and outputs the result.
     */
    public void multiply() {
        // Perform multiplication and output the result
        System.debug('Multiplication : ' + (a * b)); // Displays the result of a * b
    }

    /**
     * Performs the division operation on the two decimal numbers and outputs the result.
     * Includes validation to check that the denominator is not zero and that the first value is greater than the second.
     */
    public void divide() {
        // Check if the first value is greater than the second and if the denominator is not zero
        if(a > b || b == 0) {
            // Handle division by zero error
            if(b == 0) {
                // If the second number is zero, display an error message
                System.debug('Cannot divide by 0'); // Cannot divide by zero
            } else {
                // Perform division and output the result
                System.debug('Division : ' + (a / b)); // Displays the result of a / b
            }
        } else {
            // If the first number is less than or equal to the second, display an error message
            System.debug('First value should be greater than the second value for division'); // Invalid division condition
        }
    }
}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Circle is a Class and here it is working as a Datatype
//c is the instance/variable of Class
//new is allocating memory in Cloud
Calculator cal = new Calculator(2,3);
cal.add();
cal.subtract();
cal.multiply();
cal.divide();

*/