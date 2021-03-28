package com.kgitbank.model;

import java.util.Date;

import lombok.Data;

@Data
public class WithdrawalVO {

	private int withdrawalID;
	private String userNick;
	private String ncontent;
	private String kakaoMail;
	private String phoneNumber;
	private Date banDate;
	private String reSignUp;

}
