package com.inhatc.persistence;

import java.util.List;

import com.inhatc.vo.BoardVO;
import com.inhatc.vo.BuyVO;

public interface BuyDAO {
	public int buyProduct(BuyVO vo);
	public BoardVO OrderList(BoardVO vo);
}