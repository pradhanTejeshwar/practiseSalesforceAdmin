public class InterestStatic {    
    //methods - to apply some process on data
    //public means this method can be accessible outside the class
    //static means you do not have initialize the class
    //void is the return type of the function
    //si is the name of the function
    public static void si(Integer p, Integer r, Integer y) {
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