package com.inhatc.service;

import java.util.List;

import com.inhatc.vo.BoardVO;
import com.inhatc.vo.BuyVO;

public interface BuyService {
	public int buyProduct(BuyVO vo);
	public BoardVO OrderList(BoardVO vo);
}