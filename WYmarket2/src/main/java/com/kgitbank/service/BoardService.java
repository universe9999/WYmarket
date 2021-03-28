package com.kgitbank.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kgitbank.model.BoardVO;

public interface BoardService {

	public void create(BoardVO vo);
	public BoardVO read(int noticeID);
	public void update(BoardVO vo);
	public void delete(int noticeID);
	public List<BoardVO> listAll();
	public void increaseViewcnt(int noticeID, HttpSession session);
	
	
}
