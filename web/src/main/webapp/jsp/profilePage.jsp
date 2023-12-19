<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-15
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>소개 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/profilepagestyle.css"/>
</head>
<body>

<header id="header">
    <h1><img src="../img/profilelogo.png"></h1>
    <nav>
        <ul class="menu">
            <li><a href="profilePage.jsp">브랜드 소개</a></li>
            <li><a href="profilePage02.jsp">Hero 소개</a></li>
        </ul>
    </nav>
</header>

<main id="main">
    <Section id="sec1"><p>좋은 물건을 드리겠다는 마음으로 이 사이트를 개발했습니다</p></Section>
    <Section id="sec2">
        <contents>
            소개글
        </contents>
    </Section>
</main>

<footer id="footer">
    <p>Copyright (c) 2023 Re-Coder</p>
    <out_logo><a href="../index.jsp"><img src="../img/profooterlogo.png"></a></out_logo>
</footer>

</body>
</html>
