public class Calculator {
    //Variables/Constants
    Decimal a, b;
    
    //Constructors
    public Calculator(Decimal a, Decimal b) {
        this.a = a;
        this.b = b;
    }
    //Methods
    public void add() {
        System.debug('Addition : ' + (a + b));
    }
    public void subtract() {
        System.debug('Subtraction : ' + (a - b));
    } 
    public void multiply() {
        System.debug('Multiplication : ' + (a * b));
    } 
    public void divide() {
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
//Circle is a Class and here it is working as a Datatype
//c is the instance/variable of Class
//new is allocating memory in Cloud
Calculator cal = new Calculator(2,3);
cal.add();
cal.subtract();
cal.multiply();
cal.divide();

*/