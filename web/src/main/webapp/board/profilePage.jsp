<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>소개 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/profilepagestyle.css"/>
</head>
<body>

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
            <content>
                <p style="font-size: 1.4rem; font-weight: 400; color: #726f6f; text-align: center; padding-top: 300px">
                    re-coder는 마블 히어로 제품 및 서비스를 제공하는 브랜드입니다
                </p>
            </content>
        </Section>
    </main>

    <footer id="footer">
        <p>Copyright (c) 2023 Re-Coder</p>
        <out_logo><a href="../index.jsp"><img src="../img/profooterlogo.png"></a></out_logo>
    </footer>

</body>
</html>
