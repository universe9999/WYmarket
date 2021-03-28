package com.kgitbank.model;

import java.util.Date;

import lombok.Data;

@Data
public class ChattingVO {
	
	private int chatId;
	private int roomId;
	private String buyerName;
	private String sellerName;
	private String item;
	private int price;
	private Date chatDate;
	private int buyerCount;
	private int sellerCount;
 

	 
}
