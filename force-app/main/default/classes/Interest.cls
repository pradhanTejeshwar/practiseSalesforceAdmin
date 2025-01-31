/**
 * Created by Tejeshwar Pradhan
 * Date of Creation: 2024-12-05
 *
 * This class calculates the Simple Interest based on the provided principal, 
 * rate of interest, and the time period (in years). The Simple Interest formula 
 * is applied to calculate the interest and display the result.
 *
 * Business Use Case:
 * - Calculate the Simple Interest for a given principal, interest rate, and time period.
 *
 * Assumptions:
 * - The principal, rate, and time period are represented by integers.
 * - The formula for Simple Interest is: 
 *   Simple Interest = (Principal * Rate * Time) / 100.
 *
 * Dependencies:
 * - None.
 *
 * Change History:
 * 2024-12-05: Initial version created by Tejeshwar Pradhan.
 * 2025-01-31: Added comments to the code
 */

public class Interest {
    
    // Declare variables to store the principal amount, rate of interest, and time period (in years)
    Integer principal = 1000, rate = 10, year = 2; // Default principal amount is 1000, Default rate of interest is 10%, Default time period is 2 years

    /**
     * Constructor to initialize the principal, rate, and time period.
     * 
     * @param p The principal amount
     * @param r The rate of interest
     * @param y The time period (in years)
     */
    public Interest(Integer p, Integer r, Integer y) {
        principal = p; // Set the principal amount to the value passed as an argument
        rate = r; // Set the rate of interest to the value passed as an argument
        year = y; // Set the time period to the value passed as an argument
    }

    /**
     * Calculates and prints the Simple Interest based on the provided principal, rate, and time period.
     * The Simple Interest formula is: SI = (Principal * Rate * Time) / 100.
     */
    public void si() {
        // Perform the Simple Interest calculation and display the result
        System.debug('Simple Interest : ' + (principal * rate * year) / 100); // Prints the simple interest
    }
}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Interest is a Class and here it is working as a Datatype
//i is the instance/variable of Class
//new is allocating memory in Cloud
Interest i = new Interest(1000,20,3);
i.si();

*/