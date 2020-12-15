package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.ArticleDAO;
import kr.co.util.Criteria;
import kr.co.util.SearchCriteria;
import kr.co.vo.ArticleVO;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleDAO dao;

	@Override
	public void create(ArticleVO articleVO) throws Exception {
		dao.create(articleVO);

	}

	@Override
	public ArticleVO read(Integer articleNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(articleNo);
	}

	@Override
	public void update(ArticleVO articleVO) throws Exception {
		dao.update(articleVO);

	}

	@Override
	public void delete(Integer articleNo) throws Exception {
		dao.delete(articleNo);

	}

	@Override
	public List<ArticleVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public List<ArticleVO> listPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPaging(page);
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.countArticles(criteria);
	}

	@Override
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(searchCriteria);
	}

	@Override
	public int countSearchArticles(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.countSearchArticles(searchCriteria);
	}

}
