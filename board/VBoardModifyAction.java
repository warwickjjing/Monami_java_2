package com.monami.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.VBoardDAO;
import com.monami.board.dao.VBoardDTO;

public class VBoardModifyAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		VBoardDTO vdto = new VBoardDTO();
		VBoardDAO vdao = new VBoardDAO();
		
		String video_idx = req.getParameter("video_idx");
		String video_title = req.getParameter("video_title");
		String video_content = req.getParameter("video_content");
		
		vdto.setVideo_title(video_title);
		vdto.setVideo_content(video_content);
		
		if(vdao.updateVBoard(vdto)) {
			ActionTo transfer = new ActionTo();
			transfer.setRedirect(true);
			transfer.setPath("/teamin/monami_video1.jsp");
		}
		
		return null;
	}
}
