public class CalculatorStatic {
	//methods - to apply some process on data
    //public means this method can be accessible outside the class
    //static means you do not have initialize the class
    //void is the return type of the function
    //add, subtract, multiply and dicinde are the name of the static function/methods
    public static void add(Decimal a, Decimal b) {
        System.debug('Addition : ' + (a + b));
    }
    public static void subtract(Decimal a, Decimal b) {
        System.debug('Subtraction : ' + (a - b));
    } 
    public static void multiply(Decimal a, Decimal b) {
        System.debug('Multiplication : ' + (a * b));
    } 
    public static void divide(Decimal a, Decimal b) {
        if(a>b || b==0) {
            if(b==0)
				System.debug('Cannot divide by 0');
            else
                System.debug('Division : ' + (a / b));
        }
            
        else
            System.debug('First value should be greater than the second value for division');
    }
}
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