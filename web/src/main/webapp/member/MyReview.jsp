<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원정보</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        body {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1.3em;
            line-height: 1.6;
        }

        .mypage {
            width: 1200px;
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
            padding: 30px;
        }

        a {
            text-decoration: none;
            color: #2d2d2d;
        }

        table {
            padding-top: 100px;
            width: 700px;
            height: 300px;
            text-align: center;
        }
        table thead {
            background: black;
        }
        table thead th {
            border-radius: 3px;
            color: #ffffff;
        }
        span {
            color: rgb(128, 128, 128);
        }

        footer{transform: translate(0, 50px)}
    </style>
</head>
<body>
<h1>
    <a href="<c:url value='/index.do'/>">Super Hero Story</a>
</h1>
<div class="mypage">
    <div class="nav">
        <ul>
            <li><a href="<c:url value='/member/mypage.do'/>">회원정보</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=Order'/>">주문내역</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=QnA'/>">나의 문의내역</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=Review'/>">나의 후기</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=Shopping'/>">장바구니</a></li>
        </ul>
    </div>
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">글제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
            <c:choose>
                <c:when test="${not empty bbs}">
                        <tbody>
                        <c:forEach items="${bbs}" var="post" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td><a href="<c:url value='/board/view.do?board=${post.boardId}&id=${post.id}'/>">${post.title}</a></td>
                                <td>${post.author_uid}</td>
                                <td><fmt:formatDate value="${post.postdate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                        </c:forEach>
                </c:when>
                <c:otherwise>
                    <td>작성하신 리뷰글이 없습니다.</td>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</div>

<footer>
    <jsp:include page="../include/Footer.jsp"/>
</footer>
</body>
</html>
