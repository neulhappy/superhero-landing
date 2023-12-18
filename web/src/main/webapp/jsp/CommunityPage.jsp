<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-14
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<meta charset="utf-8">
<head>
    <title>상품후기</title>
    <link rel="stylesheet" type="text/css" href="../css/communitypagestyle.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>

<div id="wrap">
    <header id="header">
        <h1>
            <a href="../index.jsp">Super Hero Story</a>
        </h1>

        <ul class="login">
            <li><a href="../member1/Login.jsp">로그인</a></li>
            <li><a href="../member1/Join.jsp">회원가입</a></li>
        </ul>

        <nav id="menu">
            <ul>
                <li><a href="#">소개</a></li>
                <li><a href="#">상점</a></li>
                <li><a href="CommunityPage.jsp" >상품후기</a></li>
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
                <tr>
                    <th scope="row">1</th>
                    <td>${param.title}</td>
                    <td>${param.name}</td>
                    <td> <%
                        Date date = new Date();
                        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
                        String strDate = simpleDate.format(date);%>
                        <%=strDate%>
                    </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>

            <div class="write_btn">
                <a href="writePage.jsp"><img src="../img/pen.png" alt="펜"></a>
                <!--        writePage로 이동-->
            </div>
        </div>
    </main>

    <footer id="footer">Copyright (c) 2023 Re-Coder</footer>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>