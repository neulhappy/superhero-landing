package org.util;
public class Builder {
    public static String buildScript(String... lines) {
        StringBuilder script = new StringBuilder("<script>");
        for (String line : lines) {
            script.append(line);
        }
        script.append("</script>");
        return script.toString();
    }

}