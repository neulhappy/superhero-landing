<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.board.hero.HeroManager" %>
<%@ page import="com.board.hero.HeroName" %>
<%@ page import="com.board.hero.HeroInfo" %>

<%
    // Instantiate HeroManager
    HeroManager heroManager = new HeroManager();

// Get HeroInfo for Doctor Strange
    HeroInfo doctorStrangeInfo = heroManager.getHeroInfo(HeroName.DOCTOR_STRANGE);
    HeroInfo winterSoldierInfo = heroManager.getHeroInfo(HeroName.WINTER_SOLDIER);
    HeroInfo blackWidowInfo = heroManager.getHeroInfo(HeroName.BLACK_WIDOW);
    HeroInfo blackPantherInfo = heroManager.getHeroInfo(HeroName.BLACK_PANTHER);
    HeroInfo visionInfo = heroManager.getHeroInfo(HeroName.VISION);
    HeroInfo scarletWitchInfo = heroManager.getHeroInfo(HeroName.SCARLET_WITCH);
    HeroInfo starLordInfo = heroManager.getHeroInfo(HeroName.STAR_LORD);
    HeroInfo spiderManInfo = heroManager.getHeroInfo(HeroName.SPIDER_MAN);
    HeroInfo ironManInfo = heroManager.getHeroInfo(HeroName.IRON_MAN);
    HeroInfo antManInfo = heroManager.getHeroInfo(HeroName.ANT_MAN);
    HeroInfo warMachineInfo = heroManager.getHeroInfo(HeroName.WAR_MACHINE);
    HeroInfo captainAmericaInfo = heroManager.getHeroInfo(HeroName.CAPTAIN_AMERICA);
    HeroInfo thorInfo = heroManager.getHeroInfo(HeroName.THOR);
    HeroInfo falconInfo = heroManager.getHeroInfo(HeroName.FALCON);
    HeroInfo hulkInfo = heroManager.getHeroInfo(HeroName.HULK);
    HeroInfo hawkEyeInfo = heroManager.getHeroInfo(HeroName.HAWK_EYE);
%>
<html>
<head>
    <title>Hero 소개</title>
    <link rel="stylesheet" type="text/css" href="../css/profilepage02style.css"/>
</head>
<body>
<div id="wrap">
    <header id="header">
        <h1><img src="../img/profile02logo.png" alt="프로필로고02"></h1>
        <nav>
            <ul class="menu">
                <li><a href="<c:url value="/board/profile.do"><c:param name='action' value='intro' /></c:url>">브랜드 소개</a></li>
                <li><a href="<c:url value="/board/profile.do"><c:param name='action' value='hero' /></c:url>">Hero 소개</a></li>
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
                                <h2><%= doctorStrangeInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= doctorStrangeInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= doctorStrangeInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= doctorStrangeInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= doctorStrangeInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= doctorStrangeInfo.getStory() %>
                                </p>

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
                                <h2><%= winterSoldierInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= winterSoldierInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= winterSoldierInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= winterSoldierInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= winterSoldierInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= winterSoldierInfo.getStory() %>
                                </p>
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
                                <h2><%= blackWidowInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= blackWidowInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= blackWidowInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= blackWidowInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= blackWidowInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= blackWidowInfo.getStory() %>
                                </p>
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
                                <h2><%= blackPantherInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= blackPantherInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= blackPantherInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= blackPantherInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= blackPantherInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= blackPantherInfo.getStory() %>
                                </p>
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
                                <h2><%= visionInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= visionInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= visionInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= visionInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= visionInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= visionInfo.getStory() %>
                                </p>
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
                                <h2><%= scarletWitchInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= scarletWitchInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= scarletWitchInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= scarletWitchInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= scarletWitchInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= scarletWitchInfo.getStory() %>
                                </p>
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
                                <h2><%= starLordInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= starLordInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= starLordInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= starLordInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= starLordInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= starLordInfo.getStory() %>
                                </p>
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
                                <h2><%= spiderManInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= spiderManInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= spiderManInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= spiderManInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= spiderManInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= spiderManInfo.getStory() %>
                                </p>
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
                                <h2><%= ironManInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= ironManInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= ironManInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= ironManInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= ironManInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= ironManInfo.getStory() %>
                                </p>
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
                                <h2><%= antManInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= antManInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= antManInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= antManInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= antManInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= antManInfo.getStory() %>
                                </p>
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
                                <h2><%= warMachineInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= warMachineInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= warMachineInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= warMachineInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= warMachineInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= warMachineInfo.getStory() %>
                                </p>
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
                                <h2><%= captainAmericaInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= captainAmericaInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= captainAmericaInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= captainAmericaInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= captainAmericaInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= captainAmericaInfo.getStory() %>
                                </p>
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
                                <h2><%= thorInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= thorInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= thorInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= thorInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= thorInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= thorInfo.getStory() %>
                                </p>
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
                                <h2><%= falconInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= falconInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= falconInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= falconInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= falconInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= falconInfo.getStory() %>
                                </p>
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
                                <h2><%= hulkInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= hulkInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= hulkInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= hulkInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= hulkInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= hulkInfo.getStory() %>
                                </p>
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
                                <h2><%= hawkEyeInfo.getHeroName() %>
                                </h2>
                                <br>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    이름: <%= hawkEyeInfo.getName() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    배우: <%= hawkEyeInfo.getActor() %>
                                </p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    나이: <%= hawkEyeInfo.getAge() %> 세</p>
                                <p style="text-align: left; font-size: 1.4rem; color: #547fb2">
                                    mbti: <%= hawkEyeInfo.getMbti() %>
                                </p>
                                <br>
                                <p style="font-size: 1.3rem;"><%= hawkEyeInfo.getStory() %>
                                </p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>

        </div>
    </main>


    <footer id="footer">
        <p>Copyright (c) 2023 Re-Coder</p>
        <out_logo><a href="../index.jsp"><img src="../img/profooterlogo.png"></a></out_logo>
    </footer>
</div>

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
            return function () {
                // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
                btns[num].onclick = function () {
                    modals[num].style.display = "block";
                    console.log(num);
                };

                // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
                spanes[num].onclick = function () {
                    modals[num].style.display = "none";
                };
            };
        }

        // 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
        for (var i = 0; i < btns.length; i++) {
            funcs[i] = Modal(i);
        }

        // 원하는 Modal 수만큼 funcs 함수를 호출합니다.
        for (var j = 0; j < btns.length; j++) {
            funcs[j]();
        }

        // Modal 영역 밖을 클릭하면 Modal을 닫습니다.
        window.onclick = function (event) {
            if (event.target.className == "modal") {
                event.target.style.display = "none";
            }
        };

    </script>


</body>
</html>
