package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadAction
 */
@WebServlet("/upload.do")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		//웹컨텐트에 파일을 만들면 상대경로가 반드시 만들어짐 절대경로에서는 클라이언트에게 받은 정보들을 담는다. 
		// 업로드 폴더에 절대경로에 사진을 올렸어야한다. C:드라이브가 아닌 상대경로에 연결되어있는 절대 경로에 저장을 해야한다.
		//String path = "C:/upload"; -->c드라이브 경로
		
		//"/upload/" : 
		String web_path = "/upload/";
		//현재 프로젝트(WebApplication)을 관리하는 객체
		ServletContext app = request.getServletContext(); //request를 통해서 정보를 받는다.
		
		// 상대경로의 데이터를 절대경로로 변환
		String path = app.getRealPath(web_path); //path가 
		System.out.println("절대경로 : " + path);
		// print결과 
		
				
		int max_size = 1024 * 1024 * 100; // 최대 업로드 용량(100mb까지 넣을 수있지만 1mb가 들어와도 메모리를 차지하지 않음)
		
		// 파일을 포함한 업로드를 처리하기위한 객체
		// 원래는 request로 파일은 받을 수없다(문자열형식이 아니기 때문) 
		MultipartRequest mr = new MultipartRequest(
										request, //서블릿에서 위임받은 리퀘스트
										path, //저장경로
										max_size, //최대 업로드 용량
										"utf-8",
										new DefaultFileRenamePolicy() // 동일 파일명 정책을 지켜주기위한 클래스
										//(파일명이 중복 되었을때 나중 추가파일명을 자동으로 바꿔줌)
										);
		
		// 업로드된 파일정보 얻어오기
		String filename = "no_file";
		
		File f = mr.getFile("photo");
		if( f != null ) {
			filename = f.getName(); //업로드 된 파일 이름
		}
		
		// 파일형식이 아닌 일반 파라미터 수신
		String title = mr.getParameter("title"); //0
		
		// 파일 이름과 제목을 바인딩
		request.setAttribute("title", title);
		request.setAttribute("filename", filename );
		
		
		//포워딩
		RequestDispatcher disp = 
					request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
		

		
	}

	
}



























