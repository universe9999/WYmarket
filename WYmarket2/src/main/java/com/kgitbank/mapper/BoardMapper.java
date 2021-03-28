package com.kgitbank.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.BoardVO;

public interface BoardMapper {
	public void create(BoardVO vo);
	public BoardVO read(int noticeID);
	public void update(BoardVO vo);
	public void delete(int noticeID);
	public List<BoardVO> listAll();
	public void increaseViewcnt(@Param("noticeID") int noticeID, @Param("session") HttpSession session);
	
}
