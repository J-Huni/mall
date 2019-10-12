package com.inhatc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.js.mapper.boardMapper";

	@Override
	public List<BoardVO> JapanList() {
		return session.selectList(namespace+".JapanList");
	}
	
	@Override
	public List<BoardVO> ChinaList() {
		return session.selectList(namespace+".ChinaList");
	}
	
	@Override
	public List<BoardVO> UsaList() {
		return session.selectList(namespace+".UsaList");
	}
	
	@Override
	public void create(String filename){
		session.insert(namespace + ".InsertBoard", filename);
	}
	
	@Override
	public BoardVO read(Integer p_no) throws Exception{
		return session.selectOne(namespace + ".DetailBoard",p_no);
	}
	
	@Override
	public int createDetail(BoardVO vo) {
		return session.update(namespace +".InsertDetail", vo);
	}
}