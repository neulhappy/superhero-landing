<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.util.DBConnPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원정보</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        body {
            width: 1200px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1.3em;
            line-height: 1.6;
        }

        .mypage {
            display: flex;
            justify-content: space-between;
            width: calc((100% - 100px) / 2);
        }

        h1 {
            padding-left: 100px;
        }

        h1 > a {
            color: #2d2d2d;
        }

        ul {
            list-style: none;
            text-align: center;
        }
        .nav > ul {
            text-align: center;
            width: calc(1200px - 800px);
        }

        li {
            margin-left: 100px;
            padding: 50px;
        }

        li > a {
            color: #2d2d2d;
        }
        a {
            text-decoration: none;
        }
        span {
            color: rgb(128, 128, 128);
        }
        .info > ul {
            width: 800px;
            text-align: left;
            padding-top: 100px;
        }

    </style>
</head>
<body>
<%
    // 세션에서 사용자 아이디 가져오기
    String userId = (String) session.getAttribute("userId");
    String userEmail = "";

    DBConnPool dbPool = new DBConnPool();
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // DBConnPool을 통해 데이터베이스 연결
        con = dbPool.getConnection();

        // 이메일 조회 쿼리
        String query = "SELECT MEMBERMAIL FROM GAME_MEMBER WHERE MEMBERID = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            userEmail = rs.getString("MEMBERMAIL"); // 여기를 수정
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        dbPool.close(); // DBConnPool의 close 메서드를 사용하여 자원 반납
    }
%>

<h1>
    <a href="/index.jsp">Super Hero Landing</a>
</h1>
<div class="mypage">
    <div class="nav">
        <ul>
            <li><a href="OrderMypage.jsp">주문내역</a></li>
            <li><a href="${pageContext.request.contextPath}mypage.do?action=QnA">나의 문의내역</a></li>
            <li><a href="MyReview.jsp">나의 후기</a></li>
            <li><a href="MyShoppingCart.jsp">장바구니</a></li>
            <li><a href="MyInformation.jsp"><span>회원정보</span></a></li>
        </ul>
    </div>
    <div class="info">
    <ul >
        <li>내 아이디 <%= session.getAttribute("userId") %></li>
        <li>내 이메일 <%= userEmail %> <button>변경</button></li>
        <li>비밀번호 <button>변경</button></li>
    </ul>
    </div>
</div>
</body>
</html>
