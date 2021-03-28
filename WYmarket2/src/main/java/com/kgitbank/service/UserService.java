package com.kgitbank.service;

import java.util.List;

import com.kgitbank.model.UserInfo;
import com.kgitbank.model.WithdrawalVO;

public interface UserService {

	
	public int insertUser(UserInfo userInfo);
	
	public int selectKakaoMail(String mail);
	
	public void deleteUserInfo(String userNick); 
	public void insertWithdrawal(String userNick,String ncontent, String phoneNumber,String kakaoMail);
	public List<WithdrawalVO> selectWithdrawal();
} 
