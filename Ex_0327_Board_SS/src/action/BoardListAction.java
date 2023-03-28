package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAction
 */
@WebServlet("/boardList.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<BoardVO> list = BoardDAO.getInstance().select();
		
		request.setAttribute("list", list);
		
		//세션에 기록되어 있는 check정보를 삭제
		request.getSession().removeAttribute("check");
		
		
		RequestDispatcher disp = request.getRequestDispatcher("boardList.jsp");
		disp.forward(request, response);
		
	}

}
