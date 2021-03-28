package com.kgitbank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.UserInfo;
import com.kgitbank.model.WithdrawalVO;

public interface UserMapper {
	
	public int insertUser(UserInfo userInfo);
	
	public int selectKakaoMail(String mail);

	public void deleteUserInfo(String userNick);
 
	public void insertWithdrawal(@Param("userNick") String userNick,@Param("ncontent")String ncontent,
			@Param("phoneNumber") String phoneNumber,@Param("kakaoMail") String kakaoMail);
	
	public List<WithdrawalVO> selectWithdrawal();//계정 사유 조회

}
