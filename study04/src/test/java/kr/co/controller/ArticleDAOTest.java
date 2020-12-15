package kr.co.controller;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.dao.ArticleDAO;
import kr.co.util.Criteria;
import kr.co.util.SearchCriteria;
import kr.co.vo.ArticleVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ArticleDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticleDAOTest.class);
	
	@Autowired
	private ArticleDAO dao;
	
	@Test
	@Ignore
	public void testCreate() throws Exception {
		logger.info("testCreate");
		
		for(int i = 0; i<= 220; i++) {
			
			ArticleVO articleVO = new ArticleVO();
			articleVO.setTitle("새로운 글 작성 테스트 제목");
			articleVO.setContent("새로운 글 작성 테스트 내용");
			articleVO.setWriter("새로운 글 작성자");
			
			dao.create(articleVO);
			
		}
	}
	
	@Test
	@Ignore
	public void testRead() throws Exception {
		logger.info("testRead");
		
	}
	
	@Test
	@Ignore
	public void testUpdate() throws Exception {
		logger.info("testUpdate");
		
		ArticleVO articleVO = new ArticleVO();
		articleVO.setArticleNo(1);
		articleVO.setTitle("새로운 글 수정 제목");
		articleVO.setContent("새로운 글 수정 테스트 내용");
		dao.update(articleVO);
		
	}
	
	@Test
	@Ignore
	public void testDelete() throws Exception {
		logger.info("testDelete");
		
		dao.delete(1);
		
	}
	
	@Test
	@Ignore
	public void testListPagin() throws Exception {
		logger.info("testListPagin");
		
		int page = 3;
		
		List<ArticleVO> articles = dao.listPaging(page);
		
		for(ArticleVO article : articles) {
			logger.info(article.getArticleNo() + ":" + article.getTitle());
		}
		
	}
	
	@Test
	@Ignore
	public void testListCriteria() throws Exception {
		logger.info("testListCriteria");
		
		Criteria criteria = new Criteria();
		criteria.setPage(3);
		criteria.setPerPageNum(20);
		
		List<ArticleVO> articles = dao.listCriteria(criteria);
		
		for(ArticleVO article : articles) {
			logger.info(article.getArticleNo() + ":" + article.getTitle());
		}
		
	}
	
	@Test
	@Ignore
	public void testURI() throws Exception {
		logger.info("testURI");
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
									 .path("/article/read")
									 .queryParam("articleNo", 12)
									 .queryParam("perPageNum", 20)
									 .build();
		
		logger.info("/article/read?articleNo=12&perPageNum=20");
		logger.info(uriComponents.toString());
		
	}
	
	@Test
	@Ignore
	public void testURI2() throws Exception {
		logger.info("testURI");
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
									 .path("/{module}/{page}")
									 .queryParam("articleNo", 12)
									 .queryParam("perPageNum", 20)
									 .build()
									 .expand("article", "read")
									 .encode();
		
		logger.info("/article/read?articleNo=12&perPageNum=20");
		logger.info(uriComponents.toString());
		
	}
	
	@Test
	//@Ignore
	public void testDynamic1() throws Exception {
		logger.info("testDynamic1");
		
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setPage(1);
		searchCriteria.setKeyword("7");
		searchCriteria.setSearchType("t");
		
		logger.info("=========================");
		
		List<ArticleVO> articles = dao.listSearch(searchCriteria);
		
		for(ArticleVO article : articles) {
			logger.info(article.getArticleNo() + " : " + article.getTitle());
		}
		
		logger.info("=========================");
		logger.info("searched articles count :" + dao.countSearchArticles(searchCriteria));
		
	}

}
