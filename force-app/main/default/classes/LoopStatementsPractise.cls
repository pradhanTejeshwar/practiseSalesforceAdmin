public class LoopStatementsPractise {
    public static void tableOfNWithForLoop(Integer n) {
        for(Integer i=1 ; i <= 10 ; i++) {
            System.debug(n + ' x ' + i + ' = ' + n*i);
        }
    }
    public static void checkEvenOrOddUptoNWithForLoop(Integer n) {
        if(n!=0) {
            for(Integer i=1 ; i <= n ; i++) {
                if(Math.mod(i,2)==0)
                    System.debug(i + ' is Even !');
                else
                    System.debug(i + ' is Odd !');
            }
        }
    }
    public static void sumOfNaturalNumbersUptoNWithForLoop(Integer n) {
        Integer sum = 0;
        if(n!=0) {
            for(Integer i=1 ; i<=n ; i++) {
                sum += i;
            }
            System.debug('Sum of Natural Numbers upto ' + n + ' = ' + sum);
        }
    }
    public static void tableOfNWithWhileLoop(Integer n) {
        Integer i=1;
        while(i <= 10) {
            System.debug(n + ' x ' + i + ' = ' + n*i);
            i++;
        }
    }
    public static void sumOfNaturalNumbersUptoNWithWhileLoop(Integer n) {
        Integer sum = 0;
        if(n!=0) {
            Integer i=1;
            while(i<=n) {
                sum += i;
                i++;
            }
            System.debug('Sum of Natural Numbers upto ' + n + ' = ' + sum);
        }
    }
}