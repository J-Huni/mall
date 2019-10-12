package com.inhatc.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.inhatc.vo.SignupVO;
import com.inhatc.persistence.SignupDAO;

@Service
public class SignupServiceImpl implements SignupService {

	@Inject
	private SignupDAO dao;
	
	@Override
	public int Signup(SignupVO vo){
		// TODO Auto-generated method stub
		return dao.Signup(vo);
	}

}