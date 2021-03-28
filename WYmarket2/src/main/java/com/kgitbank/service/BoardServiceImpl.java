package com.kgitbank.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.mapper.BoardMapper; 
import com.kgitbank.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService { 

	@Autowired
	BoardMapper board_mapper;
	
	@Override
	public void create(BoardVO vo) {
		 String title = vo.getNtitle();
		 String content = vo.getNcontent();
		 String writer = vo.getAdminNick();
		 
		 
		 board_mapper.create(vo);
	}
	
	@Override
	public BoardVO read(int noticeID) {
		 
		return board_mapper.read(noticeID);
	}

	@Override
	public void update(BoardVO vo) {
	 
		board_mapper.update(vo);
	
	}
	@Override
	public void delete(int noticeID) {
		board_mapper.delete(noticeID);
	}

	@Override
	public List<BoardVO> listAll() {
		 
		return board_mapper.listAll();
	}
	
	@Override
	public void increaseViewcnt(int noticeID, HttpSession session) {
		
		 long update_time=0;
		 //세션에 저장된 조회시간 검색
		 //최초 조회할 경우 세션에 저장된 값이 없기 때문에 if문 실행x
		 if(session.getAttribute("update_time"+noticeID) != null) {
			 update_time = (long)session.getAttribute("update_time"+noticeID);
		 }
		 //시스템의 현재시간을 current에 저장
		 long current_time = System.currentTimeMillis();
		 //일정시간이 경과 후 조회수 증가 처리
		 if(current_time - update_time >3*1000) {
			 board_mapper.increaseViewcnt(noticeID,session);
			 //세션에 시간 저장
			 session.setAttribute("update_time"+noticeID,current_time);
		 }
	} 

 
 

	 

}
