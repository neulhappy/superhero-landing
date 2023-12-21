<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-18
  Time: 오후 4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>상점 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/goodsPagestyle.css"/>
</head>
<body>
<header id="header">
    <h1><img src="../img/goodslogo.png"></h1>
    <nav class="menu">
        <ul>
            <li><a href="goods.jsp"><img src="../img/goodslogo02.png" alt="상품"></a></li>
            <li><a href="Photocard.jsp"><img src="../img/goodslogo03.png" alt="포토카드"></a></li>

        </ul>
    </nav>
</header>

<footer id="footer">
    <jsp:include page="../include/Footer.jsp"/>
</footer>
</body>
</html>
