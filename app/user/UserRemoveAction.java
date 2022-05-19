package com.monami.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.user.dao.UserDAO;
import com.monami.app.user.dao.UserDTO;

public class UserRemoveAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			UserDAO udao= new UserDAO();
	
			String user_id = req.getParameter("user_id");
			String user_pw=req.getParameter("user_pw");
			
			ActionTo transfer=new ActionTo();
			transfer.setRedirect(true);

			if(udao.removeUser(user_id,user_pw)) {
				transfer.setPath(req.getContextPath()+"/index.jsp");
				req.getSession().removeAttribute("loginUser");
			}
			else {
				transfer.setPath(req.getContextPath()+"/index.jsp");
				PrintWriter out=resp.getWriter();
				out.println("<script>alert('회원탈퇴실패');</script>");

		
			}
		return transfer;
	}
	
}
