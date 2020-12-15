package kr.co.service;

import java.util.List;

import kr.co.util.Criteria;
import kr.co.util.SearchCriteria;
import kr.co.vo.ArticleVO;

public interface ArticleService {
	
	public void create(ArticleVO articleVO) throws Exception;
	
	public ArticleVO read(Integer articleNo) throws Exception;
	
	public void update(ArticleVO articleVO) throws Exception;
	
	public void delete(Integer articleNo) throws Exception;
	
	public List<ArticleVO> listAll() throws Exception;
	
	public List<ArticleVO> listPaging(int page) throws Exception;
	
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	
	public int countArticles(Criteria criteria) throws Exception;
	
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception;
	
	public int countSearchArticles(SearchCriteria searchCriteria) throws Exception;

}
