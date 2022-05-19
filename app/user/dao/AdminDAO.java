package com.monami.app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.monami.mybatis.SqlMapConfig;


public class AdminDAO {
	SqlSession sqlsession;

	public AdminDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true); // true시 오토커밋
	}
	public AdminDTO login(String userid, String userpw) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("userid",userid);
		datas.put("userpw",userpw);
		AdminDTO loginUser = sqlsession.selectOne("User.login",datas);
		return loginUser;
	}
}
