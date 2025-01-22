public class CircleStatic {
	//methods - to apply some process on data
    //public means this method can be accessible outside the class
    //static means you do not have initialize the class
    //void is the return type of the function
    //area and circumference are the name of the function/methods created
    public static void area(Decimal r) {
        System.debug('Area : ' + 3.14 * r * r);
    }
    
    public static void circumference(Decimal r) {
        System.debug('Circumference : ' + 2 * 3.14 * r);
    }
}
/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//CircleStatic is a Class
//area and circumference are the static methods called with parameters passed to it
CircleStatic.area(10);
CircleStatic.circumference(2);

*/