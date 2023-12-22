const IMP = window.IMP;
IMP.init("imp85622471");

let total;
let orderId;
const kakaoButton = document.querySelector(".kakao");



const onKakaoPay = async () => {
    IMP.request_pay({
        pg: "kakaopay.TC0ONETIME",
        pay_method: "card",
        amount: parseInt(total),
        name: "히어로 굿즈",
        buyer_email: "구매자 이메일", // -->${memberDTO.email} 필요 없을시 제거 필요
        merchant_uid: "merchant_" + new Date().getTime()
    }, function (rsp) {
        if (rsp.success) {
            pay_info(rsp);
        } else {
            alert("결제에 실패하셨습니다.");
        }
    });
}
kakaoButton.addEventListener("click", async () => {
    try{
        await submitForm();
        onKakaoPay();
    }catch (error){
        console.error(error);
        alert("주문 처리중 오류발생");
    }
});


function pay_info(rsp) {
    var form = document.createElement('form');
    var objs;

    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'productName');
    objs.setAttribute('value', rsp.name);
    form.appendChild(objs);

    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'buyer_buyid');
    objs.setAttribute('value', rsp.imp_uid);
    form.appendChild(objs);

    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'productId');
    objs.setAttribute('value', rsp.merchant_uid);
    form.appendChild(objs);

    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'amount');
    objs.setAttribute('value', rsp.paid_amount);
    form.appendChild(objs);


    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'status');
    objs.setAttribute('value', rsp.status);
    form.appendChild(objs);

    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'paymentTime');
    objs.setAttribute('value', rsp.paid_at);
    form.appendChild(objs);

    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'paymentMethod');
    objs.setAttribute('value', rsp.pg_provider);
    form.appendChild(objs);

    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'orderId');
    objs.setAttribute('value', orderId);
    form.appendChild(objs);

    form.setAttribute('method', 'post');
    form.setAttribute('action', "paySuccess.do");
    form.setAttribute('accept-charset', 'UTF-8');
    document.body.appendChild(form);

    form.submit();
}




function phoneNumberRule(str) {//휴대폰 번호 유효성 검사
    return /^01(?:0|1|[6-9])-\d{3,4}-\d{4}$/.test(str);
}

function nameRule(str) {//이름 유효성 검사
    return /^[A-Za-z가-힣]+$/.test(str);
}

function addressRule(str) {//주소 유효성 검사
    return /^[A-Za-z가-힣0-9\s\-\.,#]+$/.test(str);
}

const InputPurchaserName = document.querySelector('#purchaser_name');
const InputRecipientName = document.querySelector('#recipient_name');
const InputAddress = document.querySelector('#address');
const InputPhoneNumber = document.querySelector('#contact');

function validateForm() {
    console.log("되고있는중");

    var resultDiv = document.getElementById("phoneNumberCheckResult");
    if (phoneNumberRule(InputPhoneNumber.value) === true
        && nameRule(InputPurchaserName.value) === true
        && nameRule(InputRecipientName.value) === true
        && addressRule(InputAddress.value) === true) {
        submitButton.disabled = false; // 유효성 검사 성공 시 버튼 활성화]
    } else {
        submitButton.disabled = true; // 유효성 검사 실패 시 버튼 비활성화

    }
}

function submitForm() {
    return new Promise((resolve, reject) => {
        let formData = $("#orderForm").serializeArray();
        let cart = JSON.parse(sessionStorage.getItem('cart')) || [];

        cart.forEach(function (product, index) {
            formData.push({name: 'prod_id_' + index, value: product.productId});
            formData.push({name: 'quantity_' + index, value: product.quantity});
        });

        $.ajax({
            type: "post",
            url: "order.do",
            data: formData,
            dataType: 'json',
            success: function (data) {
                orderId = data.orderId;
                total = data.total;
                resolve();
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

            }
        });
    });
}

