package com.monami.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.monami.mybatis.SqlMapConfig;

public class EventBoardDAO {
	SqlSession sqlsession;
	
	public EventBoardDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean insertBoard(EventBoardDTO event) {
		return 1 == sqlsession.insert("Event.insertBoard", event);
	}
	public int getLastNum() {
		return sqlsession.selectOne("Event.getLastNum");
	}
	public int getFirstNum(String event_writer) {
		return sqlsession.selectOne("Event.getFirstNum", event_writer);
	}


	public EventBoardDTO getDetail(int event_idx) {
		return sqlsession.selectOne("Event.getDetail", event_idx);
	}

	public int getBoardCnt() {
		return sqlsession.selectOne("Event.getBoardCnt");
	}

	public List<EventBoardDTO> getBoardList(int startRow, int pageSize) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		List<EventBoardDTO> result;
	
		result = sqlsession.selectList("Event.getBoardList", datas);
		return result;
	}

	public String getNextPage(int event_idx) {
		return sqlsession.selectOne("Event.getNextPage", event_idx);
	}

	public String getPrevPage(int event_idx) {
		return sqlsession.selectOne("Event.getPrevPage", event_idx);
	}

	public boolean removeBoard(int event_idx) {
		return 1 == sqlsession.delete("Event.removeBoard", event_idx);
	}

	public boolean updateBoard(EventBoardDTO board) {
		return 1  == sqlsession.update("Event.updateBoard", board);
	}


}