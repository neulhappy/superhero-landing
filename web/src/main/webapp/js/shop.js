function addCart(productId, productName, productPrice) {
    let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
    let product = cart.find(item => item.productId === productId);

    if (product) {
        product.quantity += 1;
        alert('장바구니 내 상품의 수량이 추가되었습니다.');
    } else {
        let newProduct = {
            productId: productId,
            productName: productName,
            productPrice: productPrice,
            quantity: 1
        };
        cart.push(newProduct);
        alert('상품이 장바구니에 추가되었습니다.');
    }
    sessionStorage.setItem('cart', JSON.stringify(cart));
}


function renderCartTable() {
    const cartTable = document.getElementById('cartTable');
    if (!cartTable) {
        checkAndRenderCart(null)
    }
    const cartJson = sessionStorage.getItem('cart');
    const cart = JSON.parse(cartJson) || [];
    checkAndRenderCart(cart)
    cartTable.innerHTML = '';

    const thead = document.createElement('thead');
    const headerRow = document.createElement('tr');

    const headerCell1 = document.createElement('th');
    headerCell1.textContent = '상품명';
    headerRow.appendChild(headerCell1);

    const headerCell2 = document.createElement('th');
    headerCell2.textContent = '수량';
    headerRow.appendChild(headerCell2);

    const headerCell3 = document.createElement('th');
    headerCell3.textContent = '삭제';
    headerRow.appendChild(headerCell3);

    thead.appendChild(headerRow);
    cartTable.appendChild(thead);

    const tbody = document.createElement('tbody');
    cart.forEach(function (product, index) {
        const row = document.createElement('tr');

        const cell1 = document.createElement('td');
        const prodName = document.createElement('span');
        prodName.textContent = product.productName;
        prodName.className = 'prodName';
        cell1.appendChild(prodName);
        row.appendChild(cell1);

        const cell2 = document.createElement('td');
        const quantInput = document.createElement('input');
        quantInput.type = 'number';
        quantInput.name = 'quantity_' + index;
        quantInput.value = product.quantity;
        quantInput.addEventListener('input', function () {
            updateQuantity(index, parseInt(quantInput.value, 10));
        });
        cell2.appendChild(quantInput);
        row.appendChild(cell2);

        const cell3 = document.createElement('td');
        const deleteButton = document.createElement('button');
        deleteButton.textContent = '삭제';
        deleteButton.addEventListener('click', function () {
            deleteProduct(index);
        });
        cell3.appendChild(deleteButton);
        row.appendChild(cell3);

        tbody.appendChild(row);
    });

    cartTable.appendChild(tbody);
}

function checkAndRenderCart(cart) {
    if (cart === null || cart.length === 0) {
        alert('장바구니가 비었습니다.');
        window.history.back();
        return false;
    }
    return true;
}

function updateQuantity(index, newQuantity) {
    const cartJson = sessionStorage.getItem('cart');
    let cart = JSON.parse(cartJson) || [];

    cart[index].quantity = newQuantity;

    updateSessionStorage(cart);
}

function deleteProduct(index) {
    const cartJson = sessionStorage.getItem('cart');
    let cart = JSON.parse(cartJson) || [];

    cart.splice(index, 1);

    updateSessionStorage(cart);
}

function updateSessionStorage(cart) {
    const cartJson = JSON.stringify(cart);
    sessionStorage.setItem('cart', cartJson);
    renderCartTable();
}

function clearCart() {
    const cart = [];
    sessionStorage.setItem('cart', JSON.stringify(cart));
    renderCartTable();
}


renderCartTable();