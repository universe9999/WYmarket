package com.kgitbank.model;

import java.sql.Timestamp;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ShItemVO {


	
	
	private Integer itemid;
	private String iimagepath;
	private String usernick;
	private String address;
	private Integer manner;
	private String ititle;
	private String icategory;	
	private Integer refreshTime;
	private String icontent;
	private Integer price;
	private Integer chatcnt;
	private Integer likecnt;
	private Integer viewcnt;
	private String istate;
	private String ireservationstate;
	
	
	
}
