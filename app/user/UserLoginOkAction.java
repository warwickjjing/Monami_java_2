package com.monami.app.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.user.dao.UserDAO;
import com.monami.app.user.dao.UserDTO;

public class UserLoginOkAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao=new UserDAO();
		String user_id=req.getParameter("user_id1");
		String user_pw=req.getParameter("user_pw1");
		String keepLogin=req.getParameter("keepLogin");
		HttpSession session =req.getSession();
		UserDTO loginUser=udao.login(user_id,user_pw);
		ActionTo transfer=new ActionTo();
		if(loginUser !=null) {
			session.setAttribute("loginUser",loginUser);
			if(keepLogin!=null) {
				Cookie c =new Cookie("c",loginUser.getUser_id());
				c.setPath("/");
				c.setMaxAge(3600);
				resp.addCookie(c);
			}
			transfer.setRedirect(false);
			transfer.setPath("/index.jsp");
		}
		else {			
			
			transfer.setRedirect(false);
			transfer.setPath("/index.jsp?login=f");
		}
		return transfer;
	}}
	 
