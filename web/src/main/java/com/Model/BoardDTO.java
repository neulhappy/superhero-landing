package com.Model;

import java.sql.Date;

public class BoardDTO {

    private int num;
    private String title;
    private int ID;
    private int visitcount;
    private Date postdate;
    private Date lastchanged;
    //    이하 boarddetail테이블
    private int linkedprodid;

}
