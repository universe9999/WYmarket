package com.kgitbank.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserIP {

	private String ip;
	private int smsCnt;
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date smsExceedDate;
	
}
