package com.monami.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.board.dao.EventFileDAO;
import com.monami.board.dao.EventFileDTO;

public class EFileDownloadAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//서버에 저장되어 있는 파일의 이름(변형 되었을수도 있는 이름))
		String systemname = req.getParameter("systemname");
		//그 파일을 올릴때의 이름
		String orgname = req.getParameter("orgname");
		System.out.println(orgname);
		
		String saveFolder = "D:\\0900_GB_SSH\\JSP\\workspace\\monami\\WebContent\\images";
		
		//D:\\jsp_file\\11.PNG
		String filename = saveFolder+"\\"+systemname;
		
		InputStream is = null;
		OutputStream os = null;
		
		//다운받으려는 파일을 자바의 객체로 가져옴(파일에 대한 정보들을 가지고있고, 그 파일을 쉽게 관리할 수 있도록 도와줌)
		File file = new File(filename);
		//파일을 향한 통로 개설
		is = new FileInputStream(file);

		//다운로드를 요청한 사용자의 로컬 정보가 담긴 헤더
		String client = req.getHeader("User-Agent");

		resp.reset();
		
		//파일을 응답해줄 준비, 세팅
		resp.setContentType("application/octet-stream");//이진데이터
		resp.setHeader("Content-Description", "JSP Generated Data");
		
		String dwName = "";
		
		try {
			//이름 인코딩
			try {
				dwName = URLEncoder.encode(orgname,"UTF-8").replaceAll("\\+", "%20");
			} catch (Exception e) {
				dwName = URLEncoder.encode(file.getName(),"UTF-8").replaceAll("\\+", "%20");
			}
			//클라이언트의 로컬 정보를 담은 client 변수 안에 MSIE 문자열이 포함되어 있는지를 비교(없으면 -1, 있으면 ??)
			if(client.indexOf("MSIE") != -1) {
				//MSIE 인 경우
				resp.setHeader("Content-Disposition", "attachment; fileName="+dwName);
			}
			else {
				//그 외
				resp.setHeader("Content-Disposition", "attachment; fileName=\""+dwName+"\"");
				resp.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			}
			resp.setHeader("Content-Length", file.length()+"");
			//응답 준비 완료
			//파일을 응답하기 위한 통로 개설(사용자의 컴퓨터에 써주기 위한 통로)
			os = resp.getOutputStream();
			
			//파일을 바이트단위로 쪼개서 담아줄 배열
			byte[] b = new byte[(int)file.length()];
			int len = 0;
			//while문 반복때마다 is.read() 수행해서 len에 대입
			//그 len이 -1이 아니라면 반복
			//len은 파일의 끝이 왔다면 -1이 담긴다.
			while((len = is.read(b,0,b.length)) != -1) {
				os.write(b,0,len);			
			}
		} catch (Exception e) {
			System.out.println("FileDownloadAction : "+e);
		} finally {
			if(is != null) {
				is.close();
			}
			if(os != null) {
				os.close();
			}
		}
		return null;
}
	}