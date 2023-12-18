<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>임시 결제</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/paymentstyle.css"/>
</head>
<body>
<button class="kakao btn btn-primary btn-lg">카카오 페이 결제</button>

<button class="toss btn btn-primary btn-lg">토스 결제</button>

<button class="btn btn-primary btn-lg" onclick="showHiddenButtons()">간편 결제</button>


<script src="../js/order.js"></script>
</body>
</html>
