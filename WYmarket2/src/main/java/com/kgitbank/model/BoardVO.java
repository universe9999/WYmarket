package com.kgitbank.model;

import java.util.Date;


import lombok.Data;


@Data 
public class BoardVO {
	
	private int noticeID;
	private String ntitle;
	private String ncontent;
	private String adminNick;
	private Date ndate;
	private int nviewcnt;

	@Override
	public String toString() {
		return "BoardVO [noticeID="+noticeID+", nTitle="+ntitle+",nContent="+ncontent+",adminNick="+adminNick
				+",nDate="+ndate+",nViewcnt="+nviewcnt+"]";
	}
	
}
