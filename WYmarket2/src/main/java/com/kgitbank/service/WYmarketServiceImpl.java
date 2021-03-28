package com.kgitbank.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.mapper.WYmarketMapper;
import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.Inquiry;
import com.kgitbank.model.InquiryAdminToUser;
import com.kgitbank.model.Pagination;
import com.kgitbank.model.SearchInDistance;
import com.kgitbank.model.UserInfo;

@Service
public class WYmarketServiceImpl implements WYmarketService{

	@Autowired
	private WYmarketMapper wyMarketMapper;

	@Override
	public int selectphonenumber(String phoneNumber) {
		return wyMarketMapper.selectphonenumber(phoneNumber);
	}

	@Override
	public int selectusernick(String userNick) {
		return wyMarketMapper.selectusernick(userNick);
	}

	@Override
	public int insertUserPhNk(UserInfo userInfo) {
		return wyMarketMapper.insertUserPhNk(userInfo);
	}

	@Override
	public String getUserNickByPh(String phoneNumber) {
		return wyMarketMapper.getUserNickByPh(phoneNumber);
	}

	@Override
	public String getUserNickByMail(String mail) {
		return wyMarketMapper.getUserNickByMail(mail);
	}

	@Override
	public int getIpCnt(String ip) {
		return wyMarketMapper.getIpCnt(ip);
	}

	@Override
	public int insertIp(String ip) {
		return wyMarketMapper.insertIp(ip);
	}

	@Override
	public int updateIpCnt(String ip) {
		return wyMarketMapper.updateIpCnt(ip);
	}

	@Override
	public int getSmsCnt(String ip) {
		return wyMarketMapper.getSmsCnt(ip);
	}

	@Override
	public int insertSmsExceedDate(String ip) {
		return wyMarketMapper.insertSmsExceedDate(ip);
	}

	@Override
	public Date getSmsExceedDate(String ip) {
		return wyMarketMapper.getSmsExceedDate(ip);
	}

	@Override
	public int updateSmsExceedDate(String ip) {
		return wyMarketMapper.updateSmsExceedDate(ip);
	}

	@Override
	public int getAdminPhCount(String phoneNumber) {
		return wyMarketMapper.getAdminPhCount(phoneNumber);
	}

	@Override
	public Map<String, Object> getAdminInfo(String phoneNumber) {
		return wyMarketMapper.getAdminInfo(phoneNumber);
	}

	@Override
	public int updateAdminMemo(AdminInfo adminInfo) {
		return wyMarketMapper.updateAdminMemo(adminInfo);
	}

	@Override
	public String selectAdminMemo(AdminInfo adminInfo) {
		return wyMarketMapper.selectAdminMemo(adminInfo);
	}

	@Override
	public List<Map<String, Object>> selectUserList(Pagination pagination) {
		return wyMarketMapper.selectUserList(pagination);
	}

	@Override
	public int selectUserCount() {
		return wyMarketMapper.selectUserCount();
	}


	@Override
	public List<UserInfo> selectUserById(Pagination page) {
		return wyMarketMapper.selectUserById(page);
	}

	@Override
	public List<UserInfo> selectUserByNick(Pagination page) {
		return wyMarketMapper.selectUserByNick(page);
	}

	@Override
	public List<UserInfo> selectUserByAddress(Pagination page) {
		return wyMarketMapper.selectUserByAddress(page);
	}

	@Override
	public int updateUserBan(String userNick) {
		return wyMarketMapper.updateUserBan(userNick);
	}

	@Override
	public UserInfo selectUserInfo(String phoneNumber) {
		return wyMarketMapper.selectUserInfo(phoneNumber);
	}

	@Override
	public AdminInfo getAdminInfo2() {
		return wyMarketMapper.getAdminInfo2();
	}

	@Override
	public int selectUserCountId(String search) {		
		return wyMarketMapper.selectUserCountId(search);
	}

	@Override
	public int selectUserCountNick(String search) {
		return wyMarketMapper.selectUserCountNick(search);
	}

	@Override
	public int selectUserCountAddress(String search) {
		return wyMarketMapper.selectUserCountAddress(search);
	}

	@Override
	public int updateUserUnBan(String userNick) {
		return wyMarketMapper.updateUserUnBan(userNick);
	}

	@Override
	public String selectUserBan(String userNick) {
		return wyMarketMapper.selectUserBan(userNick);
	}

	@Override
	public int updateUserCountTotal(int userAccessCount) {
		return wyMarketMapper.updateUserCountTotal(userAccessCount);
	}

	@Override
	public int selectUserCountTotal() {
		return wyMarketMapper.selectUserCountTotal();
	}

	@Override
	public int insertUserAccessDate(String userNick) {
		return wyMarketMapper.insertUserAccessDate(userNick);
	}

	@Override
	public int selectUserAccessCount(String userNick) {
		return wyMarketMapper.selectUserAccessCount(userNick);
	}

	@Override
	public Date selectUserAccessDate(String userNick) {
		return wyMarketMapper.selectUserAccessDate(userNick);
	}

	@Override
	public int selectAccessCount() {
		return wyMarketMapper.selectAccessCount();
	}

	@Override
	public int selectAccessCountByDate(String totalDate) {
		return wyMarketMapper.selectAccessCountByDate(totalDate);
	}

	@Override
	public List<UserInfo> selectUserByAccessDate(Pagination page) {
		return wyMarketMapper.selectUserByAccessDate(page);
	}

	@Override
	public UserInfo selectUserInfoByMail(String mail) {
		return wyMarketMapper.selectUserInfoByMail(mail);
	}

	@Override
	public int selectSignupCountByDate(String totalDate) {
		return wyMarketMapper.selectSignupCountByDate(totalDate);
	}

	@Override
	public List<UserInfo> selectUserBySignupDate(Pagination page) {
		return wyMarketMapper.selectUserBySignupDate(page);
	}

	@Override
	public int selectIdByUserNick(String userNick) {
		return wyMarketMapper.selectIdByUserNick(userNick);
	}

	@Override
	public List<String> selectUserNickFromItem() {
		return wyMarketMapper.selectUserNickFromItem();
	}

	@Override
	public UserInfo selectLatLong(String userNick) {
		return wyMarketMapper.selectLatLong(userNick);
	}

	@Override
	public int selectCountFromItem() {
		return wyMarketMapper.selectCountFromItem();
	}

	@Override
	public int insertInquiryInfo(Inquiry inquiry) {
		return wyMarketMapper.insertInquiryInfo(inquiry);
	}

	@Override
	public List<Inquiry> selectInquiryInfo() {
		return wyMarketMapper.selectInquiryInfo();
	}

	@Override
	public int updateInquiryCountTotal() {
		return wyMarketMapper.updateInquiryCountTotal();
	}

	@Override
	public int selectInquiryCountTotal() {
		return wyMarketMapper.selectInquiryCountTotal();
	}

	@Override
	public int resetInquiryCountTotal() {
		return wyMarketMapper.resetInquiryCountTotal();
	}

	@Override
	public int insertInquiryAdminToUser(InquiryAdminToUser inquiryAdminToUser) {
		return wyMarketMapper.insertInquiryAdminToUser(inquiryAdminToUser);
	}

	@Override
	public List<InquiryAdminToUser> selectInquiryAdminToUser() {
		return wyMarketMapper.selectInquiryAdminToUser();
	}

	@Override
	public InquiryAdminToUser selectInquiryAdminToUserByID(int inquiryID) {
		return wyMarketMapper.selectInquiryAdminToUserByID(inquiryID);
	}

	@Override
	public Inquiry selectInquiryByID(int inquiryID) {
		return wyMarketMapper.selectInquiryByID(inquiryID);
	}

	@Override
	public List<InquiryAdminToUser> selectInquiryAdminToUserByUserNick(String userNick) {
		return wyMarketMapper.selectInquiryAdminToUserByUserNick(userNick);
	}

	@Override
	public List<Inquiry> selectInquiryByUserNick(String userNick) {
		return wyMarketMapper.selectInquiryByUserNick(userNick);
	}

	@Override
	public int updateInquiryUserCountTotal() {
		return wyMarketMapper.updateInquiryUserCountTotal();
	}

	@Override
	public int selectInquiryUserCountTotal() {
		return wyMarketMapper.selectInquiryUserCountTotal();
	}

	@Override
	public int resetInquiryUserCountTotal() {
		return wyMarketMapper.resetInquiryUserCountTotal();
	}

	@Override
	public int deleteSearchInDistance() {
		return wyMarketMapper.deleteSearchInDistance();
	}
	
	@Override
	public int insertSearchInDistance(GoodsVO goodsVo) {
		return wyMarketMapper.insertSearchInDistance(goodsVo);
	}

	@Override
	public List<SearchInDistance> selectSearchInDistance() {
		return wyMarketMapper.selectSearchInDistance();
	}
	
	@Override
	public List<SearchInDistance> selectSearchGoods(String search) {
		return wyMarketMapper.selectSearchGoods(search);
	}

	@Override
	public List<SearchInDistance> selectCategoryGoods(String category) {
		return wyMarketMapper.selectCategoryGoods(category);
	}

	@Override
	public int selectMaxInquiryAdminToUserByID() {
		return wyMarketMapper.selectMaxInquiryAdminToUserByID();
	}

	@Override
	public int updateLatLonAddress(UserInfo userInfo) {
		return wyMarketMapper.updateLatLonAddress(userInfo);
	}

	@Override
	public UserInfo selectUserInfoByUserNick(String userNick) {
		return wyMarketMapper.selectUserInfoByUserNick(userNick);
	}

	@Override
	public int updateAddressFromItem(UserInfo userInfo) {
		return wyMarketMapper.updateAddressFromItem(userInfo);
	}

	@Override
	public int updateAddressFromSearchInDistance(UserInfo userInfo) {
		return wyMarketMapper.updateAddressFromSearchInDistance(userInfo);
	}

	@Override
	public SearchInDistance selectSearchInDistanceById(int itemID) {
		return wyMarketMapper.selectSearchInDistanceById(itemID);
	}

	@Override
	public List<GoodsVO> selectItemByUserNick(String userNick) {
		return wyMarketMapper.selectItemByUserNick(userNick);
	}

	@Override
	public List<GoodsVO> selectItemByUserNickSearch(String userNick, String search) {
		return wyMarketMapper.selectItemByUserNickSearch(userNick, search);
	}

	@Override
	public List<GoodsVO> selectItemByUserNickCategory(String userNick, String category) {
		return wyMarketMapper.selectItemByUserNickCategory(userNick, category);
	}

	@Override
	public int selectCountFromWithdrawByPhoneNumber(String phoneNumber) {
		return wyMarketMapper.selectCountFromWithdrawByPhoneNumber(phoneNumber);
	}

	@Override
	public int selectCountFromWithdrawByKakaoMail(String kakaoMail) {
		return wyMarketMapper.selectCountFromWithdrawByKakaoMail(kakaoMail);
	}

	@Override
	public Date selectBanDateByPhoneNumber(String phoneNumber) {
		return wyMarketMapper.selectBanDateByPhoneNumber(phoneNumber);
	}

	@Override
	public int deleteWithdrawalByPhoneNumber(String phoneNumber) {
		return wyMarketMapper.deleteWithdrawalByPhoneNumber(phoneNumber);
	}

	@Override
	public String selectReSignUpByPhoneNumberAndMaxDate(String phoneNumber) {
		return wyMarketMapper.selectReSignUpByPhoneNumberAndMaxDate(phoneNumber);
	}

	@Override
	public String selectReSignUpByPhoneNumber(String phoneNumber) {
		return wyMarketMapper.selectReSignUpByPhoneNumber(phoneNumber);
	}

	@Override
	public int updateReSignUpByPhoneNumber(String phoneNumber) {
		return wyMarketMapper.updateReSignUpByPhoneNumber(phoneNumber);
	}

	@Override
	public int updateReSignUpByPhoneNumberAndMaxDate(String phoneNumber) {
		return wyMarketMapper.updateReSignUpByPhoneNumberAndMaxDate(phoneNumber);
	}

	@Override
	public String selectReSignUpByMail(String kakaoMail) {
		return wyMarketMapper.selectReSignUpByMail(kakaoMail);
	}

	@Override
	public String selectReSignUpByMailAndMaxDate(String kakaoMail) {
		return wyMarketMapper.selectReSignUpByMailAndMaxDate(kakaoMail);
	}

	@Override
	public int updateReSignUpByMail(String kakaoMail) {
		return wyMarketMapper.updateReSignUpByMail(kakaoMail);
	}

	@Override
	public int updateReSignUpByMailAndMaxDate(String kakaoMail) {
		return wyMarketMapper.updateReSignUpByMailAndMaxDate(kakaoMail);
	}

	@Override
	public Date selectBanDateByMail(String kakaoMail) {
		return wyMarketMapper.selectBanDateByMail(kakaoMail);
	}

}

