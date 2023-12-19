<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-15
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Hero 소개</title>
    <link rel="stylesheet" type="text/css" href="../css/profilepage02style.css"/>
</head>
<body>

<header id="header">
    <h1><img src="../img/profile02logo.png"></h1>
    <nav>
        <ul class="menu">
            <li><a href="profilePage.jsp">브랜드 소개</a></li>
            <li><a href="profilePage02.jsp">Hero 소개</a></li>
        </ul>
    </nav>
</header>

<main id="main">
    <div class="content">
<%--        <ul class="icon">--%>
<%--            <li><a href="#"><img src="../img/icon.png" alt="찜한 영웅"></a></li>--%>
<%--            <li>전체순</li>--%>
<%--        </ul>--%>

        <form method="get" action="Checkbox">
        <ul class="Hero">
            <li><a href=""><img src="../img/hero/dr.jpg" alt="닥터스트레인지">닥터스트레인지</a></li>
            <li><a href=""><img src="../img/hero/winter%20soldier.jpg" alt="윈터솔져">윈터솔져</a></li>
            <li><a href=""><img src="../img/hero/black.jpg" alt="블랙 위도우">블랙 위도우</a></li>
            <li><a href=""><img src="../img/hero/black02.jpg" alt="블랙팬서">블랙팬서</a></li>
            <li><a href=""><img src="../img/hero/Vision.jpg" alt="비즈">비즈</a></li>
            <li><a href=""><img src="../img/hero/scarlet.jpg" alt="스칼렛 위치">스칼렛 위치</a></li>
            <li><a href=""><img src="../img/hero/star.jpg" alt="스타로드">스타로드</a></li>
            <li><a href=""><img src="../img/hero/spider.jpg" alt="스파이더맨">스파이더맨</a></li>
            <li><a href=""><img src="../img/hero/iron.jpg" alt="아이언맨">아이언맨</a></li>
            <li><a href=""><img src="../img/hero/ant.jpg" alt="앤트맨">앤트맨</a></li>
            <li><a href=""><img src="../img/hero/war.jpg" alt="워머신">워머신</a></li>
            <li><a href=""><img src="../img/hero/captain.jpg" alt="캡틴 아메리카">캡틴 아메리카</a></li>
            <li><a href=""><img src="../img/hero/thor.jpg" alt="토르">토르</a></li>
            <li><a href=""><img src="../img/hero/falcon.jpg" alt="팔콘">팔콘</a></li>
            <li><a href=""><img src="../img/hero/hulk.jpg" alt="헐크">헐크</a></li>
            <li><a href=""><img src="../img/hero/hawk.jpg" alt="호크아이">호크아이</a></li>
        </ul>
        </form>
    </div>
</main>

<footer id="footer">
    <p>Copyright (c) 2023 Re-Coder</p>
    <out_logo><a href="../index.jsp"><img src="../img/profooterlogo.png"></a></out_logo>
</footer>

<script>
    $("input:checkbox[id='1']").prop("checked", true);
    $("input:checkbox[id='1']").prop("checked", false);
</script>

<script>
    $("input:checkbox[name=item]:checked").each(function(){
        var checkVal = $(this).val();
        console.log(checkVal);
    })
</script>

</body>
</html>
