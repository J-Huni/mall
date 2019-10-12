package com.inhatc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.vo.BoardVO;
import com.inhatc.vo.SignupVO;
import com.inhatc.persistence.HomeDAO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Inject
	private HomeDAO dao;
	
	@Override
	public SignupVO modifyID(SignupVO vo) {
		return dao.modifyID(vo);
	}
	
	@Override
	public List<SignupVO> userList() {
		return dao.userList();
	}
	
	@Override
	public List<BoardVO> productList() {
		return dao.productList();
	}
}