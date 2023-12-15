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

        const onKakaoPay = async () => {
            IMP.request_pay({
                pg: "kakaopay.TC0ONETIME",
                pay_method: "card",
                amount: "9999",
                name: "히어로 굿즈",
                buyer_email: "구매자 이메일",
                merchant_uid: "merchant_" + new Date().getTime()
            }, function (rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;

                    pay_info(rsp);

                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;

                    location.href = "fail.do?error_msg=" + rsp.error_msg;
                }
            });
        }
        const onTossPay = async () => {
            IMP.request_pay({
                pg: "tosspay.tosstest",
                pay_method: "card",
                amount: "9999",
                name: "히어로 굿즈",
                buyer_email: "구매자 이메일",
                merchant_uid: "merchant_" + new Date().getTime()
            }, function (rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;

                    pay_info(rsp);

                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;

                    location.href = "fail.do?error_msg=" + rsp.error_msg;
                }
            });
        }
            kakaoButton.addEventListener("click", onKakaoPay);
            tossButton.addEventListener("click", onTossPay);

            //TODO 이해가 안가서 버려야할듯..?
            <%--app.post("/payments/verify", async (req, res) => {--%>
            <%--    const { data: { access_token} } = await  axios({--%>
            <%--        url: "https://api.iamport.kr/users/getToken",--%>
            <%--        method: "post",--%>
            <%--        headers: { "Content-Type": "application/json"},--%>
            <%--        data:{--%>
            <%--            imp_key: `${1001757686487166}`,--%>
            <%--            imp: `${k6jA3Y4enjTUjDCaiKleWhSE6evYxw3GccFLsBzs8wXDmb2Egh5Ne4GIXKqMJyJIGqKWOMqcK1QcaYGA}`--%>
            <%--        }--%>
            <%--    });--%>
            <%--});--%>

            <%--app.post("/payments/check", async (req, res) => {--%>
            <%--    const { data: { access_token } } = await  axios({--%>
            <%--        url: "https://api.iamport.kr/users/getToken",--%>
            <%--        method: "post",--%>
            <%--        headers: { "Content-Type": "application/json"},--%>
            <%--        data:{--%>
            <%--            imp_key: `${1001757686487166}`,--%>
            <%--            imp: `${k6jA3Y4enjTUjDCaiKleWhSE6evYxw3GccFLsBzs8wXDmb2Egh5Ne4GIXKqMJyJIGqKWOMqcK1QcaYGA}`--%>
            <%--        }--%>
            <%--    });--%>
            <%--});--%>

            function pay_info(rsp) {
                var form = document.createElement('form');
                var objs;

                objs = document.createElement('input');
                objs.setAttribute('type', 'hidden');
                objs.setAttribute('name', 'buyer_email');
                objs.setAttribute('value', rsp.buyer_email);
                form.appendChild(objs);

                objs = document.createElement('input');
                objs.setAttribute('type', 'hidden');
                objs.setAttribute('name', 'buy_product_name');
                objs.setAttribute('value', rsp.name);
                form.appendChild(objs);

                objs = document.createElement('input');
                objs.setAttribute('type', 'hidden');
                objs.setAttribute('name', 'buyer_buyid');
                objs.setAttribute('value', rsp.imp_uid);
                form.appendChild(objs);

                objs = document.createElement('input');
                objs.setAttribute('type', 'hidden');
                objs.setAttribute('name', 'buyer_merid');
                objs.setAttribute('value', rsp.merchant_uid);
                form.appendChild(objs);

                objs = document.createElement('input');
                objs.setAttribute('type', 'hidden');
                objs.setAttribute('name', 'amount');
                objs.setAttribute('value', rsp.paid_amount);
                form.appendChild(objs);

                objs = document.createElement('input');
                objs.setAttribute('type', 'hidden');
                objs.setAttribute('name', 'buyer_pay_ok');
                objs.setAttribute('value', rsp.success);
                form.appendChild(objs);

                form.setAttribute('method', 'post');
                form.setAttribute('action', "paySuccess.do");
                document.body.appendChild(form);
                form.submit();
            }
    </script>

</body>
</html>
