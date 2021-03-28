package com.kgitbank.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kgitbank.service.ChattingService;
 

@Component 
public class ChatDao {

	private List<ChatMessage> chatMessages;
	
	@Autowired
	ChattingService chattingService;
	
	ChatDao(){
		chatMessages = new ArrayList<>();
	}
	
	public void addMessage(int roomId, String writer, String body) {
	 
		int newId=chatMessages.size()+1;
		ChatMessage aChatMessage = new ChatMessage(newId, roomId, writer, body);

		chatMessages.add(aChatMessage);
		
		
		//구매자가 메세지 보낸 카운트 
		List<ChattingVO> buyerList = chattingService.selectBuyerName(aChatMessage.getWriter());
		 for(ChattingVO vo : buyerList) {
			 if(vo.getRoomId()==aChatMessage.getRoomId()) {
				 chattingService.updateBuyerCount(aChatMessage.getRoomId());
			 }
		 }
		 
		 //판매자가 메세지 보낸 카운트
		 List<ChattingVO> sellerList = chattingService.selectSellerName(aChatMessage.getWriter());
		 for(ChattingVO vo : sellerList) {
			 if(vo.getRoomId()==aChatMessage.getRoomId()) {
				 chattingService.updateSellerCount(aChatMessage.getRoomId());
			 }
		 }
		
		if(aChatMessage!=null) {
			 
		}
	}

	public List getMessages() {
		 
		
		return chatMessages;
	}

	public List getMessagesFrom(int roomId, int from) {
		 List<ChatMessage> messages = new ArrayList();
		 for(ChatMessage chatMessage : chatMessages) {
			 if(chatMessage.getRoomId()==roomId && chatMessage.getId() >=from) {
				 messages.add(chatMessage);
			 }
		 } 
		return messages;
	}

	public void clearAllMessages() {
		chatMessages.clear();

		
	}

}
