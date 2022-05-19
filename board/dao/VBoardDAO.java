package com.monami.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.monami.mybatis.SqlMapConfig;

public class VBoardDAO {
SqlSession sqlsession;
	
	public VBoardDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	public boolean insertVideo(VBoardDTO vdto) {
		return sqlsession.insert("Board.insertVideo",vdto)==1;
	}
	public boolean updateVBoard(VBoardDTO vdto) {
		return sqlsession.update("Board.updateVideo",vdto)==1;
	}
	public List<VBoardDTO> getBoardList(int startRow, int pageSize) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<VBoardDTO> result;
		datas.put("startRow",startRow);
		datas.put("pageSize",pageSize);
		
		result = sqlsession.selectList("Board.getBoardList", datas);
		
		return result;
	}
	public int getBoardCnt() {
		return sqlsession.selectOne("Board.getBoardCnt");
	}
	public int getLastIndex() {
		return sqlsession.selectOne("Board.getLastIndex");
	}
	
	
	
	

}
