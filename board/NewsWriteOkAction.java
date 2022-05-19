package com.monami.board;


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

public class NewsWriteOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NewsBoardDAO nbdao = new NewsBoardDAO();
		//파일이 저장될 경로
		String saveFolder = "D:\\0900_GB_SSH\\JSP\\workspace\\monami\\WebContent\\images";
		//저장될 파일의 크기(5MB)
		int size = 1024*1024*954;

		//cos
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
				"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		
		String systemname1 = multi.getFilesystemName("file1");
		if(systemname1 == null) {
			fcheck1 = true;
		}
		String orgname1 = multi.getOriginalFileName("file1");
		
		
		
		String news_title = multi.getParameter("news_title");
		String news_content = multi.getParameter("news_content");
		
		NewsBoardDTO news = new NewsBoardDTO();
		news.setNews_title(news_title);
		news.setNews_content(news_content);
		

		int news_idx = 0;
		ActionTo transfer = new ActionTo();
		if(nbdao.insertBoard(news)) {
			NewsFileDAO fdao = new NewsFileDAO();
			 news_idx = nbdao.getLastNum();
			if(!fcheck1) {
				NewsFileDTO file = new NewsFileDTO();
				file.setNews_idx(news_idx);
				file.setSystemname(systemname1);
				file.setOrgname(orgname1);
				
				fcheck1 = fdao.insertFile(file);
			}
			
			//fcheck1, fcheck2가 true라는 뜻
			//1. 원래 파일이 존재하지 않았음
			//2. 파일이 존재했고, 위의 DB처리까지 완벽하게 성공했음
			if(fcheck1 ) {
				transfer.setRedirect(true);
				transfer.setPath(req.getContextPath()+"/news/Newsview.bo?news_idx="+news_idx);
				return transfer;
			}
		}
		transfer.setPath(req.getContextPath()+"/news/Newsview.bo?w=f");	
		return transfer;
	}
	}
