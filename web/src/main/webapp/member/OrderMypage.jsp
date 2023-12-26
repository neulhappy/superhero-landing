<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>주문내역</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        * {
            text-decoration: none;
            list-style: none;
        }
        body {
            width: 1200px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1.3em;
            line-height: 1.6;
        }

        .mypage {
            display: flex;
            justify-content: space-between;
        }

        h1 {
            padding-left: 100px;
        }

        h1 > a {
            color: black;
        }

        .nav > ul {
            text-align: center;
            width: calc(1200px - 800px);
        }

        .nav > ul > li {
            margin-left: 100px;
            padding: 30px;
        }

        .nav > ul > li > a {
            color: #575757;
        }

        .order {
            margin-top: 30px;
            font-size: 1.1rem;
            width: 800px;

        }

        .order > .title {
            display: flex;
            justify-content: left;
            height: 20px;
            width: 700px;
            background: black;
            border-radius: 4px;
            color: #ffffff;
            padding: 10px 0 15px 30px;
            font-weight: 600;
        }

        table {
            width: 700px;
            height: 300px;
            text-align: center;
        }

        span {
            color: rgb(128, 128, 128);
        }
    </style>
</head>
<body>
<h1>
    <a href="<c:url value='/index.do'/>">Super Hero Story</a>
</h1>
<div class="mypage">
    <div class="nav">
        <ul>
            <li><a href="<c:url value='/member/mypage.do'/>">회원정보</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=Order'/>">주문내역</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=QnA'/>">나의 문의내역</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=Review'/>">나의 후기</a></li>
            <li><a href="<c:url value='/member/mypage.do?action=Shopping'/>">장바구니</a></li>
        </ul>
    </div>
    <div class="order">
        <ul class="title">
            <li>주문내역조회</li>
        </ul>
        <table>
            <thead>
                <tr>
                    <th>주문 번호</th>
                    <th>상품 정보</th>
                    <th>주문 일자</th>
                    <th>주문 상태</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${not empty orderList}">
                    <tbody>
                        <c:forEach items="${orderList}" var="order" varStatus="loop">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.productList[0]} 등 ${order.productList.length} 상품</td>
                                <td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.status == 1}">결제 대기중</c:when>
                                        <c:when test="${order.status == 2}">결제 완료</c:when>
                                        <c:when test="${order.status == 3}">배송 준비중</c:when>
                                        <c:when test="${order.status == 4}">배송중</c:when>
                                        <c:when test="${order.status == 5}">배송 완료</c:when>
                                        <c:otherwise>오류 발생</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </c:when>
                <c:otherwise>
                    <tbody>
                        <tr>
                            <td colspan="4">주문하신 내역이 없습니다.</td>
                        </tr>
                    </tbody>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>
</body>
</html>
