const IMP = window.IMP;
IMP.init("imp85622471");

let total = 0;
let products = [];

const kakaoButton = document.querySelector(".kakao");

const onKakaoPay = async () => {

    IMP.request_pay({
        pg: "kakaopay.TC0ONETIME",
        pay_method: "card",
        amount: 1,  //-->${productDTO.price} * n +
        name: "히어로 굿즈", // -->${productDTO.name}
        buyer_email: "구매자 이메일", // -->${memberDTO.email} 필요 없을시 제거 필요
        merchant_uid: "merchant_" + new Date().getTime()
    }, function (rsp) {
        if (rsp.success) {
            pay_info(rsp);

        } else {
            //todo;failled 처리
            alert("결제에 실패하셨습니다.");
        }
    });
}
kakaoButton.addEventListener("click", onKakaoPay);


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
        submitButton.disabled = false; // 유효성 검사 성공 시 버튼 활성화
    } else {
        submitButton.disabled = true; // 유효성 검사 실패 시 버튼 비활성화
    }
}

function submitForm() {
    //const form = document.getElementById('orderForm');
    let formData = $("#orderForm").serializeArray();

    let cart = JSON.parse(sessionStorage.getItem('cart')) || [];

    cart.forEach(function (product, index){
        formData.push({ name: 'prod_id_' + index, value: product.productId });
        formData.push({ name: 'quantity_' + index, value: product.quantity });
    });

    $.ajax({
        type: "post",
        url: "orderSuccess.do",
        data: formData,
        dataType: 'json',
        success: function (data) {
            alert("success");
            console.log(data);
        },
        error: function (request, status, error) {
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

        }
    });
}


// 장바구니에 담긴 상품들을 표시하는 함수
// function displayCart() {
//     let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
//
//     // HTML로 장바구니에 담긴 상품들을 만듭니다.
//     let cartItemsHTML = '<ul>';
//     let orderList = '';
//     if (cart.length === 0) {
//         cartItemsHTML += '<li>장바구니에 상품이 없습니다.</li>';
//     } else {
//         // 각 상품마다 3개씩 정보가 들어있으므로, 각각의 정보를 가져와서 표시합니다.
//         for (let i = 0; i < cart.length; i += 3) {
//             const productId = cart[i].productId;
//             const productName = cart[i + 1].productName;
//             const productPrice = cart[i + 2].productPrice;
//             cartItemsHTML += `<li><img src="../img/goods/${productId}.jpg" style="width: 150px; height: 150px;">     상품명: ${productName}      가격 : ${productPrice}원</li>`;
//
//             products.push(productId);
//             total += parseInt(productPrice);
//
//             orderList += `<input type="number" name="${productId}">`
//
//         }
//     }
//     document.getElementById('orderList').innerHTML = orderList;
//     document.getElementById('cartItems').innerHTML = cartItemsHTML;
//     document.getElementById("total").textContent = `${total}원`;
// }
//
// function clearCart() {
//     sessionStorage.removeItem('cart'); // 'cart' 세션 삭제
//     // 여기에 세션 삭제 후의 추가적인 처리를 할 수 있습니다.
//     // 예: 장바구니 화면을 리로드하여 업데이트하는 등의 작업
//     total = 0;
//     displayCart(); // 장바구니 화면 다시 표시
// }




// 페이지가 로드될 때 장바구니를 표시합니다.
// window.onload = displayCart;
