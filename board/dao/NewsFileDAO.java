package com.monami.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.monami.mybatis.SqlMapConfig;

public class NewsFileDAO {
	SqlSession sqlsession;
	
	public NewsFileDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean insertFile(NewsFileDTO file) {
		return 1 == sqlsession.insert("File.insertFile",file);
	}

	public List<NewsFileDTO> getFiles(int news_idx) {
		return sqlsession.selectList("File.getFiles",news_idx);
	}

	public void deleteByName(String systemname) {
		sqlsession.delete("File.deleteByName",systemname);
		
	}
	
}