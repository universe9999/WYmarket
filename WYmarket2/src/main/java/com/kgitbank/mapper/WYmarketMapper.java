package com.kgitbank.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.Inquiry;
import com.kgitbank.model.InquiryAdminToUser;
import com.kgitbank.model.Pagination;
import com.kgitbank.model.SearchInDistance;
import com.kgitbank.model.UserInfo;

public interface WYmarketMapper {

	int selectphonenumber(String phoneNumber);

	int selectusernick(String userNick);

	int insertUserPhNk(UserInfo userInfo);

	String getUserNickByPh(String phoneNumber);

	String getUserNickByMail(String mail);

	int getIpCnt(String ip);

	int insertIp(String ip);

	int updateIpCnt(String ip);

	int getSmsCnt(String ip);

	int insertSmsExceedDate(String ip);

	Date getSmsExceedDate(String ip);

	int updateSmsExceedDate(String ip);

	int getAdminPhCount(String phoneNumber);

	Map<String, Object> getAdminInfo(String phoneNumber);

	AdminInfo getAdminInfo2();

	int updateAdminMemo(AdminInfo adminInfo);

	String selectAdminMemo(AdminInfo adminInfo);

	int selectUserCount();

	List<Map<String, Object>> selectUserList(Pagination pagination);

	int selectUserCountId(String search);

	int selectUserCountNick(String search);

	int selectUserCountAddress(String search);

	List<UserInfo> selectUserById(Pagination page);

	List<UserInfo> selectUserByNick(Pagination page);

	List<UserInfo> selectUserByAddress(Pagination page);

	UserInfo selectUserInfo(String phoneNumber);

	int updateUserBan(String userNick);

	int updateUserUnBan(String userNick);

	String selectUserBan(String userNick);

	int updateUserCountTotal(int userAccessCount);

	int selectUserCountTotal();

	// 일자별 접속자 insert
	int insertUserAccessDate(String userNick);

	// 닉에 따른 일자별 접속자 행 불러오기
	int selectUserAccessCount(String userNick);

	// 닉에 따른 접속 일자 불러오기
	Date selectUserAccessDate(String userNick);

	// 전체 접속자 행 불러오기
	int selectAccessCount();

	// 접속자 수 검색
	int selectAccessCountByDate(String totalDate);

	// 접속자 정보 검색
	List<UserInfo> selectUserByAccessDate(Pagination page);

	// 메일에 따른 사용자 정보 검색
	UserInfo selectUserInfoByMail(String mail);

	// 가입자 수 검색
	int selectSignupCountByDate(String totalDate);

	List<UserInfo> selectUserBySignupDate(Pagination page);

	int selectIdByUserNick(String userNick);

	List<String> selectUserNickFromItem();

	UserInfo selectLatLong(String userNick);

	int selectCountFromItem();

	int insertInquiryInfo(Inquiry inquiry);

	List<Inquiry> selectInquiryInfo();

	int updateInquiryCountTotal();

	int selectInquiryCountTotal();

	int resetInquiryCountTotal();

	int insertInquiryAdminToUser(InquiryAdminToUser inquiryAdminToUser);

	List<InquiryAdminToUser> selectInquiryAdminToUser();

	InquiryAdminToUser selectInquiryAdminToUserByID(int inquiryID);

	Inquiry selectInquiryByID(int inquiryID);

	List<InquiryAdminToUser> selectInquiryAdminToUserByUserNick(String userNick);

	List<Inquiry> selectInquiryByUserNick(String userNick);

	int updateInquiryUserCountTotal();

	int selectInquiryUserCountTotal();

	int resetInquiryUserCountTotal();

	int deleteSearchInDistance();

	int insertSearchInDistance(GoodsVO goodsVo);

	List<SearchInDistance> selectSearchInDistance();

	public List<SearchInDistance> selectSearchGoods(String search);

	List<SearchInDistance> selectCategoryGoods(String category);

	int selectMaxInquiryAdminToUserByID();

	int updateLatLonAddress(UserInfo userInfo);

	UserInfo selectUserInfoByUserNick(String userNick);

	int updateAddressFromItem(UserInfo userInfo);

	int updateAddressFromSearchInDistance(UserInfo userInfo);

	SearchInDistance selectSearchInDistanceById(int itemID);

	List<GoodsVO> selectItemByUserNick(String userNick);

	List<GoodsVO> selectItemByUserNickSearch(@Param("userNick") String userNick, @Param("search") String search);

	List<GoodsVO> selectItemByUserNickCategory(@Param("userNick") String userNick,
			@Param("icategory") String icategory);

	int selectCountFromWithdrawByPhoneNumber(String phoneNumber);

	int selectCountFromWithdrawByKakaoMail(String kakaoMail);

	Date selectBanDateByPhoneNumber(String phoneNumber);

	int deleteWithdrawalByPhoneNumber(String phoneNumber);

	String selectReSignUpByPhoneNumberAndMaxDate(String phoneNumber);

	String selectReSignUpByPhoneNumber(String phoneNumber);

	int updateReSignUpByPhoneNumber(String phoneNumber);

	int updateReSignUpByPhoneNumberAndMaxDate(String phoneNumber);

	String selectReSignUpByMail(String kakaoMail);

	String selectReSignUpByMailAndMaxDate(String kakaoMail);

	int updateReSignUpByMail(String kakaoMail);

	int updateReSignUpByMailAndMaxDate(String kakaoMail);
	
	Date selectBanDateByMail(String kakaoMail);
}
