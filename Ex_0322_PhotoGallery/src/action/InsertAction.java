package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class InsertAction
 */
@WebServlet("/insert.do")
public class InsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//절대경로 구하기
		//"/upload/"라는 상대경로를
		String web_path = "/upload/";
		
		//상대경로 ->  절대경로
		ServletContext app = request.getServletContext();
		//실제로 멀티파트리퀘스트에게 요청할 경로를 절대 경로로 바꾸기
		String path = app.getRealPath(web_path);
		System.out.println("절대경로 : " + path);
		
		//파일객체를 포함하고있는 업로드 처리ㅣ를 위한 객체
		MultipartRequest mr = new MultipartRequest( request, 
												path,
												1024 * 1024 * 10,
												"utf-8",
												new DefaultFileRenamePolicy()//동일파일명 해소를 위한 클래스파일
												);
		
		//업로드된 파일 정보 얻어오기
		String filename = "no_file";
		
		File f = mr.getFile("photo");
		
		if( f != null ) {
			filename = f.getName(); // 실제로 업로드된 filename변수에 저장
		}
		//파일 형태가 아닌 일반 파라미터 수신
		String title = mr.getParameter("title");
		String pwd = mr.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		//파라미터로 받아온 정보를 vo로 포장
		PhotoVO vo = new PhotoVO();
		vo.setFilename(filename);
		vo.setTitle(title);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		//DAO에게 요청
		PhotoDAO.getInstance().insert(vo);
		
		//추가된 정보를 새로 갱신하여 보여주기 list.do를 호출
		response.sendRedirect("list.do");
		
		
		
		
	}

}



























