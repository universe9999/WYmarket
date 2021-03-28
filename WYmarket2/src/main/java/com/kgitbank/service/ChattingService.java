package com.kgitbank.service;

import java.util.List;

import com.kgitbank.model.ChattingVO;

public interface ChattingService {

	public void createChatInfo(ChattingVO vo);	
	
	public List<ChattingVO> selectSellerName(String sellerName);
	public List<ChattingVO> selectBuyerName(String sellerName);
	
	public int updateChatInfo(int roomId); 
	
	public int selectRoomId(int roomId);

	public int updateSellerCount(int roomId);

	public int updateBuyerCount(int roomId);
	
	public int resetSellerCount(int roomId);
	public int resetBuyerCount(int roomId);
	public int resetCountAll();
	public int deleteChat(int roomId);
}
