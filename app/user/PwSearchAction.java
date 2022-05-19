package com.monami.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.user.dao.UserDAO;
import com.monami.app.user.dao.UserDTO;

public class PwSearchAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao=new UserDAO();
		String user_name=req.getParameter("user_name");
		String user_id=req.getParameter("user_id");
		String user_phone=req.getParameter("user_phone");
		HttpSession session =req.getSession();
		
		UserDTO pwSearchUser=udao.pwSearch(user_name,user_id,user_phone);
		ActionTo transfer=new ActionTo();
		if(pwSearchUser !=null) {
			System.out.println(1);
			session.setAttribute("pwSearchUser",pwSearchUser);
			transfer.setRedirect(false);			
			transfer.setPath("/jungmin/pwOk.mo");
		}
		else {			
		
			transfer.setRedirect(false);
			transfer.setPath("/index.jsp");
		}
		return transfer;
	}
	
}
