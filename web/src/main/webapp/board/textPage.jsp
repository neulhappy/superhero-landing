<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>상세페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/textPagestyle.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

    <header id="header">
        <h1><a href="../index.jsp"><img src="../img/textlogo.png"></a></h1>
        <div class="icon">
            <button type="button" class="btn btn-outline-success">Catalogue</button>
            <button type="button" class="btn btn-outline-danger">Remove</button>
            <button type="button" class="btn btn-outline-warning">Edit</button>
        </div>
    </header>

    <main id="main">
        <!-- Additional information -->
        <div id="post-info" style="padding: 20px 50px; background: blanchedalmond">
            <h2 id="post-title">${post.title}</h2>
            <p id="post-author">${post.author_uid}</p>
            <p id="post-date"><fmt:formatDate value="${post.postdate}" pattern="yyyy-MM-dd"/></p>
            <p id="post-views">${post.visitcount}</p>
        </div>

        <div id="viewer"></div>
    </main>


    <footer>
        <jsp:include page="../include/Footer.jsp"/>
    </footer>

    <script src="../js/text.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
    <!-- Include other scripts if needed -->

    <script>
        document.addEventListener('DOMContentLoaded', function() {
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
</body>
</html>
