/**
* Created by Tejeshwar Pradhan
* Date of Creation: 2024-12-05
* Last Modification Date: 2024-12-05
*
* This class contains a static method to calculate the simple interest.
* The method takes principal amount, rate of interest, and the number of years 
* as inputs, and outputs the result using `System.debug`.
*
* Business Use Case:
* - This class provides a utility method for calculating simple interest.
* - It is useful in financial applications, accounting, loan management, 
*   and any situation requiring simple interest calculations.
*
* Assumptions:
* - The inputs for the principal amount, rate of interest, and time period 
*   (in years) are provided as integers.
* - The formula used for simple interest is: `SI = P * R * T` (Principal * Rate * Time).
*
* Dependencies:
* - No external dependencies; this class uses the standard `System.debug` for output.
*
* Change History:
* 2024-12-05: Initial version created by Tejeshwar Pradhan.
* 2024-01-31: Added comments to the code
*
* This class provides a static method to calculate and output the simple interest 
* based on the principal amount, rate of interest, and time period.
*/

public class InterestStatic {    

    /**
     * Calculates and outputs the simple interest.
     * 
     * The simple interest is calculated using the formula:
     * SI = P * R * T, where:
     *   P = Principal amount
     *   R = Rate of interest (annual)
     *   T = Time period (in years)
     * 
     * @param p The principal amount
     * @param r The rate of interest (annual)
     * @param y The time period in years
     */
    public static void si(Integer p, Integer r, Integer y) {
        // Calculate simple interest and output the result to the debug log
        System.debug('Simple Interest : ' + p * r * y);
    }
}

/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Interest is a Class
//si is the static method being called
InterestStatic.si(100,20,3);

*/