package com.inhatc.persistence;

import java.util.List;

import com.inhatc.vo.BoardVO;

public interface BoardDAO {
	public void create(String filename);
	public List<BoardVO> JapanList();
	public List<BoardVO> ChinaList();
	public List<BoardVO> UsaList();
	public BoardVO read(Integer p_no) throws Exception;
	public int createDetail(BoardVO vo);
}