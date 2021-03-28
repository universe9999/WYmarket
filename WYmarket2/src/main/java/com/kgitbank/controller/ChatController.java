package com.kgitbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kgitbank.model.ChatMessage;
import com.kgitbank.model.ChattingVO;
import com.kgitbank.model.Room;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.ChatService;
import com.kgitbank.service.ChattingService;



@Controller 
@SessionAttributes({"userNick" })
public class ChatController {
	int count=0;
	UserInfo user;

	@Autowired
	ChatService chatservice;

	@Autowired
	ChattingService chattingService;
	
	 

	//구매자 채팅방 목록
	@RequestMapping("/chats/chatting")
	public String chatting(@ModelAttribute ChattingVO vo,HttpSession session,Model model,String delete) {
		user = (UserInfo) session.getAttribute("user"); 
		 
		if(delete==null) {
			
		}else if(delete.equals("true")) {
			chattingService.deleteChat(vo.getRoomId());
			System.out.println(vo.getRoomId()+"번 방 삭제");
			delete="false";
		} 
		
		if(count==0) { 
			if(vo.getBuyerName()!=null||vo.getSellerName()!=null) {
				if(vo.getBuyerName().equals(user.getUserNick())) {//나가기하면 받은메시지(읽은메시지)삭제
					chattingService.resetSellerCount(vo.getRoomId());
				}else if(vo.getSellerName().equals(user.getUserNick())) {//나가기하면 받은메시지(읽은메시지)삭제
					chattingService.resetBuyerCount(vo.getRoomId());
				}
			}
		}
		count++;
		List<ChattingVO> sellerList = chattingService.selectSellerName(user.getUserNick());
		List<ChattingVO> buyerList = chattingService.selectBuyerName(user.getUserNick());

		model.addAttribute("sellerList",sellerList);
		model.addAttribute("buyerList",buyerList);
		model.addAttribute("userNick",user.getUserNick()); //주의

		return "chats/chatting";
	}
 
 
	//채팅방
	@RequestMapping("/chats/room")
	public String showRoom(@ModelAttribute ChattingVO vo, Model model,HttpSession session,int check) {
		model.addAttribute("vo",vo); 

		count=0;
		user = (UserInfo) session.getAttribute("user"); 
		model.addAttribute("userNick", user.getUserNick()); //주의

		//채팅방 개설 되있는지 확인
		int ch = chattingService.selectRoomId(vo.getRoomId());
		if(ch==0) {
			//개설 안되있으면 개설
			chattingService.createChatInfo(vo);
		}else {
			//개설 되어있으면 시간만 업데이트
			chattingService.updateChatInfo(vo.getRoomId());
		}

		if(check==0) {//방 들어가면 삭제
			chattingService.resetSellerCount(vo.getRoomId());
		}else if (check==1) {//방 들어가면 삭제
			chattingService.resetBuyerCount(vo.getRoomId());
		}


		return "chats/room";
	}

	@RequestMapping("/chats/doClearAllMessages")
	@ResponseBody
	public Map doClearAllMessages() {
		chatservice.clearAllMessages();

		Map rs = new HashMap<>();

		rs.put("resultCode", "S-1");
		rs.put("msg", "모든 메세지들을 삭제 하였습니다.");

		return rs;
	}


	@RequestMapping("/chats/doAddMessage")
	@ResponseBody
	public Map doAddMessage(int roomId, String writer, String body) {
		Map rs = new HashMap<>();

		chatservice.addMessage(roomId, writer, body);

		rs.put("resultCode", "S-1");
		rs.put("msg", "채팅 메세지가 추가 되었습니다");

		return rs;
	}

	@RequestMapping("/chats/getMessages")
	@ResponseBody
	public List getMessages() {

		return chatservice.getMessages();
	}

	@RequestMapping("/chats/getMessagesFrom")
	@ResponseBody
	public Map getMessagesFrom(int roomId, int from) {

		List<ChatMessage> messages =  chatservice.getMessagesFrom(roomId,from);

		Map rs = new HashMap<>();



		rs.put("resultCode", "S-1");
		rs.put("msg", "새 메세지들을 가져왔습니다.");
		rs.put("messages", messages);
		return rs;
	}


	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;

	@GetMapping("/echo3")
	public String echo3() {
		return "echo3";
	}

	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}

	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}

	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		System.out.println(roomList); 
		return roomList;
	}

	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}

	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));

		List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("chat");
		}else {
			mv.setViewName("room");
		}
		return mv;
	}
}