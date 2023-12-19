<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>로그인페이지</title>
    <span style="color:red; font-size: 1.2em;">
        <%= request.getAttribute("LoginErrMsg") %>
    </span>
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
        .sign-up-box {
            position: absolute;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background-color: #86acd9;
            display: flex;
            justify-content: center;
            align-items: center;
            top: var(--padding);
            right: -35px;
            cursor: pointer;
            transition: all 500ms ease-in-out;
        }
        .sign-up-box i {
            font-size: 1em;
            color: #fff;
        }

    </style>
</head>
<body>
<% if(session.getAttribute("userId") == null) {
%>
<script>
    function validateForm(form) {
        if(!form.id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if(form.pw.value == "") {
            alert("패스워드를 입력하세요.");
            return false;
        }
    }
</script>
<form class="box" action="login.do" method="post">
    <input type="text" placeholder="ID" name="id">
    <input type="password" placeholder="Password" name="pw" />
    <button name="submit">Login</button>
    <div class="sign-up-box" id="signup">
        <i class="material-icons"><a href="Join.jsp">Sign Up</a></i>
    </div>
</form>
<%
    } else {
%>
    회원님, 로그인하셨습니다. <br/>
    <a href="Logout.jsp">[로그아웃]</a>
<%
    }
%>
</body>
</html>
