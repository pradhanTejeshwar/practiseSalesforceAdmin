@isTest
public class SquareStaticTest {

    @isTest
    public static void testArea() {
        // Define test cases
        Integer side = 5;
        Integer expectedArea = side * side;

        // Call method and assert expected output
        System.assertEquals(expectedArea, SquareStatic.area(side), 'Area calculation is incorrect.');
    }

    @isTest
    public static void testPerimeter() {
        // Define test cases
        Integer side = 7;
        Integer expectedPerimeter = 4 * side;

        // Call method and assert expected output
        System.assertEquals(expectedPerimeter, SquareStatic.perimeter(side), 'Perimeter calculation is incorrect.');
    }
}