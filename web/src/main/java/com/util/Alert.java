package com.util;

import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;
import java.io.PrintWriter;


public class Alert {

    public static void alertLocation(String msg, String url, JspWriter out) {
        try {
            out.println(Builder.buildScript("alert('" + msg + "');", "location.href='" + url + "';"));
        } catch (IOException e) {
            Logger.logger.error("Error while alertLocation", e);
        }
    }

    public static void alertLocation(String msg, String url, PrintWriter out) {
        try {
            out.println(Builder.buildScript("alert('" + msg + "');", "location.href='" + url + "';"));
        } catch (Exception e) {
            Logger.logger.error("Error while alertLocation", e);
        }
    }

    public static void alertBack(String msg, JspWriter out) {
        try {
            out.println(Builder.buildScript("alert('" + msg + "');", "history.back();"));
        } catch (IOException e) {
            Logger.logger.error("Error while alertBack", e);
        }
    }

    public static void alertBack(String msg, PrintWriter out) {
        try {
            out.println(Builder.buildScript("alert('" + msg + "');", "history.back();"));
        } catch (Exception e) {
            Logger.logger.error("Error while alertBack", e);
        }
    }
}
