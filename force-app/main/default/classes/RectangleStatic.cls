public class RectangleStatic {
    //methods - to apply some process on data
    //public means this method can be accessible outside the class
    //static means you do not have initialize the class
    //void is the return type of the function
    //area is the name of the function
    public static void area(Integer length, Integer breadth) {
        System.debug('Area : ' + length*breadth);
    }
    
    //perimeter is the name of the function
    public static void perimeter(Integer length, Integer breadth) {
        System.debug('Perimeter : ' + 2*(length+breadth));
    }
}
/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//RectangleStatic is a Class
//area and perimeter are the methods being called from the class
RectangleStatic.area(1,20);
RectangleStatic.perimeter(300,4000);

RectangleStatic.area(400,30);
RectangleStatic.perimeter(20,1);

*/