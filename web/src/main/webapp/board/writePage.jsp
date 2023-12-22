<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>

    <!-- Editor's Style -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/writepagestyle.css">
</head>

<body>
<div id="wrap">

    <header id="header">
    <h1>게시글 작성</h1>
        <input type="hidden" name="id" value="${id}">
        <input type="hidden" name="board" value="${board}">
        <input type="hidden" name="content" value="">
    </header>

    <main id="main">
        <form name="writeFrm" method="post" action="<c:url value="/board/write.do?action=write"/>" onsubmit="return validateForm(this)">
            <table border="2" style="width: 100%; min-height: 50px; border-color: black">
                <tr>
                    <td style="text-align: center; font-size: 1.6rem; font-weight: 700; border-bottom: 2px solid black">제목</td>
                    <td style="border: 2px solid black"><input type="text" name="title" style="width: 90%; height: 40px;" placeholder="제목을 입력해주세요"/></td>
            </tr>
            <tr>
                    <td style="text-align: center; font-size: 1.6rem; font-weight: 700; border-bottom: 2px solid black">작성자</td>
                <td style="border: 2px solid black"><input type="text" name="name" style="width: 90%; height: 40px;" placeholder="이름을 입력해주세요"/></td>
            </tr>
            <tr>
                <td style="text-align: center; font-size: 1.4rem; font-weight: 400">작성일</td>
                <td style="border: 2px solid black" name="postdate" style="width: 90%; height: 40px;">
                    <%
                        Date date = new Date();
                        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
                        String strDate = simpleDate.format(date);
                    %>
                    <%=strDate%>
                </td>
            </tr>
        </table>

        <!-- 에디터를 적용할 요소 (컨테이너) -->
        <div id="content"></div>

        <div class="btn">
            <input type="button" class="btn btn-light" value="취소" onclick="history.back()"/>
            <input type="submit" class="btn btn-dark" value="발행"/>
        </div>
        </form>
    </main>

        <!-- TUI 에디터 JS CDN -->
        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
        <script>
            const editor = new toastui.Editor({
                el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
                height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
                initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
                previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
            });
        </script>

        <script type="text/javascript">
            function validateForm(form) {
                document.writeFrm.content.value = editor.getMarkdown();
                if (!form.title.value) {
                    alert("제목을 입력 하세요");
                    form.title.focus();
                    return false;
                }
                if (!form.content.value) {
                    alert("내용을 입력하세요.");
                    document.querySelector('#content').focus();
                    return false;
                }
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                crossOrigin="anonymous"></script>

</div>
</body>
</html>
