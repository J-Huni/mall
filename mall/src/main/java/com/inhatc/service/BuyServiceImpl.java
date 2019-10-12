package com.inhatc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.vo.BoardVO;
import com.inhatc.vo.BuyVO;
import com.inhatc.persistence.BuyDAO;

@Service
public class BuyServiceImpl implements BuyService {
	
	@Inject
	private BuyDAO dao;

	@Override
    public int buyProduct(BuyVO vo) {
        return dao.buyProduct(vo);
    }
	
	@Override
	public BoardVO OrderList(BoardVO vo) {
		return dao.OrderList(vo);
	}
}