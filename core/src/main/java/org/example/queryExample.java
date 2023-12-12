package org.example;

import org.util.QueryBuilder;

import static org.util.QueryBuilder.getSql;


public class queryExample {
    public static void main(String[] args) {
        QueryBuilder.insertQuery("member(id, pwd)", "a1234, 15");
        System.out.println(getSql());

        QueryBuilder.selectQuery("*", "member");
        System.out.println(getSql());

        QueryBuilder.selectQuery("*", "member", "id > 1000");
        System.out.println(getSql());

        QueryBuilder.selectQuery("*", "member", "pwd < 5000", "pwd DESC");
        System.out.println(getSql());
//
    }
}
