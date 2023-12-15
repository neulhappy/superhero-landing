package com.util;

import java.util.Scanner;

//단위 테스트를 위한 유저 I/O 테스터
public class Tester {
    public static int intInput() {
        Scanner sc = new Scanner(System.in);
        int inp = -1;
        try {
            inp = sc.nextInt();

        } catch (Exception e) {
            Logger.logger.error("Error while intInput", e);
        }
        sc.close();
        return inp;
    }

    public static String stringInput() {
        Scanner sc = new Scanner(System.in);
        String inp = "";
        try {
            inp = sc.nextLine().trim();

        } catch (Exception e) {
            Logger.logger.error("Error while stringInput", e);
        }
        sc.close();
        return inp;
    }

    public static String[] arrayInput(int count) {
        Scanner sc = new Scanner(System.in);
        String[] inp = new String[0];

        try {
            inp = new String[count];
            for (int i = 0; i < count; i++) {
                inp[i] = sc.nextLine().trim();
            }


        } catch (Exception e) {
            Logger.logger.error("Error while arrayInput", e);
        }
        sc.close();
        return inp;
    }

    public static void stringOutput(String... lines) {
        for (String line : lines) {
            System.out.println(line);
        }
    }
}
