<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>상세페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/textPagestyle.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <form action="<c:url value='/board/write.do' />" method="post" id="deleteForm">
        <input type="hidden" name="board" value="${post.boardId}"/>
        <input type="hidden" name="id" value="${post.id}"/>
        <input type="hidden" name="action" value="delete"/>
        <header id="header">
            <h1><a href="../index.jsp"><img src="../img/textlogo.png" alt="상세페이지 로고"></a></h1>
            <div class="icon">
                <a href="<c:url value='/board/list.do'><c:param name='board' value='${post.boardId}' /></c:url>">
                    <button type="button" class="btn btn-outline-success">List</button>
                </a>
                <button type="button" class="btn btn-outline-danger" onclick="confirmDelete()">Remove</button>
                <a href="<c:url value='/board/write.do'><c:param name='board' value='${post.boardId}' /><c:param name="id" value="${post.id}"/></c:url>">
                    <button type="button" class="btn btn-outline-warning">Edit</button>
                </a>
            </div>
        </header>

        <main id="main">
            <!-- Additional information -->
            <div id="post-info" style="padding: 40px 50px 20px; background: url('../img/titlebg.jpg') no-repeat bottom; background-size: 1800px; text-align: center;">
                <h2 id="post-title" style="font-weight: 700; color: #eece84">TITLE: ${post.title}</h2>
                <p id="post-author" style="font-weight: 600;  color: #e7fcbc">AUTHOR: ${post.author_uid}</p>
                <p id="post-date" style="font-weight: 600;  color: #e7fcbc">DATE: <fmt:formatDate value="${post.postdate}" pattern="yyyy-MM-dd"/></p>
                <p id="post-views" style="font-weight: 600;  color: #e7fcbc">VISIT: ${post.visitcount}</p>
            </div>

            <div id="viewer" style="background: #e1f6e3; min-height: 800px; padding: 10px; transform: translate(0, 30px)"></div>
        </main>


        <footer>
            <jsp:include page="../include/Footer.jsp"/>
        </footer>

        <script src="../js/text.js"></script>
        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
        <!-- Include other scripts if needed -->

        <script>
            function confirmDelete() {
                if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
                    document.getElementById('deleteForm').submit();
                }
            }

            document.addEventListener('DOMContentLoaded', function () {
                const viewer = new toastui.Editor({
                    el: document.querySelector('#viewer'),
                    viewer: true,
                    height: '500px',
                    initialValue: '${post.content}'
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                crossorigin="anonymous"></script>
    </form>
</body>
</html>
