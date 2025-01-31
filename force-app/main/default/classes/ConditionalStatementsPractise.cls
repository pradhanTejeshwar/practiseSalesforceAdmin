/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2025-01-25
 * Last Modification Date: 2025-01-31
 *
 * This class demonstrates various conditional statements and their usage in Apex.
 * The class contains methods to check different conditions such as:
 * - Finding the maximum of two numbers.
 * - Checking voter eligibility.
 * - Checking if a number is even or odd.
 * - Identifying if a number is positive, negative, or zero.
 *
 * Business Use Case:
 * - Determine eligibility for voting based on age.
 * - Identify the properties of numbers (even, odd, positive, negative, zero).
 *
 * Assumptions:
 * - The methods are designed to handle basic conditional checks and calculations.
 *
 * Dependencies:
 * - Requires proper input parameters for each method to work correctly.
 *
 * Change History:
 * 2025-01-25: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added Detailed comments to the code
 * 2025-02-01: Write your changes here...
 */

public class ConditionalStatementsPractise {

    /**
     * Compares two integers and logs the maximum value.
     * If both integers are equal, it logs the equality.
     */
    public static void maxOfTwoNumbers(Integer a, Integer b) {
        // If a is greater than b, log that a is the maximum
        if(a > b)
            System.debug('Max : ' + a);

        // If a is equal to b, log that both numbers are equal
        if(a == b)
            System.debug('Both are equal : ' + a + ' = ' + b);

        // If b is greater than a, log that b is the maximum
        if(b > a)
            System.debug('Max : ' + b);
    }

    /**
     * Checks if a given age is eligible to vote.
     * Logs if the age is less than 0, 18 or above, or otherwise not eligible.
     */
    public static void voteEligibilityCheck(Integer x) {
        // If the age is less than 0, log an error message
        if(x < 0)
            System.debug('Age cannot be less than 0 !');

        // If the age is 18 or greater, log that the person is eligible to vote
        if(x >= 18)
            System.debug('Eligible to Vote !');
        else
            // Otherwise, log that the person is not eligible to vote
            System.debug('Not Eligible to Vote !');
    }

    /**
     * Checks if a number is even or odd.
     * Logs "Undefined" for 0, "Even" for even numbers, and "Odd" for odd numbers.
     */
    public static void checkEvenOrOdd(Integer x) {
        // If the number is 0, log that it is undefined
        if(x == 0)
            System.debug('Undefined !');
        else {
            // If the number is even (remainder of x divided by 2 is 0), log "Even"
            if(Math.mod(x, 2) == 0)
                System.debug('Even');
            else
                // Otherwise, log "Odd" for odd numbers
                System.debug('Odd');
        }
    }

    /**
     * Checks if a number is negative, zero, or positive.
     * Logs the respective message based on the number's value.
     */
    public static void checkNegativeOrZeroOrPositive(Integer x) {
        // If the number is negative, log that it's negative
        if(x < 0)
            System.debug('Negative : ' + x);
        // If the number is zero, log that it's zero
        else if(x == 0)
            System.debug('Zero : ' + x);
        else
            // Otherwise, log that the number is positive
            System.debug('Positive : '+ x);
    }

        // If the number is negative, log that it's negative
    /**
     * Checks if a number is negative, zero, or positive using nested if-else conditions.
     * Logs the respective message based on the number's value.
     */
    public static void checkNegativeOrZeroOrPositiveNestedIfElse(Integer x) {
        // If the number is negative, log that it's negative
        if(x < 0)
            System.debug('Negative : ' + x);
        else {
            // If the number is positive, log that it's positive
            if(x > 0)
                System.debug('Positive : '+ x);
            else
                // Otherwise, log that the number is zero
                System.debug('Zero : ' + x);
        }
    }
}