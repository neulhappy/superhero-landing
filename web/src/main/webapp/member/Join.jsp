
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

        /*.active*/

        .sign-up-box.active {
            top: 0;
            bottom: 0;
            right: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: stretch;
            padding: 30px;
            cursor: default;
            border-radius: 7px;
        }

        .sign-up-box.active input,
        .sign-up-box.active button {
            padding: 15px;
            font-size: 1.2em;
            border: none;
            margin: 0;
        }
        .sign-up-box.active input {
            margin-bottom: 10px;
        }

        .sign-up-box.active > span {
            position: absolute;
            width: 30px;
            height: 30px;
            background-color: #fff;
            border-radius: 50%;
            top: 5px;
            right: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #547fb2;
            font-weight: 700;
            cursor: pointer;
        }
    </style>
</head>
<body>
<c:if test="${ joinResult == 0}">
    <script>
        alert("아이디가 중복됩니다.");
    </script>
</c:if>
<form class="box" action="join.do" method="post">
    <input type="email" placeholder="ID" id="email" />
    <input type="password" placeholder="Password" id="pw" />
    <button>Sign in</button>

    <div class="sign-up-box" id="signup">
        <i class="material-icons">회원가입</i>
    </div>
</form>
<script>
    const signUpBox = document.querySelector(".sign-up-box");

    signUpBox.addEventListener("click", handleClick, false);
    function handleClick(event) {
        if (signUpBox.classList.contains("active")) return;
        let str = `
        <span onclick="event.stopPropagation(); removedActive();">X</span>
        <input type="text" name="id" placeholder="ID" />
        <input type="email" name="email" placeholder="Email" />
        <input type="password" name="pw" placeholder="Password" />
        <input type="submit" name="submit" placeholder="SignUp">
    `;
        this.classList.toggle("active");
        this.innerHTML = "";
        setTimeout(() => (this.innerHTML = str), 500);
    }

    function removedActive() {
        signUpBox.classList.remove("active");
        signUpBox.innerHTML = `<i class="material-icons">회원가입</i>`;
    }
    function handleSignUp() {
        let signUpBoxActive = document.querySelector(".active");
        let inputs = signUpBoxActive.querySelectorAll("input");
        let idField = inputs[0];
        let emailField = inputs[1];
        let passwordField = inputs[2];
        if (
            idField.value === "" ||
            emailField.value === "" ||
            passwordField.value === ""
        ) {
            return;
        }
        removedActive();
    }
</script>
</body>
</html>
