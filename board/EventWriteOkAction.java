package com.monami.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.EventBoardDAO;
import com.monami.board.dao.EventBoardDTO;
import com.monami.board.dao.EventFileDAO;
import com.monami.board.dao.EventFileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class EventWriteOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EventBoardDAO ebdao = new EventBoardDAO();
		//파일이 저장될 경로
		String saveFolder = "D:\\0900_GB_SSH\\JSP\\workspace\\monami\\WebContent\\images";
		//저장될 파일의 크기(5MB)
		int size = 1024*1024*5;

		//cos
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
				"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		String systemname1 = multi.getFilesystemName("file1");
		if(systemname1 == null) {
			fcheck1 = true;
		}
		String orgname1 = multi.getOriginalFileName("file1");
		
		String systemname2 = multi.getFilesystemName("file2");
		if(systemname2 == null) {
			fcheck2 = true;
		}
		String orgname2 = multi.getOriginalFileName("file2");
		
		String event_title = multi.getParameter("event_title");
		/* String event_writer = multi.getParameter("event_writer"); */
		String event_startdate = multi.getParameter("event_startdate");
		String event_enddate = multi.getParameter("event_enddate");
		String event_content = multi.getParameter("event_content");
		
		EventBoardDTO event = new EventBoardDTO();
		event.setEvent_title(event_title);
		/* event.setEvent_writer(event_writer); */
		event.setEvent_startdate(event_startdate);
		event.setEvent_enddate(event_enddate);
		event.setEvent_content(event_content);
		

		int event_idx = 0;
		ActionTo transfer = new ActionTo();
		if(ebdao.insertBoard(event)) {
			EventFileDAO efdao = new EventFileDAO();
			 event_idx = ebdao.getLastNum();
			if(!fcheck1) {
				EventFileDTO file = new EventFileDTO();
				file.setEvent_idx(event_idx);
				file.setSystemname(systemname1);
				file.setOrgname(orgname1);
				
				fcheck1 = efdao.insertFile(file);
			}
			if(!fcheck2) {
				EventFileDTO file = new EventFileDTO();
				file.setEvent_idx(event_idx);
				file.setSystemname(systemname2);
				file.setOrgname(orgname2);
				
				fcheck2 = efdao.insertFile(file);
			}
			//fcheck1, fcheck2가 true라는 뜻
			//1. 원래 파일이 존재하지 않았음
			//2. 파일이 존재했고, 위의 DB처리까지 완벽하게 성공했음
			if(fcheck1 && fcheck2) {
				transfer.setRedirect(true);
				transfer.setPath(req.getContextPath()+"/event/EventView.bo?event_idx="+event_idx);
				return transfer;
			}
		}
		transfer.setPath(req.getContextPath()+"/event/EventList.bo?w=f");	
		return transfer;
	}
}