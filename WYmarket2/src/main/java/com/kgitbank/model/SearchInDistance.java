package com.kgitbank.model;

import java.util.Date;

import lombok.Data;

@Data
public class SearchInDistance {

	private Integer itemID;
	private String simagePath;
	private String userNick;
	private String address;
	private Integer manner;
	private String stitle;
	private String scategory;
	private Date refreshTime;
	private String scontent;
	private Integer price;
	private Integer chatCnt;
	private Integer likeCnt;
	private Integer viewCnt;
	private String sstate;
	private String sreservationState;
	
}
