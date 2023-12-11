package org.util;

//가변 매개변수 메소드는 오버로딩 비권장.

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

}