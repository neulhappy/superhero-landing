package org.util;

import java.util.Arrays;

//테스터 클래스 활용을 위한 임시 인터페이스
public class Interface {


    public static int testIntInput() {
        int inp = Tester.intInput();
        if (inp == -1) {
            System.out.println("testIntInput malfunction. value : " + inp);
            return 0;
        } else return inp;
    }

    public static String testStringInput() {
        String inp = Tester.stringInput();
        if (inp.isEmpty()) {
            System.out.println("testStringInput malfunction. value : " + inp);
            return "";
        } else return inp;
    }

    public static String[] testArrayInput(int count) {
        String[] inp = Tester.arrayInput(count);
        if (inp.length == 0)
            System.out.println("testArrayInput malfunction. value : " + Arrays.toString(inp));
        return inp;
    }


    public static void testStiringOutput(String... lines) {
        Tester.stringOutput(lines);
    }
    //가변 매개변수는 String 배열이나 s1, s2같은 식으로 여러개의 매개변수를 원하는 숫자만큼 전달할 수 있어요.
    //ex) testStringOutput(s1, s2, s3, s4}
    //ex2) String[] lines = {s1, s2, s3, s4}; testStringOutput(lines);
}
