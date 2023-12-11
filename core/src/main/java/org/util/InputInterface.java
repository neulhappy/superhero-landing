package org.util;

import java.util.Arrays;

//테스터 클래스 활용을 위한 임시 인터페이스
public class InputInterface {


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
}
