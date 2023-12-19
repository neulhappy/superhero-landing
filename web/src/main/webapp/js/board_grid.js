//JSP에서 ${boardData}와 ${boardId}정의 필요
const initializeGrid = (boardId) => {
    const Grid = tui.Grid;

    let columns = [];

    // faq게시판
    if (boardId === '1') {
        columns = [
            {header: '번호', name: 'num', align: 'center', width: 100, whiteSpace: 'normal'},
            {header: '제목', name: 'title', align: 'left', width: 1200, whiteSpace: 'normal'},
            {header: '작성자', name: 'name', align: 'center', width: 400, whiteSpace: 'normal'},
            {header: '날짜', name: 'postdate', align: 'center', width: 200, whiteSpace: 'normal'},
        ];
    }
    // review게시판
    else if (boardId === '2') {
        columns = [
            {header: '번호', name: 'num', align: 'center', width: 100, whiteSpace: 'normal'},
            {header: '제목', name: 'title', align: 'left', width: 1200, whiteSpace: 'normal'},
            {header: '작성자', name: 'name', align: 'center', width: 400, whiteSpace: 'normal'},
            {header: '날짜', name: 'postdate', align: 'center', width: 200, whiteSpace: 'normal'},
            // 다른 컬럼 정의
        ];
    }
    const gridOptions = {
        // 그리드 설정
        el: document.getElementById(`gridDiv`), // 각 그리드에 다른 ID 사용
        scrollX: false,
        scrollY: false,
        draggable: false,
        header: {height: 50},
        bodyHeight: 700,
        contextMenu: null,
        columns: columns,
    };

    return new Grid(gridOptions);
};

window.onload = () => {
    // 컨트롤러로부터 board_id 파라미터를 가져옵니다.

    // board_id에 기반한 그리드를 초기화합니다.
    const createdGrid = initializeGrid(boardId);

    // 특정 그리드에 대한 샘플 데이터를 가져옵니다.

    // 특정 그리드에 데이터를 설정합니다.
    createdGrid.resetData(boardList);
};

