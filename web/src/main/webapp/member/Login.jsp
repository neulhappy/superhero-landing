<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <a href="<c:url value="/index.do"/>">Super Hero Story</a>
    </h1>
    <form id="loginform" class="box" action="login.do" method="post" onsubmit="return validateForm(this)">
        <input type="hidden" name="mode" value="login"/>
        <input type="text" placeholder="ID" name="id" id="id"/>
        <input type="password" placeholder="Password" name="pw" id="pw" autocomplete="current-password"/>
        <button name="submit">Login</button>
        <div class="sign-up-box" id="signup">
            <i class="material-icons"><a href="Join.jsp">Sign Up</a></i>
        </div>
    </form>
    <script>
        const inpId = document.querySelector('#id');
        const inpPw = document.querySelector('#pw');

        const myForm = document.getElementById('loginform');
        myForm.addEventListener('submit', async function (event) {
            event.preventDefault(); // 기본 제출 동작을 막음
            try {
                if (await validateForm()) {
                HTMLFormElement.prototype.submit.call(myForm);
                }
            } catch (error) {
                alert(error.message); // 에러 메시지를 알림으로 표시
            }
        });

        async function validateForm() {
            if (inpId.value === "" || inpPw.value === "") {
                throw new Error("아이디와 패스워드를 모두 입력하세요."); // 예외 발생
            }
            // 해시화 진행
            inpPw.value = await sha256(inpPw.value);
            console.log(inpPw.value);
            return true;
        }

        async function sha256(str) {
            return crypto.subtle.digest('SHA-256', new TextEncoder().encode(str))
            .then(buffer => Array.prototype.map.call(new Uint8Array(buffer), x => ('00' + x.toString(16)).slice(-2)).join(''));
        }
    </script>
</body>
</html>
