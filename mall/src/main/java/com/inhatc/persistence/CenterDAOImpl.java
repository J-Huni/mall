package com.inhatc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.vo.Search;
import com.inhatc.vo.Criteria;
import com.inhatc.vo.CenterVO;

@Repository
public class CenterDAOImpl implements CenterDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.js.mapper.centerMapper";

	//게시판추가
    @Override
    public void create(CenterVO vo) throws Exception {
        
        session.insert(namespace+".insertList", vo);
 
    }
    
    //게시판 상세
    @Override
    public CenterVO read(Integer c_no) throws Exception {
        return session.selectOne(namespace+".detailList", c_no);
    }
 
    //게시판 삭제
    @Override
    public int deleteList(Integer c_no) throws Exception {
        return session.delete(namespace+".deleteList", c_no);
    }
 
    //게시판 수정
    @Override
    public int UpdateList(CenterVO vo) throws Exception {
        return session.update(namespace+".updateList", vo);
 
    }
    
    @Override
    public List<CenterVO> ListAll() throws Exception {
    	return session.selectList(namespace+".centerlist");
    }
    
    @Override
	public List<CenterVO> search(Search sch, Criteria cri) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(cri.getNumberOfRecords() != 0)
		{
			paramMap.put("start", (cri.getCurrentPageNo() - 1) * cri.getMaxPost());
			paramMap.put("end", cri.getMaxPost());
		}
		else
		{
			paramMap.put("start", 0);
			paramMap.put("end", cri.getMaxPost());			
		}
		paramMap.put("searchType", sch.getSearchType());
		paramMap.put("search", sch.getSearch());
		return session.selectList(namespace+".search_board", paramMap);
	}
    
    @Override
	public int searchBoardCount(Search sch) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", sch.getSearchType());
		paramMap.put("search", sch.getSearch());
		return session.selectOne(namespace+".search_center_count", paramMap);
	}
}