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
@WebServlet("/list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	

		//1) 전체 목록 조회
		List<BoardVO> list = BoardDAO.getInstance().selectList();
		
		// 2) DB에서 받아온 list를 바인딩
		request.setAttribute("list", list);
		
		// 4) 세션에 기록되어있는 check정보 삭제
		request.getSession().removeAttribute("check");
		
		// 3) DB에서 받아온 list를 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
		
		
		
		
	}

}
