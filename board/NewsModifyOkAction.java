package com.monami.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.NewsBoardDAO;
import com.monami.board.dao.NewsBoardDTO;
import com.monami.board.dao.NewsFileDAO;
import com.monami.board.dao.NewsFileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NewsModifyOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String saveFolder = "D:\\0900_GB_SSH\\JSP\\workspace\\monami\\WebContent\\images";
		int size = 1024*1024*5;
		
		NewsBoardDAO nbdao = new NewsBoardDAO();
		NewsFileDAO nfdao = new NewsFileDAO();
		MultipartRequest multi = new MultipartRequest(req, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());
		
		String news_title = multi.getParameter("news_title");
		String news_content = multi.getParameter("news_content");
		int news_idx = Integer.parseInt(multi.getParameter("news_idx"));

		
		NewsBoardDTO board = new NewsBoardDTO();
		board.setNews_title(news_title);
		board.setNews_content(news_content);
		board.setNews_idx(news_idx);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(nbdao.updateBoard(board)) {
			String[] systemname = {
				multi.getFilesystemName("file1")
			};
			String[] orgname = {
				multi.getOriginalFileName("file1")
			};
			//원래 이 글에 등록되어 있던 파일의 정보들
			List<NewsFileDTO> files = nfdao.getFiles(news_idx);
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
						nfdao.deleteByName(files.get(i).getSystemname());
					}
					//새롭게 올린 파일의 정보를 DB에 저장
					NewsFileDTO fdto = new NewsFileDTO();
					fdto.setNews_idx(news_idx);
					fdto.setSystemname(systemname[i]);
					fdto.setOrgname(orgname[i]);
					nfdao.insertFile(fdto);
				}
			}
			
			transfer.setPath(req.getContextPath()+"/news/Newsview.bo?news_idx="+news_idx);
		}
		else {
			transfer.setPath(req.getContextPath()+"/news/Newsview.bo?u=f&news_idx="+news_idx);
		}
		return transfer;
	}
}
