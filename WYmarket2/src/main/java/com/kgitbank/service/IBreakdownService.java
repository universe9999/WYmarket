package com.kgitbank.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.Pageination;
import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.ShUserInfoVO;

public interface IBreakdownService {

	List<ShUserInfoVO> getShuserInfo();
	
	List<ShItemVO>  getShitemVO(String usernick);
	
	List<ShItemVO> getUserItemList(Pageination paging);
	
	List<ShItemVO> searchUserItemList(Pageination paging);
	
	List<ShItemVO> selectStateCategory(Pageination paging);
	
	List<PurchasedetailsVO> getPurchaserPhVO(String usernick);
	
	List<PurchasedetailsVO> getSellerPhVO(String usernick);
	
	int searchCount(Pageination paging);
	
	int completedIstate(String istate, String ititle, String usernick, String itemid);
	
	int hiddenIstate(String istate, String ititle, String usernick, String itemid);
	
	int reservationStateChange(String iReservationState, String ititle, String usernick, String itemid);
			
	int insertPurchase(PurchasedetailsVO pvo,String purchaser, String usernick, String ititle, String istate, String itemid);

	int productPullUp(String ititle, String usernick,String istate, String itemid);
	
	int productDelete(String ititle, String usernick,String istate, String itemid);
	
	int purchasedetailsCount(String usernick);
	
	int shitemVOCount(String usernick);
	
	int getCount(String usernick);
	
	int getShuserInfoCdate(String usernick);
	
	int updateUserInfoNick(String modiyusernick, String usernick);
	
	int updateUserItemNick(String modiyusernick, String usernick);
	

}
