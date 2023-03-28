package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardUpdateAction
 */
@WebServlet("/update.do")
public class BoardUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//받아온 idx에 해당되는 게시글 한건 조회
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.selectOne(idx);
		
		
		request.setAttribute("vo", vo);
		RequestDispatcher disp = request.getRequestDispatcher("update_form.jsp");
		disp.forward(request, response);
	}

}
