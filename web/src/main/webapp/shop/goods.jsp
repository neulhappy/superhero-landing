<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>상점 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/goods.css"/>
    <script src="../js/shop.js"></script>
</head>
<body>
    <header>
        <jsp:include page="goodsPage.jsp"/>
    </header>


    <div class="content">
        <c:forEach var="product" items="${prodList}">
            <dl>
                <dt><img src="../img/goods/${product.id}.jpg"></dt>
                <dd>
                    <p>${product.name}</p>
                    <p>${product.price}</p>
                    <input type="button" value="장바구니" onclick="addCart(${product.id},'${product.name}', ${product.price})">
                </dd>
            </dl>
        </c:forEach>
        <dl>
            <dt><img src="../img/goods/1.jpg"></dt>
            <dd>
                <p>블랙 위도우 키링</p>
                <p>3,000원</p><input type="button" value="장바구니"></dd>
        </dl>
        <dl>
            <dt><img src="../img/goods/2.jpg"></dt>
            <dd>
                <p>캡틴 아메리카 키링</p>
                <p>4,000원</p><input type="button" value="장바구니"></dd>
        </dl>
        <dl>
            <dt><img src="../img/goods/3.jpg"></dt>
            <dd>
                <p>닥터 스트레인지 피규어</p>
                <p>35,000원</p><input type="button" value="장바구니"></dd>
        </dl>
        <dl>
            <dt><img src="../img/goods/4.jpg"></dt>
            <dd>
                <p>호크아이 피규어</p>
                <p>6,000원</p><input type="button" value="장바구니"></dd>
        </dl>
        <dl>
            <dt><img src="../img/goods/5.jpg"></dt>
            <dd>
                <p>헐크 피규어</p>
                <p>55,000원</p><input type="button" value="장바구니"></dd>
        </dl>
        <dl>
            <dt><img src="../img/goods/7.jpg"></dt>
            <dd>
                <p>팔콘 피규어</p>
                <p>40,000원</p><input type="button" value="장바구니"></dd>
        </dl>
        <dl>
            <dt><img src="../img/goods/8.jpg"></dt>
            <dd>
                <p>묠니르</p>
                <p>45,000원</p><input type="button" value="장바구니"></dd>
        </dl>
        <div class="basket">
            <a href="/shop/order.jsp"><img src="../img/basket.png"></a>
        </div>
    </div>



</body>
</html>
