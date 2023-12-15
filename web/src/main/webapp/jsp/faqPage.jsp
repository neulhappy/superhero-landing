<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-14
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/faqpagestyle.css"/>
</head>
<body>

<header id="header">
    <h1><img src="../img/faqlogo.png"></h1>
</header>

<main id="main">
    <div role="tabpanel">
        <!-- List group -->
        <div class="list-group" id="myList" role="tablist">
            <a class="list-group-item list-group-item-action active" data-bs-toggle="list" href="#home" role="tab">Home</a>
            <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#profile" role="tab">Profile</a>
            <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#messages" role="tab">Messages</a>
            <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#settings" role="tab">Settings</a>
        </div>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="home" role="tabpanel">1</div>
            <div class="tab-pane" id="profile" role="tabpanel">2</div>
            <div class="tab-pane" id="messages" role="tabpanel">3</div>
            <div class="tab-pane" id="settings" role="tabpanel">4</div>
        </div>
    </div>

</main>

<footer id="footer">

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>