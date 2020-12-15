package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.ArticleDAO;
import kr.co.dao.ReplyDAO;
import kr.co.util.Criteria;
import kr.co.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Autowired
	private ArticleDAO articleDAO;
	
	@Autowired
    public ReplyServiceImpl(ReplyDAO replyDAO, ArticleDAO articleDAO) {
        this.replyDAO = replyDAO;
        this.articleDAO = articleDAO;
    }

	@Override
	public List<ReplyVO> getReplies(Integer articleNo) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.list(articleNo);
	}

	@Transactional
	@Override
	public void addReply(ReplyVO replyVO) throws Exception {
		replyDAO.create(replyVO);
		
	}

	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception {
		replyDAO.update(replyVO);
		
	}

	@Transactional
	@Override
	public void removeReply(Integer replyNo) throws Exception {
		replyDAO.delete(replyNo);
		
	}

	@Override
	public List<ReplyVO> getRepliesPaging(Integer articleNo, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countReplies(Integer articleNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
