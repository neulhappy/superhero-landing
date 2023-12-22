<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
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
                <a href="<c:url value='/index.do'/>">
                    <img src="img/mainlogo.png" alt="ReCoderLogo"/>
                </a>
            </h1>

            <div class="inner">
                <ul class="login">
                    <c:if test="${empty sessionScope.userId}">
                        <li><a href="<c:url value="/member/login.do"/>">로그인</a></li>
                        <li><a href="<c:url value="/member/join.do"/>">회원가입</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.userId}">
                        <li><a href="<c:url value="/member/logout.do"/>">로그아웃</a></li>
                        <li><a href="<c:url value='/member/mypage.do'><c:param name='action' value='mypage' /></c:url>">마이페이지</a>
                        </li>
                    </c:if>
                </ul>

                <nav id="menu">
                    <ul>
                        <li><a href="<c:url value="/board/profile.do"><c:param name='action' value='intro' /></c:url>">소개</a></li>
                        <li>
                            <a href="<c:url value='/shop/goods.do'><c:param name='category' value='goods' /></c:url>">상점</a>
                        <li><a href="<c:url value='/board/list.do'><c:param name='board' value='1' /></c:url>">상품후기</a>
                        <li><a href="<c:url value='/board/list.do'><c:param name='board' value='2' /></c:url>">FAQ</a>
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