<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>소개 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/profilepagestyle.css"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<body>
<div id="wrap">
    <header id="header">
        <h1><img src="../img/profilelogo.png"></h1>
        <nav>
            <ul class="menu">
                <li><a href="<c:url value="/board/profile.do"><c:param name='action' value='intro' /></c:url>">브랜드
                    소개</a></li>
                <li><a href="<c:url value="/board/profile.do"><c:param name='action' value='hero' /></c:url>">Hero
                    소개</a></li>
            </ul>
        </nav>
    </header>

    <main id="main">
        <Section id="sec1"><p>좋은 제품을 드리겠다는 마음으로 이 사이트를 개발했습니다</p></Section>
        <Section id="sec2">
            <div data-aos="fade-up"
                 data-aos-offset="200"
                 data-aos-duration="1000"
                 data-aos-easing="ease-in-out"
                 data-aos-mirror="true"
                 data-aos-once="false"
                 data-aos-anchor-placement="top-center">
                <p style="font-size: 1.4rem; font-weight: 400; color: #726f6f; text-align: center; padding-top: 200px; line-height: 2">
                    re-coder는 마블 히어로 제품 및 서비스를 제공하는 브랜드입니다<br>
                    제공 중인 제품 및 서비스에는 굿즈, 포토카드, 히어로 프로필이 있습니다<br>
                    앞으로 더 발전하는 re-coder가 되겠습니다
                </p>
                <img src="../img/flower.png" alt="꽃" style="width: 300px; transform: translate(0,50px); opacity: 0.5">
                <img src="../img/flower.png" alt="꽃" style="width: 300px; transform: translate(0,50px); opacity: 0.5">
                <img src="../img/flower.png" alt="꽃" style="width: 300px; transform: translate(680px,50px); opacity: 0.5">
                <img src="../img/flower.png" alt="꽃" style="width: 300px; transform: translate(680px,50px); opacity: 0.5">
            </div>
        </Section>
    </main>

    <footer id="footer">
        <p>Copyright (c) 2023 Re-Coder</p>
        <out_logo><a href="../index.jsp"><img src="../img/profooterlogo.png"></a></out_logo>
    </footer>
</div>

<script>
    AOS.init();
</script>
</body>
</html>
