package com.monami.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.monami.mybatis.SqlMapConfig;

public class EventFileDAO {
	SqlSession sqlsession;

	public EventFileDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean insertFile(EventFileDTO file) {
		return 1 == sqlsession.insert("E_File.insertFile",file);
	}
	public List<EventFileDTO> getFiles(int event_idx) {
		return sqlsession.selectList("E_File.getFiles",event_idx);
	}

	public void deleteByName(String systemname) {
		sqlsession.delete("E_File.deleteByName",systemname);
		
	}

	public List<EventFileDTO> getFileList(int startRow, int pageSize) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		List<EventFileDTO> result;
	
		result = sqlsession.selectList("E_File.getFileList", datas);
		return result;
	}

	public boolean removeFile(int event_idx) {
		return 1 == sqlsession.delete("E_File.removeFile", event_idx);
	}

}