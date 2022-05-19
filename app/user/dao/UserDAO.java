package com.monami.app.user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;


import com.monami.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlsession;
	
	public UserDAO() {
		sqlsession=SqlMapConfig.getFactory().openSession(true);
	}
	
	public boolean join(UserDTO newUser) {
		return 1 == sqlsession.insert("User.join",newUser);
	}

	public UserDTO login(String user_id, String user_pw) {
		 HashMap<String,String> datas=new HashMap<String,String>();
		 datas.put("user_id1",user_id);
		 datas.put("user_pw1",user_pw);
		 UserDTO loginUser=sqlsession.selectOne("User.login",datas);
		return loginUser;
	}
	public List<UserDTO> getList() {
		return sqlsession.selectList("User.getList");
	}
	
	public boolean checkId(String user_id) {
		return (Integer)sqlsession.selectOne("User.checkId",user_id) == 0;
	}



	public UserDTO idSearch(String user_name, String user_phone) {
		 HashMap<String,String> datas1=new HashMap<String,String>();
		 datas1.put("user_name",user_name);
		 datas1.put("user_phone",user_phone);
		 UserDTO idSearchUser=sqlsession.selectOne("User.idSearch",datas1);
		return idSearchUser;
	}

	public UserDTO pwSearch(String user_name, String user_id, String user_phone) {
		HashMap<String,String> datas1=new HashMap<String,String>();
		 datas1.put("user_name",user_name);
		 datas1.put("user_id",user_id);
		 datas1.put("user_phone",user_phone);
		 UserDTO pwSearchUser=sqlsession.selectOne("User.pwSearch",datas1);
		return pwSearchUser;
	}

	public UserDTO getDetail(String user_id) {
		
		return sqlsession.selectOne("User.getDetail",user_id);
	}

	public boolean updateUser(UserDTO newUser) {
	return 1 == sqlsession.update("User.updateUser",newUser);
	}

	
	public boolean removeUser(String user_id,String user_pw) {
        HashMap<String,String> datas1=new HashMap<String,String>();
         datas1.put("user_id",user_id);
         datas1.put("user_pw",user_pw);
        return 1 == sqlsession.delete("User.removeUser",datas1);
    }

	
}

