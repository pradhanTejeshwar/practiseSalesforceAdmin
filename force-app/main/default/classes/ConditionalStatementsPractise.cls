public class ConditionalStatementsPractise {
    public static void maxOfTwoNumbers(Integer a, Integer b) {
        if(a>b)
            System.debug('Max : ' + a);
        if(a == b)
            System.debug('Both are equal : ' + a + ' = ' + b);
        if(b > a)
            System.debug('Max : ' + b);
    }
    public static void voteEligibilityCheck(Integer x) {
        if(x < 0)
            System.debug('Age cannot be less than 0 !');
        if(x >= 18)
            System.debug('Eligible to Vote !');
        else
            System.debug('Not Eligible to Vote !');
    }
    public static void checkEvenOrOdd(Integer x) {
        if(x == 0)
            System.debug('Undefined !');
        else {
            if(Math.mod(x, 2) == 0)
                System.debug('Even');
            else
                System.debug('Odd');
        }
    }
    public static void checkNegativeOrZeroOrPositive(Integer x) {
        if(x < 0)
            System.debug('Negative : ' + x);
        else if(x == 0)
            System.debug('Zero : ' + x);
        else
            System.debug('Positive : '+ x);
    }
    public static void checkNegativeOrZeroOrPositiveNestedIfElse(Integer x) {
        if(x < 0)
            System.debug('Negative : ' + x);
        else {
            if(x > 0)
                System.debug('Positive : '+ x);
            else
                System.debug('Zero : ' + x);
        }
    }
}