package com.inhatc.persistence;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.inhatc.vo.SignupVO;

@Repository
public class SignupDAOImpl implements SignupDAO {
	@Inject
	private SqlSession session;
	@Inject
	private static String namespace = "com.js.mapper.signupMapper";

	@Override
	public int Signup(SignupVO vo){
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		// paramMap.put("id", id);
		// paramMap.put("pw", pw);
		// paramMap.put("email", email);
		// paramMap.put("name", name);
		// System.out.println("DAOimpl");
		// System.out.println("id : "+paramMap.get("id"));
		// System.out.println("pw : "+paramMap.get("pw"));
		// System.out.println("email : "+paramMap.get("email"));
		// System.out.println("name : "+paramMap.get("name"));
		// System.out.println(namespace+" "+paramMap);
		// System.out.println(session.insert(namespace+".registers",paramMap));
		// int result = session.selectOne(namespace+".login_check",paramMap);
		
		// if(result == 1)
		// 	return true;
		// else
		// 	return false;
		paramMap.put("id", vo.getId());
		paramMap.put("pw", vo.getPw());
		paramMap.put("name", vo.getName());
		paramMap.put("email", vo.getEmail());
		paramMap.put("address",vo.getAddress());
		paramMap.put("pnum",vo.getPnum());
		System.out.println("id : "+vo.getId());
		System.out.println("pw : "+vo.getPw());
		System.out.println("name : "+vo.getName());
		System.out.println("email : "+vo.getEmail());
		System.out.println("address : "+vo.getAddress());
		System.out.println("pnum: "+vo.getPnum());
		int result = session.insert(namespace+".signup",paramMap);
		return result;
//		return 0;
	}

}