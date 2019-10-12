package com.inhatc.service;

import java.util.List;

import com.inhatc.vo.BoardVO;
import com.inhatc.vo.SignupVO;

public interface HomeService {
	public SignupVO modifyID(SignupVO vo);
	public List<SignupVO> userList();
	public List<BoardVO> productList();
}