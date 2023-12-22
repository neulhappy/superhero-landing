<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>상점 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/photo.css"/>
    <script src="../js/shop.js"></script>
</head>
<body>

    <header>
        <jsp:include page="goodsPage.jsp"/>
    </header>

    <div class="content">
        <c:forEach var="product" items="${prodList}">
            <dl>
                <dt><img src="../img/goods/${product.id}.jpg" alt="포토카드 이미지"></dt>
                <dd>
                    <p>${product.name}</p>
                    <p>${product.price}원</p>
                    <input type="button" value="장바구니" onclick="addCart(${product.id})">
                </dd>
            </dl>
        </c:forEach>
        <div class="basket">
            <a href="<c:url value='/shop/order.do'/>"><img src="../img/basket.png" alt="장바구니"></a>
        </div>

    </div>

</body>
</html>
