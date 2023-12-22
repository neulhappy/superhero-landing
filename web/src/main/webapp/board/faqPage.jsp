<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/faqpagestyle.css"/>
</head>
<body>

<div id="wrap">
<header id="header">
    <h1><img src="../img/faqlogo.png"></h1>
</header>

<div class="container">
<main id="main">
    <div role="tabpanel">
        <!-- List group -->
        <div class="list-group" id="myList" role="tablist">
            <a class="list-group-item list-group-item-action active" data-bs-toggle="list" href="#home" role="tab">[공지] 작성시 주의사항</a>
            <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#profile" role="tab">[공지] 문의 방법</a>
            <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#messages" role="tab">[공지] 상품문의 관련 공지</a>
            <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#settings" role="tab">[공지] 오류해결</a>
        </div>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="home" role="tabpanel">
                <p style="font-size: 1.2rem; color: black; background: #ddd; padding: 50px;" >
                    1. 로그인 후 이용 가능합니다.<br>
                    2. 제목과 글 내용 모두 작성해주세요. <br>
                    3. 욕설이나 비방이 들어간 내용은 삭제 될 수 있으니 유의 바랍니다.
                </p>
            </div>
            <div class="tab-pane" id="profile" role="tabpanel">
                <p style="font-size: 1.2rem; color: black; background: #ddd; padding: 50px;" >
                    1. 문의가 필요한 부분을 구체적으로 작성해주세요.<br>
                    2. 특정 상품에 대한 문의는 제품 이름을 꼭 명시해주시기 바랍니다. <br>
                    3. 전화 문의는 000-0000-0000 으로 연락 부탁드립니다.
                </p>
            </div>
            <div class="tab-pane" id="messages" role="tabpanel">
                <p style="font-size: 1.2rem; color: black; background: #ddd; padding: 50px;" >
                    1. 문의에 대한 답변은 2-3일 정도 소요될 수 있습니다.<br>
                    2. 구매한 상품에 대한 환불 문의는 사진과 함께 첨부 바랍니다. <br>
                    3. 상품에 대한 평가 내용은 FAQ 게시판이 아닌 상품후기 게시판을 이용해주세요.
                </p>
            </div>
            <div class="tab-pane" id="settings" role="tabpanel">
                <p style="font-size: 1.2rem; color: black; background: #ddd; padding: 50px;" >
                    금일 발생 되었던 사이트 접속 오류는 해결되었습니다.<br>
                    이용에 불편을 드려서 죄송합니다.
                </p>
            </div>
        </div>
    </div>

</main>


<jsp:include page="faqPage_grid.jsp"/>
</div>

<footer>
<jsp:include page="../include/Footer.jsp"/>
</footer>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>