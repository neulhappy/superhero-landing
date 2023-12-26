<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
</head>
<body>
    <a href="<c:url value='/board/write.do'><c:param name='board' value='2' /><c:param name='action' value='write' /></c:url>">
        <button type="button" class="btn btn-info" style="transform: translate(1200px, 40px); color: white">Write
        </button>
    </a>
    <table class="table table-hover">
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
                <td>문의 게시판에 글이 없습니다.</td>
            </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</body>
</html>
