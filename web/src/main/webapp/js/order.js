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
            pay_info(rsp);

        } else {
            location.href = "payFailed.jsp";
        }
    });
}
const onTossPay = async () => {
    IMP.request_pay({
        pg: "tosspay.tosstest",
        pay_method: "card",
        amount: "9999",
        name: "hero goods",
        buyer_email: "구매자 이메일",
        merchant_uid: "merchant_" + new Date().getTime()
    }, function (rsp) {
        if (rsp.success) {
            pay_info(rsp);
        } else {
            location.href = "payFailed.jsp";
        }
    });
}
kakaoButton.addEventListener("click", onKakaoPay);
tossButton.addEventListener("click", onTossPay);

function pay_info(rsp) {
    var form = document.createElement('form');
    var objs;
    console.log(rsp.name)
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

    function addProduct() {
        var productList = document.getElementById("productList");

        // 상품 목록 요소 생성
        var product = document.createElement("li");

        var quantityWrapper = document.createElement("div");
        quantityWrapper.className = "quantity-wrapper";

        var quantityInput = document.createElement("input");
        quantityInput.type = "number";
        quantityInput.min = "1"; // 최소값
        quantityInput.value = "1"; // 초기값
        quantityInput.className = "quantity-input";

        // X 버튼
        var deleteBtn = document.createElement("button");
        deleteBtn.type = "button";
        deleteBtn.textContent = "X";
        deleteBtn.onclick = function () {
            product.remove(); // X 버튼을 누르면 해당 상품 목록 삭제
        };

        // 상품 목록 요소에 상품 개수 입력 필드와 X 버튼 추가
        quantityWrapper.appendChild(quantityInput);
        quantityWrapper.appendChild(deleteBtn);

        // 상품 목록에 상품 추가
        product.appendChild(quantityWrapper);
        productList.appendChild(product);
    }

function sendData() {
    var validPhonenumber = validatePhoneNumber();
    if(!validPhonenumber){
        return;
    }
    // 폼 데이터 가져오기
    var formData = {
        customer_id: document.getElementById('customer_id').value,
        purchaser_name: document.getElementById('purchaser_name').value,
        recipient_name: document.getElementById('recipient_name').value,
        address: document.getElementById('address').value,
        contact: document.getElementById('contact').value
        // 다른 필드들도 추가할 수 있습니다.
    };

    // AJAX를 이용한 데이터 전송
    $.ajax({
        type: 'POST',
        url: '/shop/order.jsp', // 데이터를 처리할 서버의 엔드포인트 URL을 입력하세요.
        data: formData,
        success: function(response) {
            // 성공 시 실행되는 코드
            alert('주문지 작성이 성공적으로 완료되었습니다.');
            // 추가 작업을 할 수 있습니다.
        },
        error: function(error) {
            // 실패 시 실행되는 코드
            alert('주문지 작성에 실패했습니다.');
        }
    });
}