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
    </style>
</head>

<body>
<form id="orderForm" action="orderSuccess.do" method="post">
    주문자: <input type="text" onkeyup="validateForm()" placeholder="구매자" id="purchaser_name" name="purchaser_name" required> <br/>
    수령인: <input type="text" onkeyup="validateForm()" placeholder="수취인" id="recipient_name" name="recipient_name" required> <br/>
    주소: <input type="text" onkeyup="validateForm()" placeholder="주소" id="address" name="address" required> <br/>
    연락처: <input type="tel" onkeyup="validateForm()" placeholder="연락처('-'넣어서 작성)" id="contact" name="contact" required> <br/>

    상품 목록:
    <ul id="productList">
        <!-- 동적으로 추가되는 상품 목록 -->
    </ul>
    <button type="button" onclick="addProduct()">상품 추가</button>
</form>
    <button id="submitButton" disabled class="kakao btn btn-primary btn-lg" onclick="submitForm()">카카오페이 간편 결제하기</button>



<script src="../js/order.js"></script>
</body>
</html>


