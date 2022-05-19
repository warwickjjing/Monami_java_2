package com.monami.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.EventBoardDAO;
import com.monami.board.dao.EventFileDAO;

public class EventRemoveAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EventBoardDAO ebdao = new EventBoardDAO();
		EventFileDAO efdao = new EventFileDAO();
		int event_idx = Integer.parseInt(req.getParameter("event_idx"));

		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if (ebdao.removeBoard(event_idx)) {
			if (efdao.getFiles(event_idx) != null) {
				efdao.removeFile(event_idx);
				transfer.setPath(req.getContextPath() + "/event/EventList.bo");
			}
			transfer.setPath(req.getContextPath() + "/event/EventList.bo");
		} else {
			transfer.setPath(req.getContextPath() + "/event/EventView.bo?event_idx=" + event_idx);
		}
		return transfer;
	}
}