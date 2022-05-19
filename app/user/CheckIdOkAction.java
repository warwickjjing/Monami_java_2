package com.monami.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.user.dao.UserDAO;

public class CheckIdOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String user_id=req.getParameter("user_id");
		UserDAO udao=new UserDAO();
		PrintWriter out = resp.getWriter();
		if(udao.checkId(user_id)) {
			out.write("O");
		}
		else {
			out.write("X");
		}
		out.close();
		
		return null;
	}
	
}
