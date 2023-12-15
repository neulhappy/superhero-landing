package com.board;

import com.util.DBConnPool;
import com.util.Logger;
import com.util.QueryBuilder;

public class BoardDAO extends DBConnPool {


    public int insertWrite(BoardDTO dto) {
        int result = 0;
        String table = ""; // 게시판에 따른 테이블명 선택
        try {
            //쿼리 작성
            String query = QueryBuilder.insertQuery(table + " (num, title, content, author_id)", "?,?,?,?");
            psmt = con.prepareStatement(query);
            psmt = setString(psmt, "seq_" + table + "_num.nextval", dto.getTitle(), dto.getContent(), String.valueOf(dto.getAuthor_id()));
            result = psmt.executeUpdate();
        } catch (Exception e) {
            Logger.error("insertWrite 중 에러 발생");
        }
        return result;
    }
}
