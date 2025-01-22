public class SquareStatic {
	//methods - to apply some process on data
    //public means this method can be accessible outside the class
    //static means you do not have initialize the class
    //void is the return type of the function
    //area and perimeter are the name of the static function/methods
    public static void area(Integer s) {
        System.debug('Area : ' + s * s);
    }

    public static void perimeter(Integer s) {
        System.debug('Perimeter : ' + 4 * s);
    }
}
/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Rectangle is a Class and here it is working as a Datatype
//area and perimeter are the static methods called with parameters passed to it
SquareStatic.area(2);
SquareStatic.perimeter(10);

*/