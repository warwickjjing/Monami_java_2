package com.monami.board;

import java.io.File;
import java.util.List;

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

public class EventModifyOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String saveFolder = "D:\\0900_GB_SSH\\JSP\\workspace\\monami\\WebContent\\images";
		int size = 1024*1024*954;
		
		EventBoardDAO ebdao = new EventBoardDAO();
		EventFileDAO efdao = new EventFileDAO();
		MultipartRequest multi = new MultipartRequest(req, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());
		
		String event_title = multi.getParameter("event_title");
		String event_startdate = multi.getParameter("event_startdate");
		String event_enddate = multi.getParameter("event_enddate");
		String event_content = multi.getParameter("event_content");
		int event_idx = Integer.parseInt(multi.getParameter("event_idx"));

		
		EventBoardDTO board = new EventBoardDTO();
		board.setEvent_title(event_title);
		board.setEvent_startdate(event_startdate);
		board.setEvent_enddate(event_enddate);
		board.setEvent_content(event_content);
		board.setEvent_idx(event_idx);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(ebdao.updateBoard(board)) {
			String[] systemname = {
				multi.getFilesystemName("file1"),
				multi.getFilesystemName("file2")
			};
			String[] orgname = {
				multi.getOriginalFileName("file1"),	
				multi.getOriginalFileName("file2")	
			};
			//원래 이 글에 등록되어 있던 파일의 정보들
			List<EventFileDTO> files = efdao.getFiles(event_idx);
			//새롭게 이 게시글이 가지고 있어야 하는 파일명들
			String[] newFilenames = multi.getParameterValues("filename");
			//이 게시글이 실제로 가지고 있어야 하는 파일의 개수를 세고
			int cnt = 0;
			for(int i=0;i<newFilenames.length;i++) {
				if(newFilenames[i] != null && !newFilenames[i].equals("")) {
					cnt++;
				}
			}
			
			//그 개수만큼 반복하되
			for(int i=0;i<cnt;i++) {
				if(systemname[i] == null) {
					//실제 게시판이 가져야 하는 파일의 개수만큼 반복을 하며 날라온 type=file 데이터를 검사하는것
					//이 if문에 들어왔다면 가져야 하는 개수 안쪽이지만, 날라온 파일데이터는 없다는 뜻이므로
					//파일 수정을 하지 않았다는 뜻
				}
				else {
					//무언가 수정이 일어났다는 뜻
					if(files.size()>i) {
						//이 if문에 들어왔다면 기존에 존재하던 파일 대신 새로운 파일을 올렸다는 뜻
						//존재하던 file을 객체로 가져온 후
						File file = new File(saveFolder,files.get(i).getSystemname());
						//실제 파일이 존재한다면
						if(file.exists()) {
							//해당 파일 삭제
							file.delete();
						}
						//실제 파일이 삭제되었기 때문에 DB상에서도 정보를 지워주어야 한다.
						efdao.deleteByName(files.get(i).getSystemname());
					}
					//새롭게 올린 파일의 정보를 DB에 저장
					EventFileDTO efdto = new EventFileDTO();
					
					efdto.setEvent_idx(event_idx);
					efdto.setSystemname(systemname[i]);
					efdto.setOrgname(orgname[i]);
					efdao.insertFile(efdto);
				}
			}
			
			transfer.setPath(req.getContextPath()+"/event/EventView.bo?event_idx="+event_idx);
		}
		else {
			transfer.setPath(req.getContextPath()+"/event/EventView.bo?u=f&event_idx="+event_idx);
		}
		return transfer;
	}
}