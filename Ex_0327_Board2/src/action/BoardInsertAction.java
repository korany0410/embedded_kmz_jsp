package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;


@WebServlet("/insert.do")
public class BoardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		// jsp에서 요청받은 정보를 db에 넣기 위해선 
		// dao를 거쳐서 mapper로 이동해야한다.
		// 	mapper는 정보를 딱 한개만 받을 수있기 때문에 vo로 묶어서 보낸다.
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		//BoardDAO 클래스의 insert() 메소드를 이용해 데이터베이스에 저장
		BoardDAO.getInstance().insert(vo);
		
		//사용자를 게시글 목록 페이지(list.do)로 리다이렉트
		response.sendRedirect("list.do");
		
		
		
		
		
	}

}
