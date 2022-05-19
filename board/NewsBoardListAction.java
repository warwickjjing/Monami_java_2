package com.monami.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.NewsBoardDAO;
import com.monami.board.dao.NewsBoardDTO;

public class NewsBoardListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NewsBoardDAO nbdao = new NewsBoardDAO();
		
		//첫페이지는 아무것도 없으므로 null일것이다.
		String temp = req.getParameter("page");
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		//한 페이지에 보여줄 게시글의 개수
		int pageSize = 10;
		//페이징 처리시 보여줄 페이지의 개수
		int pageCnt = 10;
		
		int totalCnt = nbdao.getBoardCnt();

		
		//행 0~9 10~19 20~29 
		int startRow = (page-1)*pageSize;
		
		//1~10 페이지 11~20페이지 보여주기
		int startPage = ((page-1)/pageCnt)*pageCnt+1;
		int endPage = startPage+pageCnt-1;
		
		int totalPage = (totalCnt-1)/pageSize+1;
		

		endPage = endPage>totalPage ? totalPage : endPage;
		
		List<NewsBoardDTO> boardList = nbdao.getBoardList(startRow,pageSize);

		req.setAttribute("boardList", boardList);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);

		
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/teamin/newslist.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}