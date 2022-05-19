package com.monami.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.user.dao.UserDAO;
import com.monami.app.user.dao.UserDTO;

public class UserJoinOkAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDTO newUser=new UserDTO();
		UserDAO udao=new UserDAO();
		newUser.setUser_id(req.getParameter("user_id"));
		newUser.setUser_pw(req.getParameter("user_pw"));
		newUser.setUser_name(req.getParameter("user_name"));
		newUser.setUser_dob(req.getParameter("user_dob"));
		newUser.setUser_zipcode(req.getParameter("user_zipcode"));
		newUser.setUser_addr(req.getParameter("user_addr"));
		newUser.setUser_addrdetail(req.getParameter("user_addrdetail"));
		newUser.setUser_addretc(req.getParameter("user_addretc"));
		newUser.setUser_phone(req.getParameter("user_phone"));
		
		ActionTo transfer=new ActionTo();
		if(udao.join(newUser)) {
			transfer.setRedirect(true);

			transfer.setPath(req.getContextPath()+"/index.jsp");

			

		}
		else {
			
			transfer.setRedirect(true);

			transfer.setPath(req.getContextPath()+"/index.jsp");



		}
		return transfer;
	}
	
}
