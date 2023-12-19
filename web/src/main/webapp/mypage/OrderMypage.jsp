<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>주문내역</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        * {
            text-decoration: none;
            list-style: none;
        }
        body {
            width: 1200px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1.3em;
            line-height: 1.6;
        }

        .mypage {
            display: flex;
            justify-content: space-between;
        }

        h1 {
            padding-left: 100px;
        }

        h1 > a {
            color: #2d2d2d;
        }

        .nav > ul {
            text-align: center;
            width: calc(1200px - 800px);
        }

        .nav > ul > li {
            margin-left: 100px;
            padding: 50px;
        }

        .nav > ul > li > a {
            color: #2d2d2d;
        }

        .order {
            margin-top: 50px;
            font-size: 1.1rem;
            width: 800px;

        }

        .order > .title {
            display: flex;
            justify-content: left;
            gap: 20px;
            padding-bottom: 30px;
        }



        span {
            color: rgb(128, 128, 128);
        }
    </style>
</head>
<body>
<h1>
    <a href="/index.jsp">Super Hero Landing</a>
</h1>
<div class="mypage">
    <div class="nav">
        <ul>
            <li><a href="OrderMypage.jsp"><span>주문내역</span></a></li>
            <li><a href="MyQnA.jsp">나의 문의내역</a></li>
            <li><a href="MyReview.jsp">나의 후기</a></li>
            <li><a href="MyShoppingCart.jsp">장바구니</a></li>
            <li><a href="MyInformation.jsp">회원정보</a></li>
        </ul>
    </div>
    <div class="order">
        <ul class="title">
            <li>주문내역조회</li>
            <li>반품/환불조회</li>
        </ul>
        <table border="1">
            <tr>
                <th>주문번호[상품번호]</th>
                <th>상품명</th>
                <th>수량</th>
                <th>주문일자</th>
                <th>처리상태</th>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
