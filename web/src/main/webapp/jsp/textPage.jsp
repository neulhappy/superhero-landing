<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-20
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>상세페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/textPagestyle.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
    <div class="content"></div>
</main>

<footer>
<jsp:include page="Footer.jsp"/>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
