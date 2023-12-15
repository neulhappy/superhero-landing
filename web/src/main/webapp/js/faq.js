const triggerTabList = document.querySelectorAll('#myTab a')
triggerTabList.forEach(triggerEl => {
    const tabTrigger = new bootstrap.Tab(triggerEl)

    triggerEl.addEventListener('click', event => {
        event.preventDefault()
        tabTrigger.show()
    })
})

const initGrid = () => {
    // 그리드 객체
    const Grid = tui.Grid;

    /**
     * Grid 테마 커스텀
     * Grid.applyTheme('striped', {...}) :
     * @param {String} default : 프리셋 (기본)
     * @param {String} striped : 프리셋 (줄무늬)
     * @param {String} clean : 프리셋 (클린)
     *      - preset theme name. Available values are 'default', 'striped' and 'clean'.
     *      - https://nhn.github.io/tui.grid/latest/Grid#applyTheme
     */
    Grid.applyTheme('defualt',  {
        cell: {
            normal: {
                border: '#ddd'
            },
            header: {
                background: 'skyblue',
                text: 'white'
            },
            evenRow: {
                background: '#d9eceb'
            }
        }
    });

    /**
     * 그리드 설정
     * @variable {Dom} el : 그리드 element(DOM)
     * @variable {boolean} scrollX : X 스크롤 사용여부
     * @variable {boolean} scrollY : Y 스크롤 사용여부
     * @variable {boolean} draggable : 드레그 사용 여부
     * @variable {Object} header
     *      - @variable {Number} height : 헤더 높이
     * @variable {Number} bodyHeight : 그리드 바디 높이
     * @variable {*} contextMenu : 마우스 우클릭 옵션
     * @variable {Array} columns :
     *      - @variable {String} header : 컬럼명(헤더)
     *      - @variable {String} name : 컬럼 name (input data와 이름이 일치해야함)
     *      - @variable {String} align : 정렬
     *      - @variable {Number} width : 너비
     *      - @variable {String} whiteSpace : 줄바꿈 설정
     *      - @variable {Function} formatter : 출력 포멧
     * 기타 옵션은 공식 document를 참조하자.
     */

    const sampleGrid = new Grid({
        el: document.getElementById('gridDiv'),
        scrollX: false,
        scrollY: false,
        draggable: false,
        header: { height: 30 },
        bodyHeight: 500,
        contextMenu: null,
        columns: [
            {
                header: '번호',
                name: 'num',
                align: "center",
                width: 100,
                whiteSpace: 'normal',
                formatter: function (e) {
                    return e.value
                },
            },
            {
                header: '날짜',
                name: 'date',
                align: "center",
                width: 200,
                whiteSpace: 'normal',
                formatter: function (e) {
                    return e.value
                },
            },
            {
                header: '상품문의',
                name: 'title',
                align: "left",
                width: 1200,
                whiteSpace: 'normal',
                formatter: function (e) {
                    return e.value
                },
            },
            {
                header: '작성자',
                name: 'name',
                align: "center",
                width: 400,
                whiteSpace: 'normal',
                formatter: function (e) {
                    return e.value
                },
            },
        ]
    });

    return sampleGrid;
}

window.onload = () => {
    // 그리드 설정
    const createdGrid = initGrid();

    // 샘플 데이터
    const sampleData = [
        {
            num: 1,
            date: '2022-12-04',
            title: '문의1',
            name: 'ㄱ',
        },
        {
            num: 2,
            date: '2022-12-07',
            title: '문의2',
            name: 'ㄴ',
        },
        {
            num: 3,
            date: '2022-12-12',
            title: '문의3',
            name: 'ㄷ',
        }
    ];

    // 그리드에 데이터 넣기(출력)
    createdGrid.resetData(sampleData);
}