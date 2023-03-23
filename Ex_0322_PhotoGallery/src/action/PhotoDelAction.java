package action;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/photo_del.do")
public class PhotoDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		PhotoVO vo = PhotoDAO.getInstance().selectOne(idx);
		
		//절대경로로 들어가서 삭제
		String web_path = "/upload/";
		ServletContext app = request.getServletContext();
		
		//상대경로 -> 절대경로
		String path = app.getRealPath(web_path);
		
		//db로 접근하여 idx에 해당하는 게시글을 삭제 (DAO로 넘어가서 요청)
		//int 타입으로 반환받아서 res가 0이면 지워짐
		int res = PhotoDAO.getInstance().delete(idx);
		
		if(res > 0) {
			//db에서 데이터를 삭제하는데 성공했다면, 절대경로의 이미지도 함께 삭제
			File f = new File(path, vo.getFilename());
			
			if(f.exists()) {
				f.delete(); //파일제거
			}
		}
		 
		//최종결과를 jsp의 callback메서드로 전달
		response.getWriter().print( res );
		
	}

}






















