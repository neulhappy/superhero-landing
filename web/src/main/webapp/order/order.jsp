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
<form id="orderForm">
    ID : <input type="text" id="customer_id" name="customer_id" required> <br/>
    주문자: <input type="text" id="purchaser_name" name="purchaser_name" required> <br/>

    수령인: <input type="text" id="recipient_name" name="recipient_name" required> <br/>

    주소: <input type="text" id="address" name="address" required> <br/>

    연락처: <input type="tel" id="contact" name="contact" required> <br/>

    상품 목록:
    <ul id="productList">
        <!-- 동적으로 추가되는 상품 목록 -->
    </ul>
    <button type="button" onclick="addProduct()">상품 추가</button>
    <button type="button" onclick="sendData()"> 완료</button>
</form>
<button class="kakao btn btn-primary btn-lg" onclick="submit()">카카오페이 간편 결제하기</button>

<script>
    function submit() {

        sendData();
        showHiddenButtons()

    }

    function validatePhoneNumber(){
        var phoneNumber = document.getElementById('contact').value;
        if(isHpForm(phoneNumber)){
            alert('유효하지 않은 휴대폰 번호입니다. 다시 입력해주세요.');
            return false;
        }
        return true;
    }

    function isHpForm(hp) {
        if (hp == "") {
            return true;
        }
        var phoneRule = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
        return phoneRule.test(hp);
    }



</script>
<script src="../js/order.js"></script>
</body>
</html>
