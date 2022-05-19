package com.monami.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.VBoardDAO;
import com.monami.board.dao.VBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class VBoardWriteOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		VBoardDTO vdto = new VBoardDTO();
		req.setCharacterEncoding("UTF-8");
		String savefolder = "D:\\0900_GB_SSH\\JSP\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\monami\\images";
		
		resp.setContentType("text/html;charset=utf-8");
		ActionTo transfer = new ActionTo();
		MultipartRequest multi = null;
		multi = new MultipartRequest(req, savefolder, 1024*1024*5,
				"UTF-8",new DefaultFileRenamePolicy());
		
		String filename = multi.getFilesystemName("video_img");
		String vtitle = multi.getParameter("video_title");
		String vcontent = multi.getParameter("video_content");
		System.out.println(filename);
		vdto.setVideo_title(vtitle);
		vdto.setVideo_content(vcontent);
		vdto.setVideo_img(filename);
		VBoardDAO vdao = new VBoardDAO();
		
		
		if(vdao.insertVideo(vdto)) {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/board/Videolist.bo");
			return transfer;
		}
		return transfer;
}
}
