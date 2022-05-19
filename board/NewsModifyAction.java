package com.monami.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.NewsBoardDAO;
import com.monami.board.dao.NewsFileDAO;

public class NewsModifyAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NewsBoardDAO nbdao = new NewsBoardDAO();
		NewsFileDAO nfdao = new NewsFileDAO();
		int news_idx = Integer.parseInt(req.getParameter("news_idx"));

		
		req.setAttribute("board",nbdao.getDetail(news_idx));
		req.setAttribute("files", nfdao.getFiles(news_idx));
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/teamin/news_modify.jsp");
		return transfer;
		
	}
}