package com.kgitbank.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InquiryAdminToUser implements Serializable{

	private int inquiryID;
	private int userInquiryID;
	private String userNick;
	private String inquiryCategory;
	private String inquiryContent;
	@DateTimeFormat(pattern = "yy/MM/dd HH:mm")
	private Date inquiryDate;
	
}
