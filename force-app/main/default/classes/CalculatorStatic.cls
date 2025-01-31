/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2024-12-05
* Last Modification Date: 2024-12-05
*
* This class contains static methods for basic arithmetic operations:
* addition, subtraction, multiplication, and division. 
* The methods work with `Decimal` type numbers and provide results through 
* `System.debug` statements.
*
* Business Use Case:
* - This class provides simple arithmetic calculations that can be used in various 
*   business scenarios where basic mathematical operations are required.
* - Can be used in Apex triggers, classes, or anonymous execution to perform calculations.
*
* Assumptions:
* - The methods take `Decimal` type as input for precision in financial calculations.
* - The divide method handles the case of division by zero with a validation check.
*
* Dependencies:
* - No external dependencies; this class uses the standard `System.debug` for output.
*
* Change History:
* 2024-12-05: Initial version created by Tejeshwar Pradhan.
*
* This class provides static methods for performing basic arithmetic operations like 
* addition, subtraction, multiplication, and division.
*/

public class CalculatorStatic {

    /**
     * Adds two Decimal numbers and outputs the result to the debug log.
     * 
     * @param a The first Decimal value
     * @param b The second Decimal value
     */
    public static void add(Decimal a, Decimal b) {
        // Perform addition and output the result to the debug log
        System.debug('Addition : ' + (a + b));
    }

    /**
     * Subtracts the second Decimal number from the first and outputs the result to the debug log.
     * 
     * @param a The first Decimal value
     * @param b The second Decimal value
     */
    public static void subtract(Decimal a, Decimal b) {
        // Perform subtraction and output the result to the debug log
        System.debug('Subtraction : ' + (a - b));
    }

    /**
     * Multiplies two Decimal numbers and outputs the result to the debug log.
     * 
     * @param a The first Decimal value
     * @param b The second Decimal value
     */
    public static void multiply(Decimal a, Decimal b) {
        // Perform multiplication and output the result to the debug log
        System.debug('Multiplication : ' + (a * b));
    }

    /**
     * Divides the first Decimal number by the second and outputs the result to the debug log.
     * Validates if the first number is greater than the second and ensures no division by zero.
     * 
     * @param a The first Decimal value
     * @param b The second Decimal value
     */
    public static void divide(Decimal a, Decimal b) {
        // Check if division is possible (first value should be greater than second, and second value should not be zero)
        if(a > b || b == 0) {
            if(b == 0) {
                // If the second value is zero, log an error message
                System.debug('Cannot divide by 0');
            } else {
                // Perform division and output the result to the debug log
                System.debug('Division : ' + (a / b));
            }
        } else {
            // If first value is not greater than the second, log an error message
            System.debug('First value should be greater than the second value for division');
        }
    }
}

/*
To execute on Anonymous window for execution

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//CalculatorStatic is a Class
//add, subtract, multiply and divide are the static methods called with parameters passed to it
CalculatorStatic.add(1,20);
CalculatorStatic.subtract(2,30);
CalculatorStatic.multiply(3,40);
CalculatorStatic.divide(4,50);
CalculatorStatic.divide(40,5);
CalculatorStatic.divide(4,0);

*/