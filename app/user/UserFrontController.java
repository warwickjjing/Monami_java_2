package com.monami.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.ExpiresFilter;

import com.monami.app.user.CheckIdOkAction;

import com.monami.action.ActionTo;

public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doprocess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doprocess(req, resp);
	}

	private void doprocess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String requestURI=req.getRequestURI();
		String contextPath=req.getContextPath();
		String command=requestURI.substring(contextPath.length());
		ActionTo transfer=null;
		System.out.println(command);
		
		switch(command) {
			
		case "/user/UserJoinOk.us":
			try {
				transfer=new UserJoinOkAction().execute(req,resp);
				
			} catch (Exception e) {
				System.out.println("UserJoinOk : "+e);
			}
			break;
		case "/user/UserLoginOk.us":
			try {
				transfer=new UserLoginOkAction().execute(req,resp);
				
			} catch (Exception e) {
				
				System.out.println("UserLoginOk : "+e);
			}
			break;
		case "/user/CheckIdOk.us":
			try {
				new CheckIdOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CheckIdOk : "+e);
			}
			break;
		case "/user/UserLogoutOk.us":
try {
				
				transfer=new LogoutAction().execute(req,resp);
			}catch(Exception e) {
				System.out.println("Logout:"+e);
			}
			break;
		case "/user/UserIdSearch.us":
			try {
				
				transfer=new IdSearchAction().execute(req,resp);
			}catch(Exception e) {
				System.out.println("IdSearch:"+e);
			}
			break;
		case "/user/UserPwSearch.us":
			try {
				
				transfer=new PwSearchAction().execute(req,resp);
			}catch(Exception e) {
				System.out.println("PwSearch:"+e);
			}
			break;	
		case "/user/UserModifyOk.us":
	try {
				
				transfer=new UserModifyOkAction().execute(req,resp);
			}catch(Exception e) {
				System.out.println("UserModifyOk:"+e);
			}
			break;
		case "/user/userRemove.us":
			try {
				transfer = new UserRemoveAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserRemove : "+e);
			}
			break;
		}
	
		if(transfer != null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}
			else {
				RequestDispatcher disp = req.getRequestDispatcher(transfer.getPath());
				disp.forward(req, resp);
			}
		}
	}
	
	
}
