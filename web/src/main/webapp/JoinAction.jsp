<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:useBean id="member" class="" scope="page"/>
<jsp:setProperty name="member" property="memberId"/>
<jsp:setProperty name="member" property="memberPw"/>
<jsp:setProperty name="member" property="memberMail"/>
<%
    if(member.getMemberId() != null || member.getMemberMail() != null || member.getMemberPw() != null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('필수 정보를 입력해주세요.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>