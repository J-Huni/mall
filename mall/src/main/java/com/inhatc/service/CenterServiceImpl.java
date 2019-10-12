package com.inhatc.service;
 
import java.util.List;
 
import javax.inject.Inject;

import com.inhatc.vo.Search;
import com.inhatc.vo.Criteria;
import com.inhatc.persistence.CenterDAO;
import com.inhatc.vo.CenterVO;
import org.springframework.stereotype.Service;

@Service
public class CenterServiceImpl implements CenterService {
	
	@Inject
	private CenterDAO dao;
	
/*	@Override
	public List<CenterVO> ListAll() throws Exception{
		return dao.ListAll();
	}*/
	
	@Override
	public List<CenterVO> ListAll() throws Exception{
		return dao.ListAll();
	}
	
	@Override
    public void create(CenterVO vo) throws Exception {
        dao.create(vo);
 
    }
 
    @Override
    public CenterVO read(Integer c_no) throws Exception {
        
        return dao.read(c_no);
    }
 
    @Override
    public int deleteList(Integer c_no) throws Exception {
        return dao.deleteList(c_no);
    }
 
    @Override
    public int UpdateList(CenterVO vo) throws Exception {
        return dao.UpdateList(vo);
    }
    
    @Override
	public List<CenterVO> search(Search sch, Criteria cri) throws Exception {
		return dao.search(sch, cri);
	}
    
	@Override
	public int searchBoardCount(Search sch) throws Exception {
		return dao.searchBoardCount(sch);
	}
}