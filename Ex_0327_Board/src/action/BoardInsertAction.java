package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardInsertAction
 */
@WebServlet("/insert.do")
public class BoardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//post로 전달받은 정보의 한글이 깨지는 것을 방지해줘야함
		request.setCharacterEncoding("utf-8");
		
		
		// insert_form.jsp로 부터 넘어온 파라미터 수신
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		//접속자의 ip구하기 : getRemoteAddr();
		String ip = request.getRemoteAddr();
		
		
		//insert정보들을 mapper에 정보들을 전달하고싶은데 mapper는 파라미터를 딱한개만 받을 수 있으므로 vo로 묶어서
		//dao를 거쳐 mapper에 전달하게 된다.
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		//데이터베이스에 정보추가
		BoardDAO.getInstance().insert(vo);
		
		response.sendRedirect("list.do");
		
		
		
		
		
		
		
		
	}

}
