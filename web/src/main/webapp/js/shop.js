function addCart(productId) {
    let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
    if (cart.indexOf(productId) === -1) {
        cart.push(productId);
        sessionStorage.setItem('cart', JSON.stringify(cart));
        alert('상품이 장바구니에 추가되었습니다.');
    } else {
        alert('이미 장바구니에 있는 상품입니다.');
    }
}
