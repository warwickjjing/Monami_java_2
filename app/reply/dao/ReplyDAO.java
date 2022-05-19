package com.monami.app.reply.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.monami.mybatis.SqlMapConfig;

public class ReplyDAO {
SqlSession sqlsession;
	
public ReplyDAO() {
	sqlsession = SqlMapConfig.getFactory().openSession(true);
}

public ReplyDTO getDetail(int iqr_idx) {
	
	return sqlsession.selectOne("Reply.getDetail",iqr_idx);
	
}

public boolean insertReply(ReplyDTO newReply) {
	return 1 == sqlsession.insert("Reply.insertReply",newReply);
}

public boolean updateReply(int iqr_idx, String answer) {
	HashMap<String, Object> datas = new HashMap<String, Object>();
	datas.put("iqr_idx", iqr_idx);
	datas.put("answer", answer);
	return 1 == sqlsession.update("Reply.updateReply",datas);
	
}

public boolean deleteReply(String iqr_idx) {
	return 1 == sqlsession.delete("Reply.deleteReply",iqr_idx);
}
}