<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:useBean id="bbs" scope="request" type="java.util.List"/>
<!DOCTYPE html>

<html>
<meta charset="utf-8">
<head>
    <title>상품후기</title>
    <link rel="stylesheet" type="text/css" href="../css/communitypagestyle.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>

    <div id="wrap">
        <header id="header">
            <h1>
                <a href="../index.jsp">Super Hero Story</a>
            </h1>

            <ul class="login">
                <% if (session.getAttribute("userId") == null) { %>
                <li><a href="../member/Login.jsp">로그인</a></li> <!-- Login -->
                <li><a href="../member/Join.jsp">회원가입</a></li> <!-- Sign Up -->
                <% } else { %>
                <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li> <!-- Logout -->
                <li><a href="../member/MyPage.jsp">마이페이지</a></li>
                <% } %>
            </ul>

            <nav id="menu">
                <ul>
                    <li><a href="profilePage.jsp">소개</a></li>
                    <li><a href="../shop/goodsPage.jsp">상점</a></li>
                    <li><a href="Review.jsp">상품후기</a></li>
                    <li><a href="faqPage.jsp">FAQ</a></li>
                </ul>
            </nav>
        </header>

        <main id="main">
            <div class="container">
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
                        <c:forEach items="${bbs}" var="post" varStatus="loop">
                            <tr>
                                <th scope="row">${loop.index + 1}</th>
                                <td>
                                    <a href="<c:url value="board/view.do?boardId=${post.boardId}&postId=${post.id}"/>">${post.title}</a>
                                </td>
                                <td>${post.author_uid}</td>
                                <td><fmt:formatDate value="${post.postdate}" pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="write_btn">
                    <a href="<c:url value='/board/write.do'><c:param name='board' value='1' /><c:param name="action" value="write"/> </c:url>"><img src="../img/pen.png" alt="펜"></a>
                    <!--        writePage로 이동-->
                </div>
            </div>
        </main>

        <footer id="footer">Copyright (c) 2023 Re-Coder</footer>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</body>
</html>