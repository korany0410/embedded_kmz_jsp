package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import util.Common;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAction
 */
@WebServlet("/list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리하기 시작
		// list.do?page=2
		// list.do?
		int nowPage = 1;
		// String으로 지정한 이유는 오류가 나지 않게.기본 자료형은 null값 체크가 불가함
		String page = request.getParameter("page"); 
		if(page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		//한페이지에 표시될 게시물의 시작과 끝 번호 계산
		//1페이지 : 1~5 까지의 게시글
		//2페이지 : 6~10 까지의 게시글
		//공식으로 처리하기
		int start = (nowPage -1)*Common.Board.BLOCKLIST + 1;
		int end = nowPage * Common.Board.BLOCKLIST;
		//위의 시작번호와 끝번호를 db(dao를 거쳐 mapper)에 보내야 함
		
		//map만들기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		

		//1) 전체 목록 조회
		List<BoardVO> list = null;
		BoardDAO dao = BoardDAO.getInstance();
		
		//페이지 별 목록을 map으로 보내기
		list = dao.selectList(map);
		
		// 2) DB에서 받아온 list를 바인딩
		request.setAttribute("list", list);

		// 4) 세션에10 기록되어있는 check정보 삭제
		request.getSession().removeAttribute("check");
		
		
		// 3) DB에서 받아온 list를 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
		
		
		
		
	}

}
