package com.monami.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.user.dao.UserDAO;
import com.monami.app.user.dao.UserDTO;

public class UserModifyOkAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao =new UserDAO();
		String user_id=req.getParameter("user_id");
		String user_pw=req.getParameter("user_pw");
		String user_name=req.getParameter("user_name");
		String user_dob=req.getParameter("user_dob");
		String user_zipcode=req.getParameter("user_zipcode");
		String user_addr=req.getParameter("user_addr");
		String user_addrdetail=req.getParameter("user_addrdetail");
		String user_addretc=req.getParameter("user_addretc");
		String user_phone=req.getParameter("user_phone");
		HttpSession session =req.getSession();
		UserDTO newUser=new UserDTO();
		newUser.setUser_name(user_name);
		newUser.setUser_id(user_id);
		newUser.setUser_pw(user_pw);
		newUser.setUser_dob(user_dob);
		newUser.setUser_zipcode(user_zipcode);
		newUser.setUser_addr(user_addr);
		newUser.setUser_addrdetail(user_addrdetail);
		newUser.setUser_addretc(user_addretc);
		newUser.setUser_phone(user_phone);
		
		ActionTo transfer=new ActionTo();
		
		if(udao.updateUser(newUser)) {
			transfer.setRedirect(true);			
		transfer.setPath("/jungmin/peninfo/peninfo.mo");
		}
		else {
			transfer.setRedirect(false);
			transfer.setPath("/jungmin/pen/penpage.mo?login=f");
		}
		
		return transfer;
	}
	
}
