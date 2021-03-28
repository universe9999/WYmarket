package com.kgitbank.service;

import java.text.SimpleDateFormat;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kgitbank.mapper.breakdownMapper;
import com.kgitbank.model.Pageination;
import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.ShUserInfoVO;


@Service
public class BreakdownService implements IBreakdownService {
		
	String onsale = "Onsale";
		
	@Autowired
	breakdownMapper break_mapper;
	
	@Override
	public List<ShItemVO> getShitemVO(String usernick) {
		return break_mapper.getShitemVO(usernick);		
	}
	
	@Override
	public List<ShUserInfoVO> getShuserInfo() {
		return break_mapper.getShuserInfo();
	}
	
	@Override
	public List<PurchasedetailsVO> getSellerPhVO(String usernick) {
		return break_mapper.getSellerPhVO(usernick);
	}

	@Override
	public List<PurchasedetailsVO> getPurchaserPhVO(String usernick) {
		return break_mapper.getPurchaserPhVO(usernick);
	}
	
	
	
	@Override
	public int completedIstate(String istate, String ititle, String usernick, String itemid) {	
		return break_mapper.completedIstate(istate, ititle, usernick, itemid);
	}
	
	@Override
	public int hiddenIstate(String istate, String ititle, String usernick, String itemid) {
		return break_mapper.hiddenIstate(istate, ititle, usernick, itemid);
	}

	@Override
	public int reservationStateChange(String iReservationState, String ititle, String usernick, String itemid) {
		return break_mapper.reservationStateChange(iReservationState, ititle, onsale, usernick, itemid);
	}
	
	@Override
	public int insertPurchase(PurchasedetailsVO pvo, String purchaser , String usernick,  String ititle, String istate, String itemid) {	
		return break_mapper.insertPurchase(pvo, purchaser, usernick, ititle, istate, itemid);
	}


	@Override
	public int productPullUp(String ititle, String usernick, String istate, String itemid) {
		return break_mapper.productPullUp(ititle, usernick, istate, itemid);
	}

	@Override
	public int productDelete(String ititle, String usernick, String istate, String itemid) {
		return break_mapper.productDelete(ititle, usernick, istate, itemid);
	}

	@Override
	public int purchasedetailsCount(String usernick) {
		return break_mapper.purchasedetailsCount(usernick);
	}

	@Override
	public int getShuserInfoCdate(String usernick) {
		return break_mapper.getShuserInfoCdate(usernick);
	}

	@Override
	public int shitemVOCount(String usernick) {
		return break_mapper.shitemVOCount(usernick);
	}

	@Override
	public List<ShItemVO> getUserItemList(Pageination paging) {	
		return break_mapper.getUserItemList(paging);
	}

	@Override
	public int getCount(String usernick) {
		return break_mapper.getCount(usernick);
	}

	@Override
	public int updateUserInfoNick(String modiyusernick, String usernick) {
		return break_mapper.updateUserInfoNick(modiyusernick, usernick);
	}

	@Override
	public int updateUserItemNick(String modiyusernick, String usernick) {
		return break_mapper.updateUserItemNick(modiyusernick, usernick);
	}

	@Override
	public List<ShItemVO> searchUserItemList(Pageination paging) {
		return break_mapper.searchUserItemList(paging);
	}

	@Override
	public int searchCount(Pageination paging) {
		return break_mapper.searchCount(paging);
	}

	@Override
	public List<ShItemVO> selectStateCategory(Pageination paging) {
		return break_mapper.selectStateCategory(paging);
	}

	


	

	



	






	
	
	
	

}
