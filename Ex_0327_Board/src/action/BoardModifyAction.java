package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;


@WebServlet("/modify.do")
public class BoardModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("utf-8");
		
		//게시글 화면에서 비밀번호를입력하고 수정버튼을 눌렀을떄
		//idx요청받음
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		BoardVO vo = new BoardVO();
		vo.setIdx(idx);
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		
		//BoardDAO를 싱글톤으로 생성한뒤, 
		//modify()를 호출하여 매개변수vo를 db에 반영->게시글이 수정됨
		BoardDAO.getInstance().modify(vo);
		response.sendRedirect("list.do");
		
		
		
		
		
		
		
		
		
		
		
	}

}
