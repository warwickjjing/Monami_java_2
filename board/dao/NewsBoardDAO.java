package com.monami.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.monami.board.dao.NewsBoardDTO;
import com.monami.mybatis.SqlMapConfig;

public class NewsBoardDAO {
	SqlSession sqlsession;
	
	public NewsBoardDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean insertBoard(NewsBoardDTO news) {
		return 1 == sqlsession.insert("News.insertBoard", news);
	}

	public int getLastNum() {
		return sqlsession.selectOne("News.getLastNum");
	}
	public int getFirstNum(String news_writer) {
		return sqlsession.selectOne("News.getFirstNum", news_writer);
	}


	public NewsBoardDTO getDetail(int news_idx) {
		return sqlsession.selectOne("News.getDetail", news_idx);
	}

	public int getBoardCnt() {
		return sqlsession.selectOne("News.getBoardCnt");
	}

	public List<NewsBoardDTO> getBoardList(int startRow, int pageSize) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		List<NewsBoardDTO> result;
	
		result = sqlsession.selectList("News.getBoardList", datas);
		return result;
	}

	public String getNextPage(int news_idx) {
		return sqlsession.selectOne("News.getNextPage", news_idx);
	}

	public String getPrevPage(int news_idx) {
		return sqlsession.selectOne("News.getPrevPage", news_idx);
	}

	public boolean removeBoard(int news_idx) {
		return 1 == sqlsession.delete("News.removeBoard", news_idx);
	}

	public boolean updateBoard(NewsBoardDTO board) {
		return 1  == sqlsession.update("News.updateBoard", board);
	}



	
	
}