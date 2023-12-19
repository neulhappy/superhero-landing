<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>MyPage</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        body {
            width: 100%;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1.3em;
            line-height: 1.6;
        }

        .mypage {
            display: flex;
            justify-content: space-between;
            width: calc((100% - 100px) / 2);
        }

        h1 {
            padding-left: 100px;
        }

        h1 > a {
            color: #2d2d2d;
        }

        ul {
            list-style: none;
            text-align: center;
        }

        li {
            margin-left: 100px;
            padding: 50px;
        }

        li > a {
            color: #2d2d2d;
        }
        a {
            text-decoration: none;
        }

        .box {
            position: relative;
            margin: 300px auto;
            width: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            border-radius: 7px;
        }

        .box input,
        .box button {
            padding: 15px;
            font-size: 1.2em;
            border: none;
        }

        .box input {
            margin-bottom: 25px;
            border: #8f8a8a solid 2px;
            border-radius: 4px;
        }

        .box button {
            background-color: #575757;
            color: #dce0ec;
            border-radius: 4px;
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
            <li><a href="OrderMypage.jsp">주문내역</a></li>
            <li><a href="MyQnA.jsp">나의 문의내역</a></li>
            <li><a href="MyReview.jsp">나의 후기</a></li>
            <li><a href="MyShoppingCart.jsp">장바구니</a></li>
            <li><a href="MyInformation.jsp">회원정보</a></li>
        </ul>
    </div>
    <div class="login">
        <form class="box" action="MyInformation.jsp">
            <input type="hidden" placeholder="ID" name="id">
            <input type="password" placeholder="Password" name="pw"/>
            <button name="submit">인증하기</button>
        </form>
    </div>
</div>
</body>
</html>
