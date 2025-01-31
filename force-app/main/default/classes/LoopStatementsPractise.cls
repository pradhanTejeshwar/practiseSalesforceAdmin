/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2025-01-25
 * Last Modification Date: 2025-01-31
 *
 * This class demonstrates the use of different loop statements in Apex, such as:
 * - Using a `for` loop to print the multiplication table of a number.
 * - Checking if numbers up to a specified value are even or odd.
 * - Calculating the sum of natural numbers up to a specified value using both `for` and `while` loops.
 *
 * Business Use Case:
 * - Generate multiplication tables for teaching or displaying results.
 * - Check the properties (even/odd) of numbers up to a specific limit.
 * - Calculate the sum of natural numbers for analysis or reporting.
 *
 * Assumptions:
 * - Methods are designed to handle basic loop iterations for practical operations.
 *
 * Dependencies:
 * - Requires valid input parameters to perform loop operations.
 *
 * Change History:
 * 2025-01-25: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added detailed comments for the code
 * 2025-02-01: Write your changes here...
 */

public class LoopStatementsPractise {

    /**
     * Generates and logs the multiplication table of a given number using a `for` loop.
     * The table will range from 1 to 10.
     */
    public static void tableOfNWithForLoop(Integer n) {
        // Loop through values from 1 to 10
        for(Integer i = 1; i <= 10; i++) {
            // Log the multiplication result for each iteration
            System.debug(n + ' x ' + i + ' = ' + n*i);
        }
    }

    /**
     * Checks whether each number from 1 to n is even or odd using a `for` loop.
     * Logs the result for each number.
     */
    public static void checkEvenOrOddUptoNWithForLoop(Integer n) {
        // Ensure n is not zero before processing
        if(n != 0) {
            // Loop through all numbers from 1 to n
            for(Integer i = 1; i <= n; i++) {
                // If the number is even, log the result
                if(Math.mod(i, 2) == 0)
                    System.debug(i + ' is Even !');
                else
                    // Otherwise, log that the number is odd
                    System.debug(i + ' is Odd !');
            }
        }
    }

    /**
     * Calculates and logs the sum of natural numbers from 1 to n using a `for` loop.
     * The sum is computed by adding each number in the sequence.
     */
    public static void sumOfNaturalNumbersUptoNWithForLoop(Integer n) {
        Integer sum = 0; // Initialize sum to 0
        // Ensure n is not zero before processing
        if(n != 0) {
            // Loop through all numbers from 1 to n and accumulate the sum
            for(Integer i = 1; i <= n; i++) {
                sum += i;
            }
            // Log the final sum
            System.debug('Sum of Natural Numbers upto ' + n + ' = ' + sum);
        }
    }

    /**
     * Generates and logs the multiplication table of a given number using a `while` loop.
     * The table will range from 1 to 10.
     */
    public static void tableOfNWithWhileLoop(Integer n) {
        Integer i = 1; // Initialize i to 1
        // Continue looping until i is greater than 10
        while(i <= 10) {
            // Log the multiplication result for each iteration
            System.debug(n + ' x ' + i + ' = ' + n*i);
            i++; // Increment i by 1 for each iteration
        }
    }

    /**
     * Calculates and logs the sum of natural numbers from 1 to n using a `while` loop.
     * The sum is computed by adding each number in the sequence.
     */
    public static void sumOfNaturalNumbersUptoNWithWhileLoop(Integer n) {
        Integer sum = 0; // Initialize sum to 0
        // Ensure n is not zero before processing
        if(n != 0) {
            Integer i = 1; // Initialize i to 1
            // Continue looping until i exceeds n
            while(i <= n) {
                sum += i; // Add i to the sum in each iteration
                i++; // Increment i by 1 for each iteration
            }
            // Log the final sum
            System.debug('Sum of Natural Numbers upto ' + n + ' = ' + sum);
        }
    }
}