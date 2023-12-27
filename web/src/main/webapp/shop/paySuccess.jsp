<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>결제 완료</title>

</head>
<body>
    <h1>결제가 완료되었습니다.</h1>
    <button onclick=clearCart()>처음으로</button>
<script>
    function clearCart() {
        window.location.href = '../index.jsp'
        const cart = [];
        sessionStorage.setItem('cart', JSON.stringify(cart));
        renderCartTable();
    }
</script>
</body>
</html>
