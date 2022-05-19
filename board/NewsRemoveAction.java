package com.monami.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.NewsBoardDAO;

public class NewsRemoveAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NewsBoardDAO nbdao = new NewsBoardDAO();
		
		int news_idx = Integer.parseInt(req.getParameter("news_idx"));
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(nbdao.removeBoard(news_idx)){
			transfer.setPath(req.getContextPath()+"/news/NewsBoardList.bo?news_idx="+news_idx);
			}
		else {
			transfer.setPath(req.getContextPath()+"/news/Newsview.bo?news_idx="+news_idx);
		}
		return transfer;
	}
}