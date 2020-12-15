package kr.co.dao;

import java.util.List;

import kr.co.util.Criteria;
import kr.co.vo.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> list(Integer articleNo) throws Exception;
	
	public void create(ReplyVO replyVO) throws Exception;
	
	public void update(ReplyVO replyVO) throws Exception;
	
	public void delete(Integer replyNo) throws Exception;
	
	public List<ReplyVO> listPaging(Integer articleNo, Criteria criteria) throws Exception;
	
	public int countReply(Integer articleNo) throws Exception;

}
