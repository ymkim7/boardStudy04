package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.util.Criteria;
import kr.co.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSession sql;

	@Override
	public List<ReplyVO> list(Integer articleNo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("reply.list", articleNo);
	}

	@Override
	public void create(ReplyVO replyVO) throws Exception {
		sql.selectOne("reply.create", replyVO);

	}

	@Override
	public void update(ReplyVO replyVO) throws Exception {
		sql.update("reply.update", replyVO);

	}

	@Override
	public void delete(Integer replyNo) throws Exception {
		sql.delete("reply.delete", replyNo);

	}

	@Override
	public List<ReplyVO> listPaging(Integer articleNo, Criteria criteria) throws Exception {

		Map<String, Object> paramMap = new HashMap();
		paramMap.put("articleNo", articleNo);
		paramMap.put("criteria", criteria);
		
		return sql.selectList("reply.listPaging", paramMap);
	}

	@Override
	public int countReply(Integer articleNo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("reply.countReplies", articleNo);
	}

}
