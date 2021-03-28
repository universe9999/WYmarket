package com.kgitbank.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.mapper.ChattingMapper;
import com.kgitbank.model.ChattingVO;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	ChattingMapper chat_mapper;
	
	
	@Override
	public void createChatInfo(ChattingVO vo) {
	
		 int roomID = vo.getRoomId();
		 String buyerName = vo.getBuyerName();
		 String sellerName = vo.getSellerName();
		 String item = vo.getItem();
		 int price = vo.getPrice();
	
		 chat_mapper.createChatInfo(vo);

	}


	@Override
	public List<ChattingVO> selectSellerName(String sellerName) {
		 
		return chat_mapper.selectSellerName(sellerName);
	}


	 


	@Override
	public int selectRoomId(int roomId) {
		 
		return chat_mapper.selectRoomId(roomId);
	}


	@Override
	public List<ChattingVO> selectBuyerName(String sellerName) {
		return chat_mapper.selectBuyerName(sellerName);
	}


	  
	 
	@Override
	public int updateSellerCount(int roomId) {
		// TODO Auto-generated method stub
		return chat_mapper.updateSellerCount(roomId);
	}
	 
	@Override
	public int updateBuyerCount(int roomId) {
		// TODO Auto-generated method stub
		return chat_mapper.updateBuyerCount(roomId);
	}


	@Override
	public int updateChatInfo(int roomId) {
		// TODO Auto-generated method stub
		return chat_mapper.updateChatInfo(roomId);
	}


	@Override
	public int resetSellerCount(int roomId) {
		return chat_mapper.resetSellerCount(roomId);
	}


	@Override
	public int resetBuyerCount(int roomId) {
		return chat_mapper.resetBuyerCount(roomId);
	}


	@Override
	public int resetCountAll() {
		return chat_mapper.resetCountAll();
	}


	@Override
	public int deleteChat(int roomId) {
		return chat_mapper.deleteChat(roomId);
	}

	 
	 

}
