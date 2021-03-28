package com.kgitbank.model;

import lombok.Data;

@Data
public class PurchasedetailsVO {


	
	private Integer itemid;
	private String iimagepath;
	private String purchaser;
	private String usernick; 
	private String address; 
	private String ititle;	
	
	private Integer refreshTime;
	private Integer price;
	private Integer chatcnt;
	private Integer likecnt;
	private Integer viewcnt;

	
	
	
}



