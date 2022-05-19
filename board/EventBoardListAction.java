package com.monami.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.EventBoardDAO;
import com.monami.board.dao.EventBoardDTO;
import com.monami.board.dao.EventFileDAO;
import com.monami.board.dao.EventFileDTO;

public class EventBoardListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EventBoardDAO ebdao = new EventBoardDAO();
		EventFileDAO efdao = new EventFileDAO();
		//첫페이지는 아무것도 없으므로 null일것이다.
		String temp = req.getParameter("page");
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		//한 페이지에 보여줄 게시글의 개수
		int pageSize = 10;
		//페이징 처리시 보여줄 페이지의 개수
		int pageCnt = 10;
		
		int totalCnt = ebdao.getBoardCnt();

		
		//행 0~9 10~19 20~29 
		int startRow = (page-1)*pageSize;
		
		//1~10 페이지 11~20페이지 보여주기
		int startPage = ((page-1)/pageCnt)*pageCnt+1;
		int endPage = startPage+pageCnt-1;
		
		int totalPage = (totalCnt-1)/pageSize+1;
		

		endPage = endPage>totalPage ? totalPage : endPage;
		
		List<EventBoardDTO> boardList = ebdao.getBoardList(startRow,pageSize);
		List<EventFileDTO> filelist = efdao.getFileList(startRow,pageSize);
		

		req.setAttribute("boardList", boardList);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("filelist", filelist);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);

		
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/geunseok/eventlist.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}