<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>MyPage</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        body {
            width: 1200px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1.3em;
            line-height: 1.6;
        }

        .mypage {
            display: flex;
            justify-content: space-between;
            width: calc((100% - 100px) / 2);
        }

        h1 {
            padding-left: 100px;
        }

        h1 > a {
            color: #2d2d2d;
        }

        ul {
            list-style: none;
            text-align: center;
        }
        .nav > ul {
            text-align: center;
            width: calc(1200px - 800px);
        }

        li {
            margin-left: 100px;
            padding: 50px;
        }

        li > a {
            color: #2d2d2d;
        }

        a {
            text-decoration: none;
        }

        .box {
            position: relative;
            margin: 250px auto;
            width: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            border-radius: 7px;
            font-size: 0.7em;
        }

        .box input,
        .box button {
            padding: 15px;
            font-size: 1.2em;
            border: none;
        }

        .box input {
            margin-bottom: 25px;
            border: #8f8a8a solid 2px;
            border-radius: 4px;
        }

        .box button {
            background-color: #575757;
            color: #dce0ec;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>
        <a href="/index.jsp">Super Hero Landing</a>
    </h1>
    <div class="mypage">
        <div class="nav">
            <ul>
                <li><a href="OrderMypage.jsp">주문내역</a></li>
                <li><a href="${pageContext.request.contextPath}mypage.do?action=QnA">나의 문의내역</a></li>
                <li><a href="MyReview.jsp">나의 후기</a></li>
                <li><a href="MyShoppingCart.jsp">장바구니</a></li>
            </ul>
        </div>
        <div class="login">
            <form id="passwordForm" class="box" action="passwordCheck.do" method="post">
                <input type="hidden" name="mode" value="inform">
                <input type="hidden" name="id" value="<%= session.getAttribute("userId") %>">
                <input type="password" placeholder="Password" name="pw" id="pw"/>
                <button type="submit">인증하기</button>
            </form>
        </div>
    </div>
    <script>
        async function sha256(str) {
            const buffer = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(str));
            return Array.from(new Uint8Array(buffer)).map(byte => byte.toString(16).padStart(2, '0')).join('');
        }

        document.getElementById('passwordForm').addEventListener('submit', async function(event) {
            event.preventDefault();
            const password = document.getElementById('pw').value;
            const hashedPassword = await sha256(password);
            document.getElementById('passwordForm').action = "passwordCheck.do?hashedPw=" + hashedPassword;
            document.getElementById('passwordForm').submit();
        });
    </script>
</body>
</html>
