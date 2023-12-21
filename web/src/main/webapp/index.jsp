<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Super Hero Story</title>
    <link rel="stylesheet" type="text/css" href="css/mainpagestyle.css"/>
</head>
<body>
<div id="wrap">
    <header id="header">
        <div class="image">
            <ul class="img1">
                <li class="image1">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image2">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image3">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image4">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image5">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image6">
                    <img src="img/snow.png" alt="눈">
                </li>
            </ul>

            <ul class="img2">
                <li class="image7">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image8">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image9">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image10">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image11">
                    <img src="img/snow.png" alt="눈">
                </li>
                <li class="image12">
                    <img src="img/snow.png" alt="눈">
                </li>
            </ul>
        </div>


        <h1>
            <a href="${pageContext.request.contextPath}/index.do"><img src="img/mainlogo.png"></a>
        </h1>

        <div class="inner">
            <ul class="login">
                <c:if test="${empty sessionScope.userId}">
                    <li><a href="member/Login.jsp">로그인</a></li> <!-- Login -->
                    <li><a href="member/Join.jsp">회원가입</a></li> <!-- Sign Up -->
                </c:if>
                <c:if test="${not empty sessionScope.userId}">
                    <li><a href="logout">로그아웃</a></li> <!-- Logout -->
                    <li><a href="member/MyPage.jsp">마이페이지</a></li>
                </c:if>
            </ul>

        <nav id="menu">
            <ul>
                <li><a href="board/profilePage.jsp">소개</a></li>
                <li><a href="shop/goods.jsp">상점</a></li>
                <li><a href="board/Review.jsp">상품후기</a></li>
                <li><a href="board/faqPage.jsp">FAQ</a></li>
            </ul>
        </nav>
        </div>

    </header>

    <main id="main">

        <div></div>

    </main>

    <footer id="footer">Copyright (c) 2023 Re-Coder</footer>

</div>

<script src="js/main.js"></script>
</body>
</html>