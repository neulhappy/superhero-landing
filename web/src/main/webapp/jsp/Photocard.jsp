<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-19
  Time: 오후 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>상점 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/photo.css"/>
</head>
<body>

<header>
    <jsp:include page="goodsPage.jsp"/>
</header>

<div class="content">
    <dl>
        <dt><img src="../img/goods/6.jpg"></dt>
        <dd>
            <p>아이언맨 포토카드</p>
            <p>5,500원</p><input type="button" value="장바구니"></dd>
    </dl>
    <dl>
        <dt><img src="../img/goods/10.jpg"></dt>
        <dd>
            <p>윈터솔져 포토카드</p>
            <p>6,000원</p><input type="button" value="장바구니"></dd>
    </dl>

    <div class="basket">
        <a href="#"><img src="../img/basket.png"></a>
    </div>

</div>

</body>
</html>
