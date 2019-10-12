package com.inhatc.service;

import java.util.List;
import com.inhatc.vo.CenterVO;
import com.inhatc.vo.Criteria;
import com.inhatc.vo.Search;

public interface CenterService {
	/*public List<CenterVO> ListAll() throws Exception;*/
	
	public List<CenterVO> ListAll() throws Exception;
	
    public void create(CenterVO vo) throws Exception;
    
    public CenterVO read(Integer c_no) throws Exception;
    
    public int deleteList(Integer c_no) throws Exception;
    
    public int UpdateList(CenterVO vo) throws Exception;
    
    public int searchBoardCount(Search sch) throws Exception;
    
    public List<CenterVO> search(Search sch, Criteria cri) throws Exception;
}