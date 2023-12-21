<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원가입</title>
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
            background-color: #ffebe0;
            color: #547fb2;
            border-radius: 4px;
        }
        div {
            position: absolute;
            font-size: 1em;
            font-weight: bold;
        }
        #idCheckResult {
            top: 9%;
        }
        #emCheckResult{
            top: 28%;
        }
        #pwCheckResult {
            width: 400px;
            left: 3%;
        }
        h1 {
           text-align: center;
            padding-top: 30px;
        }
        a {
            text-decoration: none;
            color: #86acd9;
        }

    </style>
</head>
<body>
<h1>
    <a href="/index.jsp">Super Hero Story!</a>
</h1>
<form id="joinform" class="box" action="join.do" method="post" onsubmit="return validateForm(this);">
    <div id="idCheckResult"></div>
    <input type="text" onkeyup="checkId()" placeholder="ID" name="id" id="id" minlength="4" maxlength="10" required>
    <input type="email" placeholder="Email" onkeyup="checkEm()" name="email" id=email />
    <div id="emCheckResult"></div>
    <input type="password" onkeyup="checkPw()" placeholder="Password" name="pw" id="pw" minlength="4" maxlength="10" required/>
    <div id="pwCheckResult"></div>
    <button name="submit">Sign Up</button>
</form>

<script type="text/javascript">
    const elInputId = document.querySelector('#id');
    const elInputPw = document.querySelector('#pw');
    const elInputEm = document.querySelector('#email');

    document.addEventListener('DOMContentLoaded', function() {
        // 이벤트 리스너 추가
        elInputId.addEventListener('input', checkId);
        elInputPw.addEventListener('input', checkPw);
        elInputEm.addEventListener('input', checkEm);

        // 폼 제출 이벤트 핸들러
        const myForm = document.getElementById('joinform');
        myForm.addEventListener('submit', async function(event) {
            event.preventDefault(); // 기본 제출 동작을 막음
            if (await validateForm()) {
                HTMLFormElement.prototype.submit.call(myForm);
            }
        });
    });

    // 아이디 유효성 검사
    function joinId(str) {
        return /^[A-Za-z0-9]{4,10}$/.test(str);
    }

    // 이메일 유효성 검사
    function joinEmail(asValue) {
        return /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(asValue);
    }

    // 비밀번호 유효성 검사
    function joinPw(password) {
        return /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{4,}$/.test(password);
    }
    // 비밀번호 유효성 검사 및 결과 표시
    function checkPw() {
        const pwCk = document.getElementById("pwCheckResult");
        if (joinPw(elInputPw.value)) {
            pwCk.innerText = "안전한 비밀번호입니다.";
            pwCk.style.color = "green";
            pwCk.style.left = "15%";
        } else {
            pwCk.innerText = "4~10글자, 대소문자, 숫자, 특수문자를 포함해주세요.";
            pwCk.style.color = "red";
            pwCk.style.left = "3%";
        }
    }


    // 이메일 유효성 검사
    function checkEm() {
        const emCk = document.getElementById("emCheckResult");
        if(joinEmail(elInputEm.value)) {
            emCk.innerText = "사용 가능한 이메일입니다.";
            emCk.style.color = "green";
        } else {
            emCk.innerText = "이메일 형식을 확인해주세요.";
            emCk.style.color = "red";
        }
    }

    // 아이디 중복 확인
    async function checkId() {
        var id = document.getElementById("id").value;

        // 서버에 중복 확인 요청 전송
        var result = await fetch('/member/checkId.do', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'id=' + encodeURIComponent(id)
        }).then(response => response.text());

        var resultDiv = document.getElementById("idCheckResult");
        if(joinId(elInputId.value)) {
            resultDiv.innerHTML = result === "true" ? "사용 가능한 아이디입니다." : "이미 사용 중인 아이디입니다.";
            resultDiv.style.color = result === "true" ? "green" : "red";
        } else {
            resultDiv.innerHTML = "4~10글자, 영어와 숫자로 입력하세요."
            resultDiv.style.color = "red";
        }
    }

    // 폼 유효성 검사
    async function validateForm() {
        if (!joinId(elInputId.value)) {
            alert("아이디를 다시 입력해주세요");
            elInputId.focus();
            return false;
        }
        if (!joinEmail(elInputEm.value)) {
            alert("이메일을 다시 입력해주세요.");
            elInputEm.focus();
            return false;
        }
        // 비밀번호 검사 추가
        if (!joinPw(elInputPw.value)) {
            alert("비밀번호를 다시 입력해주세요.");
            elInputPw.focus();
            return false;
        }
        elInputPw.value = await sha256(elInputPw.value);
        return true;
    }

    // 비밀번호 해시화
    async function sha256(str) {
        return crypto.subtle.digest('SHA-256', new TextEncoder().encode(str))
            .then(buffer => Array.prototype.map.call(new Uint8Array(buffer), x => ('00' + x.toString(16)).slice(-2)).join(''));
    }

</script>
</body>
</html>
