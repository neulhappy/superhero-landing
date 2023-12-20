<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dynamic Hero Page</title>
</head>
<body>
    <ul>
        <%--foreach문을 이용해 heroList의 길이만큼 li를 동적으로 생성--%>
        <c:forEach var="hero" items="${heroList}">
            <li>
                <img src='../img/hero/${hero.id}.jpg' alt='${hero.Heroname}'>
                <span class='popupBtn'>${hero.Heroname}</span>
                <div class='modalWrap'>
                    <div class='modalContent'>
                        <div class='modalBody'>
                            <span class='closeBtn'>&times;</span>
                        </div>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
