<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.util.JoinController" %>
<%@ page import="org.util.DBConnPool" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static java.sql.DriverManager.getConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Title</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        :root {
            --padding: 60px;
        }
        .box {
            position: relative;
            margin: 50px auto;
            width: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: var(--padding);
            background-color: #c4dfff;
            border-radius: 7px;
        }

        .box input,
        .box button {
            padding: 15px;
            font-size: 1.2em;
            border: none;
        }
        .box input {
            margin-bottom: 25px;
        }
        .box button {
            background-color: #ffe4c4;
            color: #547fb2;
            border-radius: 4px;
        }

    </style>
    <script type="text/javascript">
        function validateForm(form) {
            if(form.id.value == ""){
                alert("아이디를 입력하세요.");
                form.id.focus();
                return false;
            }
            if(form.email.value == ""){
                alert("이메일을 입력하세요.");
                form.email.focus();
                return false;
            }
            if(form.pw.value == ""){
                alert("비밀번호를 입력하세요.");
                form.pw.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<c:if test="${ idCheck == 0}">
    <script>
        alert("아이디가 중복됩니다.")
    </script>
</c:if>
<form class="box" action="join.do" method="post" onsubmit="return validateForm(this);">
    <input type="text" placeholder="ID" name="id">
    <input type="email" placeholder="Email" name="email" />
    <input type="password" placeholder="Password" name="pw" />
    <button name="submit">Sign Up</button>
</form>
</body>
</html>
