const IMP = window.IMP;
IMP.init("imp85622471");

let total = 0;

const kakaoButton = document.querySelector(".kakao");

const onKakaoPay = async () => {

    IMP.request_pay({
        pg: "kakaopay.TC0ONETIME",
        pay_method: "card",
        amount: total,  //-->${productDTO.price} * n +
        name: "히어로 굿즈", // -->${productDTO.name}
        buyer_email: "구매자 이메일", // -->${memberDTO.email} 필요 없을시 제거 필요
        merchant_uid: "merchant_" + new Date().getTime()
    }, function (rsp) {
        if (rsp.success) {
            pay_info(rsp);

        } else {
            //todo;failled 처리
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


var predefinedProducts = ["상품1", "상품2", "상품3", "상품4", "상품5"];

function addProduct() {
    var productList = document.getElementById("productList");
    // 상품 목록 요소 생성
    var product = document.createElement("li");
    product.style.listStyle = "none";

    var productName = document.createElement("span");
    productName.textContent = "상품명";
    productName.style.marginLeft = "0px";

    var select = document.createElement("select");
    select.style.width = "400px";
    select.style.marginLeft = "10px";
    predefinedProducts.forEach(function (productName) {
        var option = document.createElement("option");
        option.value = productName;
        option.textContent = productName;
        select.appendChild(option);
    });

    var quantityWrapper = document.createElement("div");
    quantityWrapper.className = "quantity-wrapper";
    quantityWrapper.style.display = "flex";

    var quantityInput = document.createElement("input");
    quantityInput.type = "number";
    quantityInput.min = "1"; // 최소값
    quantityInput.max = "10"; // 최대값
    quantityInput.value = "1"; // 초기값
    quantityInput.className = "quantity-input";
    quantityInput.style.width = "50px";
    quantityInput.style.height = "25px";
    quantityInput.style.marginLeft = "100px";

    var quantityUnit = document.createElement("span");
    quantityUnit.textContent = "개";

    // X 버튼
    var deleteBtn = document.createElement("button");
    deleteBtn.type = "button";
    deleteBtn.textContent = "X";
    deleteBtn.style.height = "25px";
    deleteBtn.style.marginLeft = "200px";
    deleteBtn.onclick = function () {
        product.remove(); // X 버튼을 누르면 해당 상품 목록 삭제
    };

    // 상품 목록 요소에 상품 개수 입력 필드와 X 버튼, '개' 텍스트 추가
    quantityWrapper.appendChild(productName);
    quantityWrapper.appendChild(select);
    quantityWrapper.appendChild(quantityInput);
    quantityWrapper.appendChild(quantityUnit);
    quantityWrapper.appendChild(deleteBtn);

    product.appendChild(quantityWrapper);
    productList.appendChild(product);
}

// function submit() {
//     sendOrderData();
// }

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
    let formData = $("#orderForm").serialize();
    console.log(formData);

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
function displayCart() {
    let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
    // HTML로 장바구니에 담긴 상품들을 만듭니다.
    let cartItemsHTML = '<ul>';

    if (cart.length === 0) {
        cartItemsHTML += '<li>장바구니에 상품이 없습니다.</li>';
    } else {
        // 각 상품마다 3개씩 정보가 들어있으므로, 각각의 정보를 가져와서 표시합니다.
        for (let i = 0; i < cart.length; i += 3) {
            const productId = cart[i];
            const productName = cart[i + 1];
            const productPrice = cart[i + 2];
            cartItemsHTML += `<li><img src="../img/goods/${productId}.jpg" style="width: 150px; height: 150px;">     상품명: ${productName}      가격 : ${productPrice}원</li>`;


            total += parseInt(productPrice);
        }
    }
    document.getElementById('cartItems').innerHTML = cartItemsHTML;
    document.getElementById("total").textContent = `${total}원`;
}

function clearCart() {
    sessionStorage.removeItem('cart'); // 'cart' 세션 삭제
    // 여기에 세션 삭제 후의 추가적인 처리를 할 수 있습니다.
    // 예: 장바구니 화면을 리로드하여 업데이트하는 등의 작업
    total = 0;
    displayCart(); // 장바구니 화면 다시 표시
}


// 페이지가 로드될 때 장바구니를 표시합니다.
window.onload = displayCart;
