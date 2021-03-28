package com.kgitbank.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kgitbank.mapper.UserMapper;
import com.kgitbank.model.User;
import com.kgitbank.model.UserInfo;
import com.kgitbank.model.WithdrawalVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper user_mapper;
	
	@Override
	public int insertUser(UserInfo userInfo) {
		return user_mapper.insertUser(userInfo);
	}

	@Override
	public int selectKakaoMail(String mail) {
		 
		return user_mapper.selectKakaoMail(mail);
	}

	@Override
	public void deleteUserInfo(String userNick) {
		user_mapper.deleteUserInfo(userNick);
		
	}

	 

	@Override
	public void insertWithdrawal(String userNick, String ncontent, String phoneNumber, String kakaoMail) {
		user_mapper.insertWithdrawal(userNick,ncontent,phoneNumber,kakaoMail);
		
	}

	@Override
	public List<WithdrawalVO> selectWithdrawal() {
		return user_mapper.selectWithdrawal();
	}
 



}
