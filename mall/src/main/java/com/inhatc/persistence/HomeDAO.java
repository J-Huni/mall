package com.inhatc.persistence;

import java.util.List;

import com.inhatc.vo.BoardVO;
import com.inhatc.vo.SignupVO;

public interface HomeDAO {
	public SignupVO modifyID(SignupVO vo);
	public List<SignupVO> userList();
	public List<BoardVO> productList();
}