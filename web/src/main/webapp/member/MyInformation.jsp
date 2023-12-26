<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.util.DBConnPool" %>
<%@ page import="com.util.Logger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원정보</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        body {
            width: 1200px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1.3em;
            line-height: 1.6;
            color: #676767;
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
            padding: 30px;
        }

        li > a {
            color: #2d2d2d;
        }
        a {
            text-decoration: none;
        }
        span {
            color: rgb(128, 128, 128);
        }
        table {
            margin-top: 50px;
            width: 700px;
            height: 400px;
            text-align: center;
        }
        .btn {
            padding: 70px 0 0 250px;
        }

        .btn  button {
            border: none;
            border-radius: 7px;
            cursor: pointer;
            color: #f3f3f3;
            width: 100px;
            height: 30px;
            background: #575757;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 0.7em;
        }
        #emailMessage,
        #passwordMessage {
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
<%
    // 세션에서 사용자 아이디 가져오기
    String userId = (String) session.getAttribute("userId");
    String userEmail = "";

    DBConnPool dbPool = new DBConnPool();
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // DBConnPool을 통해 데이터베이스 연결
        con = dbPool.getConnection();

        // 이메일 조회 쿼리
        String query = "SELECT email FROM custom WHERE user_id = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            userEmail = rs.getString("email"); // 여기를 수정
        }
    } catch (Exception e) {
        Logger.error("이메일 조회 중 에러", e);
    } finally {
        dbPool.close(); // DBConnPool의 close 메서드를 사용하여 자원 반납
    }
%>

<h1>
    <a href="<c:url value='/index.do'/>">Super Hero Story</a>
</h1>
<div class="mypage">
    <div class="nav">
        <ul>
            <li>회원정보</li>
            <li><a href="<c:url value='/member/mypage.do?action=Order'/>">주문내역</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=QnA'/>">나의 문의내역</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=Review'/>">나의 후기</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=Shopping'/>">장바구니</a></li>
        </ul>
    </div>
    <form class="info">
        <table>
            <tr>
                <th>내 아이디</th>
                <th><%= session.getAttribute("userId") %></th>
            </tr>
            <tr>
                <th>내 이메일</th>
                <th><%= userEmail %> </th>
            </tr>
                <tr>
                    <th>새 이메일</th>
                    <td><input type="email" id="newEmail" placeholder="새 이메일" autocomplete="email"><div id="emailMessage"></div></td>

                </tr>
                <tr>
                    <th>새 비밀번호</th>
                    <td><input type="password" id="newPassword" placeholder="새 비밀번호" autocomplete="new_password"><div id="passwordMessage"></div></td>
                </tr>
                <tr>
                    <th></th>
                    <th><input type="password" id="confirmNewPassword" placeholder="새 비밀번호 확인" autocomplete="new_password"></th>
                </tr>
        </table>
        <div class="btn">
            <button onclick="updateInformation()">정보 변경</button>
        </div>
    </form>
    </div>
<script>

    async function updateInformation() {
        const newPassword = document.getElementById('newPassword').value;
        const confirmNewPassword = document.getElementById('confirmNewPassword').value;
        const newEmail = document.getElementById('newEmail').value;
        let isValid = true;
        let formData = '';

        if (newPassword) {
            if (!validatePassword(newPassword)) {
                document.getElementById('passwordMessage').innerText = '비밀번호 형식이 잘못되었습니다.';
                document.getElementById('passwordMessage').style.color = 'red';
                isValid = false;
            } else if (newPassword !== confirmNewPassword) {
                document.getElementById('passwordMessage').innerText = '비밀번호가 일치하지 않습니다.';
                document.getElementById('passwordMessage').style.color = 'red';
                console.log(newPassword !== confirmNewPassword)
                isValid = false;
            } else {
                const hashedNewPassword = await sha256(newPassword);
                formData += "newPassword=" + hashedNewPassword;
            }
        }

        if (newEmail) {
            if (!validateEmail(newEmail)) {
                document.getElementById('emailMessage').innerText = '이메일 형식이 잘못되었습니다.';
                document.getElementById('emailMessage').style.color = 'red';
                isValid = false;
            } else {
                if (formData.length > 0) formData += '&';
                formData += "newEmail=" + newEmail;
            }
        }

        // AJAX 요청으로 서버에 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/member/inform.do", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(formData);

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert(xhr.responseText);
            }
        }
    }

    function validatePassword(password) {
        return /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*[!@#$%^&*()\-_=+{};:,<.>]).{4,}$/.test(password);
    }

    function validateEmail(email) {
        return /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(email);
    }

    async function sha256(str) {
        const buffer = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(str));
        return Array.prototype.map.call(new Uint8Array(buffer), x => ('00' + x.toString(16)).slice(-2)).join('');
    }

</script>
</body>
</html>
