package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.util.Criteria;
import kr.co.util.SearchCriteria;
import kr.co.vo.ArticleVO;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
	
	@Autowired
	private SqlSession sql;

	@Override
	public void create(ArticleVO articleVO) throws Exception {
		sql.insert("article.create", articleVO);

	}

	@Override
	public ArticleVO read(Integer articleNo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("article.read", articleNo);
	}

	@Override
	public void update(ArticleVO articleVO) throws Exception {
		sql.update("article.update", articleVO);

	}

	@Override
	public void delete(Integer articleNo) throws Exception {
		sql.delete("article.delete", articleNo);

	}

	@Override
	public List<ArticleVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("article.listAll");
	}

	@Override
	public List<ArticleVO> listPaging(int page) throws Exception {

		if(page <= 0) {
			page = 1;
			
		}
		
		page = (page - 1) * 10;
		
		return sql.selectList("article.listPaging", page);
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("article.listCriteria", criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("article.countArticles", criteria);
	}

	@Override
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("article.listSearch", searchCriteria);
	}

	@Override
	public int countSearchArticles(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("article.countSearchArticle", searchCriteria);
	}

}
