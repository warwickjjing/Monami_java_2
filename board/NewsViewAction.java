package com.monami.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.NewsBoardDAO;
import com.monami.board.dao.NewsBoardDTO;
import com.monami.board.dao.NewsFileDAO;
import com.monami.mybatis.SqlMapConfig;

public class NewsViewAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

			NewsBoardDAO nbdao = new NewsBoardDAO();
			
			String page = req.getParameter("page");
			int news_idx = Integer.parseInt(req.getParameter("news_idx"));
			NewsBoardDTO board = nbdao.getDetail(news_idx);
			String nidx = nbdao.getNextPage(news_idx);
			String pidx = nbdao.getPrevPage(news_idx);
			NewsFileDAO nfdao = new NewsFileDAO();
			req.setAttribute("files", nfdao.getFiles(news_idx));		
			req.setAttribute("board", board);
			req.setAttribute("page", page);
			req.setAttribute("nidx", nidx);
			req.setAttribute("pidx", pidx);


			
			ActionTo transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/teamin/newsview.jsp");
			return transfer;
			

	}
}