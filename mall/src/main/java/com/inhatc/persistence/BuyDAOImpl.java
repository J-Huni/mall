package com.inhatc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.vo.BoardVO;
import com.inhatc.vo.BuyVO;

@Repository
public class BuyDAOImpl implements BuyDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.js.mapper.buyMapper";

	@Override
	public int buyProduct(BuyVO vo) {
		return session.insert(namespace +".InsertBuy", vo);
	}
	
	public BoardVO OrderList(BoardVO vo) {
		return session.selectOne(namespace + ".BuyDetail",vo);
	}
	
}