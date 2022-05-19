package com.monami.app.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.product.dao.ProductDAO;
import com.monami.app.product.dao.ProductDTO;

public class ProductDetailViewtAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ProductDAO pdao = new ProductDAO();
		int prod_num = Integer.parseInt(req.getParameter("prod_num"));
		HttpSession session = req.getSession();
		
//		String userid = ((UserDTO)session.getAttribute("loginUser")).getUserid();
		ProductDTO product = pdao.getDetail(prod_num);
//		if(!product.getUserid().equals(userid)) {
//			pdao.updateReadCount(prod_num);
//			product.setReadcount(product.getReadcount()+1);
//		}
//		FileDAO fdao = new FileDAO();
//		req.setAttribute("files", fdao.getFiles(boardnum));		
		req.setAttribute("product", product);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/A_detail.jsp");
		return transfer;
	}

}
