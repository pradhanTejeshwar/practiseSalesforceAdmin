public class Rectangle {
    //variable - to store data
    //Here length and breadth are variables, Integer is Datatype
    Integer length, breadth;
    
    //Default Constructor
    public Rectangle() {
        length = 10;
        breadth = 20;
    }
    
    //Parametrized Constructor
    public Rectangle(Integer l, Integer b) {
        length = l;
        breadth = b;
    }
    
    //methods - to apply some process on data
    //public means this method can be accessible outside the class
    //void is the return type of the function
    //area is the name of the function
    public void area() {
        System.debug('Area : ' + length*breadth);
    }
    //public means this method can be accessible outside the class
    //void is the return type of the function
    //perimeter is the name of the function
    public void perimeter() {
        System.debug('Perimeter : ' + 2*(length+breadth));
    }
}
/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Rectangle is a Class and here it is working as a Datatype
//r is the instance/variable of Class
//new is allocating memory in Cloud
Rectangle r = new Rectangle();
r.area();
r.perimeter();

Rectangle r1 = new Rectangle(100,200);
r1.area();
r1.perimeter();

*/