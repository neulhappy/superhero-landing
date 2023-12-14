<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-14
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Super Hero Landing</title>
    <link rel="stylesheet" type="text/css" href="css/mainpagestyle.css"/>
</head>
<body>
<div id="wrap">
    <header id="header">
        <h1>
            <a href="#">Super Hero Landing</a>
        </h1>

        <ul class="login">
            <li><a href="/member/Login.jsp">로그인</a></li>
            <li><a href="/member/Join.jsp">회원가입</a></li>
        </ul>

        <nav id="menu">
            <ul>
                <li><a href="#">캐릭터's</a></li>
                <li><a href="#">게임공략</a></li>

                <input type="button"  style="color: white; font-size: 1.6rem; font-weight: 700; background-color: transparent;" value="자유게시판" onclick="location.href='jsp/CommunityPage.jsp'"/>
                <li><a href="#">FAQ</a></li>
            </ul>
        </nav>
    </header>

    <main id="main">
        <img src="img/main.png" alt="마블 이미지">
    </main>

    <footer id="footer">Copyright (c) 2023 Re-Coder</footer>

</div>
</body>
</html>