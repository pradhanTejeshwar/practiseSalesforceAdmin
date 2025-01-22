public class Interest {
    //variable - to store data
    //Here principal, rate, and time are variables, Integer is Datatype
    Integer principal = 1000, rate = 10, year = 2;
    
    //Constructor
    public Interest(Integer p, Integer r, Integer y) {
        principal = p;
        rate = r;
        year = y;
    }
    
    //methods - to apply some process on data
    //public means this method can be accessible outside the class
    //void is the return type of the function
    //si is the name of the function
    public void si() {
        System.debug('Simple Interest : ' + principal * rate * year);
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