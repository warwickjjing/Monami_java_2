package com.monami.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.EventBoardDAO;
import com.monami.board.dao.EventFileDAO;

public class EventModifyAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EventBoardDAO ebdao = new EventBoardDAO();
		EventFileDAO efdao = new EventFileDAO();
		int event_idx = Integer.parseInt(req.getParameter("event_idx"));

		
		req.setAttribute("board",ebdao.getDetail(event_idx));
		req.setAttribute("files", efdao.getFiles(event_idx));
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/geunseok/eventmodify.jsp");
		return transfer;
	}
}