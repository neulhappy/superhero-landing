package com.util;
//
import static com.util.Logger.logger;

public class QueryBuilder {
    private static String sql;
    public static String insertQuery(String table, String columns){
        try{
            sql = "INSERT INTO " + table
                    + " VALUES (" + columns + ")"
            ;
        }catch (IllegalArgumentException e){
            logger.error("insertQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.");
        }

        return sql;
    }

    public static String updateQuery(String table, String columns, String newValue, String condition){
        try{
            sql = "UPDATE " + table
                    + " SET " + columns + " = " + newValue
                    + " WHERE " + condition
            ;
        }catch (IllegalArgumentException e){
            logger.error("insertQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.");
        }

        return sql;
    }

    public static String updateQuery(String table, String columns, String newValue){
        try{
            sql = "UPDATE " + table
                    + " SET " + columns + " = " + newValue
            ;
        }catch (IllegalArgumentException e){
            logger.error("insertQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.");
        }

        return sql;
    }



    public static String selectQuery(String columnName, String table, String condition, String sortcolumns){
        try {
            sql = "SELECT " + columnName
                    + " FROM " + table
                    + " WHERE " + condition
                    + " ORDER BY " + sortcolumns
            ;
        }catch (IllegalArgumentException e){
            logger.error("selectQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.");
        }
        return sql;
    }

    public static String selectQuery(String columnName, String table, String condition){
        try{
            sql = "SELECT " + columnName
                    + " FROM " + table
                    + " WHERE " + condition
            ;
        }catch (IllegalArgumentException e){
            logger.error("selectQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.");
        }
        return sql;
    }

    public static String selectQuery(String columnName, String table){
        try{
            sql = "SELECT " + columnName
                    + " FROM " + table
            ;
        }catch (IllegalArgumentException e){
            logger.error("selectQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.");
        }
        return sql;
    }

    public static String getSql() {
        return sql;
    }
}
