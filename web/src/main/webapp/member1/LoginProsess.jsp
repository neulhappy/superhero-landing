<%@ page import="com.member.MemberDao" %>
<%@ page import="com.member.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<%
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

    MemberDao dao  = new MemberDao();


%>