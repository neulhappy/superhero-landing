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

    public static String insertQuery(String table, String[] columns, String[] values) {
        if (columns.length != values.length) {
            throw new IllegalArgumentException("열의 개수와 값의 개수가 일치하지 않습니다.");
        }

        StringBuilder sql = new StringBuilder();
        try {
            sql.append("INSERT INTO ").append(table)
                    .append("(");
            for (int i = 0; i < columns.length; i++) {
                sql.append(columns[i]);
                if (i < columns.length - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") VALUES (");
            for (int i = 0; i < values.length; i++) {
                sql.append(values[i]);
                if (i < values.length - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");
        } catch (IllegalArgumentException e) {
            logger.error("insertQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }


    public static String updateQuery(String table, String[] columns, String[] newValues, String condition) {
        if (columns.length != newValues.length) {
            throw new IllegalArgumentException("열의 개수와 값의 개수가 일치하지 않습니다.");
        }
        StringBuilder sql = new StringBuilder();
        try {
            sql.append("UPDATE ").append(table).append(" SET ");
            for (int i = 0; i < columns.length; i++) {
                sql.append(columns[i]).append(" = ").append(newValues[i]);
                if (i < columns.length - 1) {
                    sql.append(", ");
                }
            }
            if (condition != null && !condition.isEmpty()) {
                sql.append(" WHERE ").append(condition);
            }
        } catch (IllegalArgumentException e) {
            logger.error("updateQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }


    public static String selectQuery(String[] columnNames, String table, String condition, String sortColumns) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append("SELECT ");

            for (int i = 0; i < columnNames.length; i++) {
                sql.append(columnNames[i]);
                if (i < columnNames.length - 1) {
                    sql.append(", ");
                }
            }
            sql.append(" FROM ").append(table);
            if (condition != null && !condition.isEmpty()) {
                sql.append(" WHERE ").append(condition);
            }
            if (sortColumns != null && !sortColumns.isEmpty()) {
                sql.append(" ORDER BY ").append(sortColumns);
            }
        } catch (IllegalArgumentException e) {
            logger.error("selectQuery 실행 중 올바르지 않은 인자 값을 넣었습니다.", e);
        }
        return sql.toString();
    }
}