package com.util;
//가변 매개변수 메소드는 오버로딩 비권장.

import static com.util.Logger.logger;

public class Builder {
    public static String buildString(String... lines) {
        StringBuilder String = new StringBuilder();
        for (String line : lines) {
            String.append(line);
        }
        return String.toString();
    }

    public static String buildForm(String open, String close, String... lines) {
        StringBuilder script = new StringBuilder(open);
        for (String line : lines) {
            script.append(line);
        }
        script.append(close);
        return script.toString();
    }
    // buildForm(<script>,</Script>, 내용) 하면 buildScript와 같음.

    public static String buildScript(String... lines) {
        StringBuilder script = new StringBuilder("<script>");
        for (String line : lines) {
            script.append(line);
        }
        script.append("</script>");
        return script.toString();
    }

    public static String insertQuery(String table, String columns) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append("INSERT INTO ").append(table).append(" VALUES (").append(columns).append(")");
        } catch (IllegalArgumentException e) {
            logger.error("insertQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }

    public static String updateQuery(String table, String columns, String newValue, String condition) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append("UPDATE ").append(table)
                    .append(" SET ").append(columns).append(" = ").append(newValue)
                    .append(" WHERE ").append(condition);
        } catch (IllegalArgumentException e) {
            logger.error("updateQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }

    public static String updateQuery(String table, String columns, String newValue) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append("UPDATE ").append(table)
                    .append(" SET ").append(columns).append(" = ").append(newValue);
        } catch (IllegalArgumentException e) {
            logger.error("updateQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }

    public static String selectQuery(String columnName, String table, String condition, String sortColumns) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append("SELECT ").append(columnName)
                    .append(" FROM ").append(table)
                    .append(" WHERE ").append(condition)
                    .append(" ORDER BY ").append(sortColumns);
        } catch (IllegalArgumentException e) {
            logger.error("selectQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }

    public static String selectQuery(String columnName, String table, String condition) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append("SELECT ").append(columnName)
                    .append(" FROM ").append(table)
                    .append(" WHERE ").append(condition);
        } catch (IllegalArgumentException e) {
            logger.error("selectQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }

    public static String selectQuery(String columnName, String table) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append("SELECT ").append(columnName)
                    .append(" FROM ").append(table);
        } catch (IllegalArgumentException e) {
            logger.error("selectQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }
}