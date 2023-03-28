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

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DAO의 전체 게시물 조회 메서드인 selectList()를 호출한 뒤
		// 게시글 목록을 가져와 List<BoardVO> 형태로 반환
		List<BoardVO> list = BoardDAO.getInstance().selectList();
		
		//db에서 받아온 리스트를 바인딩
		// "list"라는 이름으로 list 변수를 저장
		request.setAttribute("list", list);
		
		//db에서 받아온 리스트를 포워딩
		//"board_list.jsp"라는 페이지에 대한 RequestDispatcher 객체를 생성
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		
		// "board_list.jsp" 페이지로 request를 전달
		disp.forward(request, response);
		
	}

}
