public class Square {
    //variable - to store data
    //Here length is the variable, Integer is Datatype
    Integer side;
    
    //Default Constructor
    public Square() {
        side = 10;
    }
    
    //Parametrized Constructor
    public Square(Integer s) {
        side = s;
    }
    
    //methods - to apply some process on data
    //public means this method can be accessible outside the class
    //void is the return type of the function
    //area is the name of the function
    public void area() {
        System.debug('Area : ' + side * side);
    }
    //public means this method can be accessible outside the class
    //void is the return type of the function
    //perimeter is the name of the function
    public void perimeter() {
        System.debug('Perimeter : ' + 4 * side);
    }
}
/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Rectangle is a Class and here it is working as a Datatype
//r is the instance/variable of Class
//new is allocating memory in Cloud
Square s = new Square();
s.area();
s.perimeter();

Square s1 = new Square(100);
s1.area();
s1.perimeter();

*/