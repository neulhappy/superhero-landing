<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-18
  Time: 오후 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>주문지 작성</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/paymentstyle.css"/>
    <style>
        .quantity-wrapper {
            display: flex;
            align-items: center;
        }

        .quantity-input {
            margin-right: 10px;
        }

        .arrow-buttons {
            display: flex;
            flex-direction: column;
        }

        .orderPage {
            display: flex;
        }

    </style>
</head>

<body>
<div class="orderPage">
    <div class="shoppingBag col-md-6">
        <h1>장바구니</h1>
        <ul>
            <c:forEach var="productId" items="${sessionScope.cart}">
                <%
                    // 여기서는 상품 ID를 사용해서 해당 상품 정보를 가져오는 로직을 작성해야 합니다.
                    // 이 예시에서는 Product 클래스가 있다고 가정하고 해당 ID로 Product 객체를 가져오는 메서드를 사용합니다.
                    Product product = Product.getProductById(productId);
                %>
                <li>${product.name} - ${product.price}</li>
            </c:forEach>
        </ul>


    </div>
    <div>
        <form id="orderForm" class="row g-3 mx-auto p-2 col-md-6" style="width: 800px;" action="orderSuccess.do"
              method="post">
            <div class="col-md-6">
                <label class="form-label">주문자</label>
                <input type="text" onkeyup="validateForm()" placeholder="구매자" id="purchaser_name" class="form-control"
                       name="purchaser_name" required> <br/>
            </div>
            <div class="col-md-6">
                <label class="form-label">수령인</label>
                <input type="text" onkeyup="validateForm()" placeholder="수령인" id="recipient_name" class="form-control"
                       name="recipient_name" required> <br/>
            </div>
            <div class="col-12">
                <label class="form-label">주소</label>
                <input type="text" onkeyup="validateForm()" placeholder="주소" id="address" class="form-control"
                       name="address" required> <br/>
            </div>
            <div class="col-md-6">
                <label class="form-label">연락처</label>
                <input type="tel" onkeyup="validateForm()" placeholder="연락처('-'넣어서 작성)" id="contact"
                       class="form-control"
                       name="contact" required> <br/>
            </div>
            <div class="col-md-12">
                <label class="form-label">상품 목록</label>
                <ul id="productList">
                    <!-- 동적으로 추가되는 상품 목록 -->
                </ul>
                <button type="button" onclick="addProduct()">상품 추가</button>
            </div>
        </form>
        <div class="row g-3 mx-auto p-2" style="width: 500px">
            <button id="submitButton" disabled class="kakao btn btn-primary btn-lg align-middle" onclick="submitForm()">
                카카오페이 간편 결제하기
            </button>
        </div>
    </div>
</div>


<script src="../js/order.js"></script>
</body>
</html>


