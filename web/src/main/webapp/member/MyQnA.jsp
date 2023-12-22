<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원정보</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        body {
            width: 1200px;
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
        .nav > ul {
            text-align: center;
            width: calc(1200px - 800px);
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
        span {
            color: rgb(128, 128, 128);
        }
    </style>
</head>
<body>
<h1>
    <a href="<c:url value="/index.do"/>">Super Hero Story</a>
</h1>
<div class="mypage">
    <div class="nav">
        <ul>
            <li><a href="OrderMypage.jsp">주문내역</a></li>
            <li><a href="${pageContext.request.contextPath}mypage.do?action=QnA"><span>나의 문의내역</span></a></li>
            <li><a href="MyReview.jsp">나의 후기</a></li>
            <li><a href="MyShoppingCart.jsp">장바구니</a></li>
        </ul>
    </div>
</div>
</body>
</html>
