<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-15
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.util.hero.HeroManager" %>
<%@ page import="com.util.hero.HeroName" %>
<%@ page import="com.util.hero.HeroInfo" %>
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

        <ul class="Hero">
            <li>
                <img src="../img/hero/dr.jpg" alt="닥터스트레인지">
                    <span class="popupBtn">닥터스트레인지</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>

                        </div>
                    </div>
                </div>
            </li>

            <li>
                <img src="../img/hero/winter%20soldier.jpg" alt="윈터솔져">
                <span class="popupBtn">윈터솔져</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>

            <li><img src="../img/hero/black.jpg" alt="블랙 위도우">
                <span class="popupBtn">블랙 위도우</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>

            <li><img src="../img/hero/black02.jpg" alt="블랙팬서">
                <span class="popupBtn">블랙팬서</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/Vision.jpg" alt="비즈">
                <span class="popupBtn">비즈</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/scarlet.jpg" alt="스칼렛 위치">
                <span class="popupBtn">스칼렛 위치</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/star.jpg" alt="스타로드">
                <span class="popupBtn">스타로드</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/spider.jpg" alt="스파이더맨">
                <span class="popupBtn">스파이더맨</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/iron.jpg" alt="아이언맨">
                <span class="popupBtn">아이언맨</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/ant.jpg" alt="앤트맨">
                <span class="popupBtn">앤트맨</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/war.jpg" alt="워머신">
                <span class="popupBtn">워머신</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/captain.jpg" alt="캡틴 아메리카">
                <span class="popupBtn">캡틴 아메리카</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/thor.jpg" alt="토르">
                <span class="popupBtn">토르</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/falcon.jpg" alt="팔콘">
                <span class="popupBtn">팔콘</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/hulk.jpg" alt="헐크">
                <span class="popupBtn">헐크</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li><img src="../img/hero/hawk.jpg" alt="호크아이">
                <span class="popupBtn">호크아이</span>
                <div class="modalWrap">
                    <div class="modalContent">
                        <div class="modalBody">
                            <span class="closeBtn">&times;</span>
                            <p>modal-popup 입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>

    </div>
</main>


<footer id="footer">
    <p>Copyright (c) 2023 Re-Coder</p>
    <out_logo><a href=" ../index.jsp"><img src="../img/profooterlogo.png"></a></out_logo>
</footer>

<script>

    // Modal을 가져옵니다.
    var modals = document.getElementsByClassName("modalWrap");
    // Modal을 띄우는 클래스 이름을 가져옵니다.
    var btns = document.getElementsByClassName("popupBtn");
    // Modal을 닫는 close 클래스를 가져옵니다.
    var spanes = document.getElementsByClassName("closeBtn");
    var funcs = [];

    // Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
    function Modal(num) {
        return function() {
            // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
            btns[num].onclick =  function() {
                modals[num].style.display = "block";
                console.log(num);
            };

            // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
            spanes[num].onclick = function() {
                modals[num].style.display = "none";
            };
        };
    }

    // 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
    for(var i = 0; i < btns.length; i++) {
        funcs[i] = Modal(i);
    }

    // 원하는 Modal 수만큼 funcs 함수를 호출합니다.
    for(var j = 0; j < btns.length; j++) {
        funcs[j]();
    }

    // Modal 영역 밖을 클릭하면 Modal을 닫습니다.
    window.onclick = function(event) {
        if (event.target.className == "modal") {
            event.target.style.display = "none";
        }
    };

</script>


</body>
</html>
