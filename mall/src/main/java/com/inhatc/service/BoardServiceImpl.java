package com.inhatc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.vo.BoardVO;
import com.inhatc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public List<BoardVO> JapanList() {
		return dao.JapanList();
	}
	
	@Override
	public List<BoardVO> ChinaList() {
		return dao.ChinaList();
	}
	
	@Override
	public List<BoardVO> UsaList() {
		return dao.UsaList();
	}
	
    @Override
    public BoardVO read(Integer p_no) throws Exception {
        
        return dao.read(p_no);
    }
	
	@Override
    public void create(String filename) {
        dao.create(filename);
    }
	
	@Override
    public int createDetail(BoardVO vo) {
        return dao.createDetail(vo);
    }
}