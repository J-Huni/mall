package com.inhatc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.vo.BoardVO;
import com.inhatc.vo.SignupVO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.js.mapper.homeMapper";

	@Override
	public SignupVO modifyID(SignupVO vo){
		return session.selectOne(namespace + ".modifyID",vo);
	}

	@Override
	public List<SignupVO> userList() {
		return session.selectList(namespace+".UserList");
	}
	
	@Override
	public List<BoardVO> productList() {
		return session.selectList(namespace+".ProductList");
	}
}