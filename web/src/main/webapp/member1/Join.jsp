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
            background-color: #ffebe0;
            color: #547fb2;
            border-radius: 4px;
        }
        div {
            position: absolute;
            font-size: 1em;
            display: none;
            font-weight: bold;
        }
        .div_id {
            top:37%;
        }
        #div_pwOk, #div_idOk {
            color: green;
        }
        #div_pw, #div_id {
            color: red;
        }
        #div_pw, #div_pwOk {
            bottom: 25%;
        }
        #idCheckResult {
            top: 8%;
            display: block;
        }

    </style>
</head>
<body>
<form id="joinform" class="box" action="join.do" method="post" onsubmit="return validateForm(this);">
    <div class="div_id" id="div_id">영어와 숫자로 입력해주세요.</div>
    <div class="div_id" id="div_idOk">아이디 중복확인을 해주세요.</div>
    <button type="button" onclick="checkDuplicate()">아이디 중복 확인</button>
    <div id="idCheckResult"></div>
    <input type="text" placeholder="ID" name="id" id="id" minlength="4" maxlength="10" required>
    <input type="email" placeholder="Email" name="email" id=email />
    <input type="password" placeholder="Password" name="pw" id="pw" minlength="4" maxlength="10" required/>
    <div class="div_pw" id="div_pw">4~10글자 사이로 입력해주세요.</div>
    <div class="div_pw" id="div_pwOk">사용가능한 비밀번호입니다.</div>
    <button name="submit">Sign Up</button>
</form>

<script type="text/javascript">
    function checkDuplicate() {
        var id = document.getElementById("id").value; // 입력된 아이디 가져오기

        // 서버로 중복 확인 요청을 보냅니다.
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/member1/checkId.do", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var result = xhr.responseText; // 서버에서 받은 결과 (true 또는 false)
                var resultDiv = document.getElementById("idCheckResult");

                if (result === "true") {
                    resultDiv.innerHTML = "사용 가능한 아이디입니다.";
                    resultDiv.style.color = "green";
                } else {
                    resultDiv.innerHTML = "이미 사용 중인 아이디입니다.";
                    resultDiv.style.color = "red";
                }
            }
        }

        // 서버로 아이디를 전송합니다.
        var data = "id=" + encodeURIComponent(id);
        xhr.send(data);
    }

    // 비밀번호 해시화
    const myForm = document.getElementById('joinform');
    myForm.addEventListener('submit', async function (event) {
        console.log("1");
        event.preventDefault(); // 기본 제출 동작을 막음
        await validateForm(this); // this는 현재 폼을 가리킴
        HTMLFormElement.prototype.submit.call(myForm)
    });
    async function validateForm(form) {
        if(joinId(elInputId.value) === false) {
            alert("아이디를 다시 입력해주세요");
            elInputId.focus();
            return false;
    // 아이디가 유효하지 않으면 submit 방지
        }
        // 비밀번호 해시화
        const hashedPw = await sha256(form.pw.value);
        form.pw.value = hashedPw;
    }
    async function sha256(str) {
        return crypto.subtle.digest('SHA-256', new TextEncoder().encode(str))
            .then(buffer => Array.prototype.map.call(new Uint8Array(buffer), x => ('00' + x.toString(16)).slice(-2)).join(''));
    }
    // 아이디,비밀번호 제한 이벤트
    let elInputId = document.querySelector('#id');
    let elInputPw = document.querySelector('#pw');

    function joinId(str) {
        return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
    }
    function updateIdValidation() {
        const isValid = elInputId.value.length >= 4 && joinId(elInputId.value);
        document.getElementById('div_id').style.display = isValid ? 'none' : 'block';
        document.getElementById('div_idOk').style.display = isValid ? 'block' : 'none';
    }
    function updatePwValidation() {
        const isValid = elInputPw.value.length >= 4;
        document.getElementById('div_pw').style.display = isValid ? 'none' : 'block';
        document.getElementById('div_pwOk').style.display = isValid ? 'block' : 'none';
    }
    elInputId.addEventListener('input', updateIdValidation);
    elInputPw.addEventListener('input', updatePwValidation);
    // 페이지 로드 시에는 두 div 요소를 숨김
    document.getElementById('div_id').style.display = 'none';
    document.getElementById('div_pw').style.display = 'none';
</script>
</body>
</html>
