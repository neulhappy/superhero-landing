package org.util;

import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;

import static org.util.Builder.buildScript;
import static org.util.Logger.logger;


public class Alert {

    public static void alertLocation(String msg, String url, JspWriter out) {
        try {
            out.println(buildScript("alert('" + msg + "');", "location.href='" + url + "';"));
        } catch (IOException e) {
            logger.error("Error while alertLocation", e);
        }
    }

    public static void alertBack(String msg, JspWriter out) {
        try {
            out.println(buildScript("alert('" + msg + "');", "history.back();"));
        } catch (IOException e) {
            logger.error("Error while alertBack", e);
        }
    }
}
