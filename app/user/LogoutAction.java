package com.monami.app.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;

public class LogoutAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Cookie[] cookie= req.getCookies();
		ActionTo transfer=new ActionTo();
		if(cookie!=null) {
			
			for(int i=0;i<cookie.length;i++) {
				if(cookie[i].getName().equals("c")) {
					cookie[i].setMaxAge(0);
					cookie[i].setPath("/");
					resp.addCookie(cookie[i]);
					break;
				}
				}
			req.getSession().removeAttribute("loginUser");
			transfer.setRedirect(false);
				
				transfer.setPath("/index.jsp");
			}
			else {			
				
				transfer.setRedirect(false);
				transfer.setPath("/index.jsp?login=f");
			}
			return transfer;
		}}