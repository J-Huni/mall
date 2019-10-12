package com.inhatc.persistence;

import com.inhatc.vo.SignupVO;
public interface SignupDAO {
	//public boolean login_check(String id, String pw);
	public int Signup(SignupVO vo);
}