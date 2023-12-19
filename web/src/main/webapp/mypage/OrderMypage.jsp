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
            color: black;
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
            color: #575757;
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
            height: 30px;
            width: 700px;
            background: black;
            border-radius: 4px;
            color: #e7e7e7;
            padding: 15px 0 15px 30px;
            font-weight: 600;
        }

        table {
            width: 700px;
            height: 400px;
            text-align: center;
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
            <li><a href="${pageContext.request.contextPath}mypage.do?action=QnA">나의 문의내역</a></li>
            <li><a href="MyReview.jsp">나의 후기</a></li>
            <li><a href="MyShoppingCart.jsp">장바구니</a></li>
        </ul>
    </div>
    <div class="order">
        <ul class="title">
            <li>주문내역조회</li>
            <li>반품/환불조회</li>
        </ul>
        <table>
            <tr>
                <th>주문번호[상품번호]</th>
                <th>상품명</th>
                <th>수량</th>
                <th>주문일자</th>
                <th>처리상태</th>
            </tr>
            <tr>
                <td>123456</td>
                <td>아이언맨 카드</td>
                <td>5</td>
                <td>2023-12-19</td>
                <td>상품 준비중</td>
            </tr>
            <tr>
                <td>123156</td>
                <td>스파이더맨 카드</td>
                <td>2</td>
                <td>2023-12-19</td>
                <td>상품 준비중</td>
            </tr>
            <tr>
                <td>122156</td>
                <td>닥터스트레인지 카드</td>
                <td>3</td>
                <td>2023-12-19</td>
                <td>상품 준비중</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
