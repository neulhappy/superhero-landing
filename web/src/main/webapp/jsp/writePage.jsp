<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-12-14
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>

    <!-- Editor's Style -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/writepagestyle.css">
</head>

<body>

<h1>게시글 작성</h1>
    <form name="writeFrm" method="post" action="WriteProcess.jsp" onsubmit="return validateForm(this)">
        <table border="1" style="width: 100%; min-height: 50px;">
            <tr>
                <td style="text-align: center; font-size: 1.6rem; font-weight: 700">제목</td>
                <td style="border: 0.5px solid black"><input type="text" name="title" style="width: 90%; height: 40px;" placeholder="제목을 입력해주세요"/></td>
            </tr>
        </table>

<!-- 에디터를 적용할 요소 (컨테이너) -->
<div id="content">
</div>

<div class="btn">
    <input type="button" class="btn btn-light" value="임시저장" onclick="location.href='../jsp/CommunityPage.jsp'"/>
    <input type="button" class="btn btn-dark" value="발행" onclick="location.href='../jsp/CommunityPage.jsp'"/>
</div>


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
        function validateForm(form){
            if(!form.title.value){
                alert("제목을 입력 하세요");
                form.title.focus();
                return false;
            }
        }
    </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossOrigin="anonymous"></script>
</form>
</body>
</html>
