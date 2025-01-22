public class Circle {
    //Variables/Constants
    Decimal radius;
    final Decimal pi = 3.14; 
    
    //Constructors
    public Circle(Decimal r) {
        radius = r;
    }
    
    //Methods
    public void area() {
        System.debug('Area : ' + pi * radius * radius);
    }
    
    public void circumference() {
        System.debug('Circumference : ' + 2 * pi * radius);
    }
}
/*
To execute on Anonymous window for execution
`````````````````````````````````````````````
//Circle is a Class and here it is working as a Datatype
//c is the instance/variable of Class
//new is allocating memory in Cloud
Circle c = new Circle(5);
c.area();`
c.circumference();

*/