package kr.co.service;

import java.util.List;

import kr.co.util.Criteria;
import kr.co.vo.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> getReplies(Integer articleNo) throws Exception;

	public void addReply(ReplyVO replyVO) throws Exception;

	public void modifyReply(ReplyVO replyVO) throws Exception;

	public void removeReply(Integer replyNo) throws Exception;

	public List<ReplyVO> getRepliesPaging(Integer articleNo, Criteria criteria) throws Exception;

	public int countReplies(Integer articleNo) throws Exception;
}
