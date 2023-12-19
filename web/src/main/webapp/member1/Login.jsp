<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>로그인페이지</title>
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
            right: -10%;
            top: 10%;
            width: 80px;
            height: 80px;
            background: linear-gradient(to bottom, rgb(255, 255, 255), #86acd9); /* 버블 느낌 */
            border-radius: 50% 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }
        .sign-up-box:hover {
            transform: scale(1.1); /* 마우스 호버 시 커짐 */
        }

        .sign-up-box i {
            font-size: 1em;
            color: #fff;
        }
        .sign-up-box > i > a {
            text-decoration: none;
            color: #fdf5ef;
        }
        h1 {
            text-align: center;
            padding-top: 30px;
        }
        h1 > a {
            text-decoration: none;
            color: #86acd9;
        }


    </style>
</head>
<body>
<h1>
    <a href="/index.jsp">Super Hero Story</a>
</h1>
<form class="box" action="login.do" method="post" onsubmit="return validateForm(this)">
    <input type="hidden" name="mode" value="login">
    <input type="text" placeholder="ID" name="id">
    <input type="password" placeholder="Password" name="pw" />
    <button name="submit">Login</button>
    <div class="sign-up-box" id="signup">
        <i class="material-icons"><a href="Join.jsp">Sign Up</a></i>
    </div>
</form>
<script>
    function validateForm(form) {
        if(form.id.value == "") {
            alert("아이디를 입력하세요.");
            return false;
        }
        if(form.pw.value == "") {
            alert("패스워드를 입력하세요.");
            return false;
        }
    }

</script>
</body>
</html>
