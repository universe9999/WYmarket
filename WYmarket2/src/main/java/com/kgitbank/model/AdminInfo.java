package com.kgitbank.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AdminInfo {

	private String phoneNumber;
	private String adminNick;
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date adminCreateDate;
	private String adminGrade;
	private String adminMemo;
	
}
