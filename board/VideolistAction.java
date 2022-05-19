package com.monami.board;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.VBoardDAO;
import com.monami.board.dao.VBoardDTO;

public class VideolistAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		VBoardDAO vdao = new VBoardDAO();
		String temp = req.getParameter("page");
//		PrintWriter out = resp.getWriter();
//		out.write("<script>alert('abc');</script>");
		int page = temp == null ? 1: Integer.parseInt(temp);
		int pageSize = 12;
		int pageCnt = 5; 
		int totalCnt = vdao.getBoardCnt();
		int startRow=(page-1)*pageSize;
		int startPage = ((page-1)/pageCnt)*pageCnt+1;
		int endPage = startPage+pageCnt-1;
		int totalPage = (totalCnt-1)/pageSize+1;
		int last_idx = vdao.getLastIndex();
		endPage = endPage>totalPage ? totalPage : endPage;
		List<VBoardDTO> boardList = vdao.getBoardList(startRow,pageSize);
		req.setAttribute("last_idx", last_idx);
		req.setAttribute("boardList", boardList);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/teamin/monami_video1.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
