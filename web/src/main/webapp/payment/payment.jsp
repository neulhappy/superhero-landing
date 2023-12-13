<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <button class="kakao">카카오 페이 결제</button>
    <!-- jQuery -->
    <button class="toss">토스 결제</button>

    <script>
        const IMP = window.IMP;
        IMP.init("imp85622471");

        const kakaoButton = document.querySelector(".kakao");
        const tossButton = document.querySelector(".toss");

        const onClickPay = async () =>{
            IMP.request_pay({
                pg: "kakaopay.TC0ONETIME",
                pay_method: "card",
                amount: "10000",
                name: "매운 라면",
                merchant_uid: "wtf1"
        });}

        const onClickPay2 = async () =>{
            IMP.request_pay({
                pg: "tosspay.tosstest",
                pay_method: "card",
                amount: "1",
                name: "히어로 굿즈",
                merchant_uid: "wtf3"
            });}

        kakaoButton.addEventListener("click",onClickPay);
        tossButton.addEventListener("click",onClickPay2);
    </script>

</body>
</html>
