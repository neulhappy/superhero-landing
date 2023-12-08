<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pge</title>
    <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

    <script src="/js/tui-grid.js"></script>
    <link rel="stylesheet" href="/css/tui-grid.css" type="text/css">
</head>
<script>

    window.onload = function(){
        $.ajax({
            url : "/preBoard/getPreBoardList",
            method :"GET",
            dataType : "JSON",
            success : function(result){
                grid.resetData(result);
            }
        });
        var grid = new tui.Grid({
            el: document.getElementById('grid'),
            scrollX: false,
            scrollY: false,
            columns: [
                {
                    header: 'boardNum',
                    name: 'boardNum',
                },
                {
                    header: 'spaceName',
                    name: 'spaceName',
                },
                {
                    header: 'Category',
                    name: 'Category'
                },
                {
                    header: 'price',
                    name: 'price'
                },
                {
                    header: 'regDate',
                    name: 'regDate',
                }
            ]
        });
    };
</script>
<body>
<div id="grid"></div>

</body>
</html>