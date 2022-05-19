package com.monami.app.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.product.dao.ProductDAO;
import com.monami.app.product.dao.ProductDTO;

public class ProductListAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ProductDAO pdao = new ProductDAO();
		
		String temp = req.getParameter("page");
		String keyword = req.getParameter("keyword");
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		//한 페이지에 보여줄 게시글의 개수
		int pageSize = 10;
		//페이징 처리시 보여줄 페이지의 개수
		int pageCnt = 10;
		
		int totalCnt = pdao.getProductCnt(keyword);
//		int searchCnt = pdao.getSearchCnt();
		int startRow = (page-1)*pageSize;
		
		int startPage = ((page-1)/pageCnt)*pageCnt+1;
		int endPage = startPage+pageCnt-1;
		
		int totalPage = (totalCnt-1)/pageSize+1;
		
		endPage = endPage>totalPage ? totalPage : endPage;
		
		List<ProductDTO> productList = pdao.getProductList(startRow,pageSize,keyword);
		
		req.setAttribute("productList", productList);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("keyword", keyword);
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/kyungchul/search.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
	
	
}
