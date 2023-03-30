package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardViewAction
 */
@WebServlet("/view.do")
public class BoardViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// view.do?idx=22
		int idx = Integer.parseInt(request.getParameter("idx"));
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		System.out.println(page);

		// 받아온 idx에 해당되는 게시글 한건 조회
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.selectOne(idx);

		// 조회수 관리를 위한 session 영역
		HttpSession session = request.getSession();
		String check = (String) session.getAttribute("check");

		if (check == null) {
			// 조회수 증가
			dao.update_readhit(idx);
			session.setAttribute("check", "");
		}
		// request영역에 vo를 바인딩
		request.setAttribute("vo", vo);
		request.setAttribute("page", page);
		request.setAttribute("search", search);
		request.setAttribute("search_text", search_text);
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
	}

}
