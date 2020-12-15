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

import kr.co.dao.ReplyDAO;
import kr.co.util.Criteria;
import kr.co.vo.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ReplyDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Autowired
	private ReplyDAO dao;
	
	@Test
	@Ignore
	public void testReplyCreate() throws Exception {
		logger.info("testReplyCreate");
		
		for(int i=1; i <= 10; i++) {
			ReplyVO replyVO = new ReplyVO();
			replyVO.setArticleNo(10);
			replyVO.setReplyText(i + "번째 댓글입니다.");
			replyVO.setReplyWriter("user0" + (i%10));
			dao.create(replyVO);
		}
		
	}
	
	@Test
	@Ignore
	public void testReplyList() throws Exception {
		logger.info(dao.list(10).toString());
		
	}
	
	@Test
	@Ignore
	public void testReplyUpdate() throws Exception {
		logger.info("testReplyUpdate");
		
			ReplyVO replyVO = new ReplyVO();
			replyVO.setArticleNo(2);
			replyVO.setReplyText(2 + "번째 댓글 수정.");
			replyVO.setReplyWriter(2 + "번째 작성자 수정");
			dao.create(replyVO);
		
	}
	
	@Test
	@Ignore
	public void testReplyDelete() throws Exception {
		logger.info("testReplyDelete");
		
		dao.delete(3);
		
	}
	
	@Test
	//@Ignore
	public void testReplyPaging() throws Exception {
		
		Criteria criteria = new Criteria();
		criteria.setPerPageNum(9);
		criteria.setPage(1);
		
		List<ReplyVO> replies = dao.listPaging(9, criteria);
		
		for(ReplyVO reply : replies) {
			logger.info(reply.getReplyNo() + " : " + reply.getReplyText());
		}
		
	}

}
