package com.monami.app.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.product.dao.ProductDAO;
import com.monami.app.product.dao.ProductDTO;
import com.monami.app.user.dao.UserDAO;
import com.monami.app.user.dao.UserDTO;

public class BasketOkAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ProductDAO pdao = new ProductDAO();
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		HttpSession session = req.getSession();
		String cookie = req.getHeader("Cookie");
		String basket = "";
		
		String userid = ((UserDTO)session.getAttribute("loginUser")).getUser_id();
	
		user = udao.getDetail(userid);
		
		if(cookie != null) {
			Cookie[] cookies = req.getCookies();
			for(int i = 0; i < cookies.length; i+=2) {
				if(cookies[i].getName().equals("basket")) {
					basket = cookies[i].getValue();
				}
			}
		}
		String[] list = basket.split("/");
		ProductDTO product = new ProductDTO();
		ArrayList<ProductDTO> basketlist = new ArrayList<ProductDTO>();
		if(list != null ) {
				for(int i = 0; i < list.length; i++) {
					String[] idx = list[i].split(":");
					System.out.println("쿠키 인덱스 :"+ idx[0]);
					int prod_idx = Integer.parseInt(idx[0]);
					product = pdao.getBasket(prod_idx);
					System.out.println("상품DTO :" + product);
					basketlist.add(product);
				}	
		}
		ActionTo transfer = new ActionTo();
		
			req.setAttribute("basketlist", basketlist);
			System.out.println("배스켓리스트 :"+basketlist);
		
		req.setAttribute("user", user);

		
		transfer.setRedirect(false);
		transfer.setPath("/geunseok/order.jsp");
		
		return transfer;
	}

}