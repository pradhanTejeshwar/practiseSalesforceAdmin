@isTest
public class ListOfColoursTest {
	@isTest
    static void testColourList() {
        List<String> colors = ListOfColours.colourList();
        
        // Assert that the list is not null
        System.assertNotEquals(colors, null, 'The color list should not be null.');
        
        // Assert that the list contains exactly 3 elements
        System.assertEquals(3, colors.size(), 'The color list should contain exactly 3 elements.');
        
        // Assert that the colors are as expected
        System.assertEquals('Red', colors[0], 'First color should be Red.');
        System.assertEquals('Green', colors[1], 'Second color should be Green.');
        System.assertEquals('Blue', colors[2], 'Third color should be Blue.');
    }
}