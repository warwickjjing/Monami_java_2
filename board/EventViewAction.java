package com.monami.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.EventBoardDAO;
import com.monami.board.dao.EventBoardDTO;
import com.monami.board.dao.EventFileDAO;

public class EventViewAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			

		EventBoardDAO ebdao = new EventBoardDAO();
		
		String event_writer = req.getParameter("event_writer");
		String page = req.getParameter("page");
		int event_idx = Integer.parseInt(req.getParameter("event_idx"));
		EventBoardDTO board = ebdao.getDetail(event_idx);
		String nidx = ebdao.getNextPage(event_idx);
		String pidx = ebdao.getPrevPage(event_idx);
		EventFileDAO efdao = new EventFileDAO();
		req.setAttribute("files", efdao.getFiles(event_idx));		
		req.setAttribute("board", board);
		req.setAttribute("page", page);
		req.setAttribute("nidx", nidx);
		req.setAttribute("pidx", pidx);


		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/geunseok/eventview.jsp");
		return transfer;
	}
}
