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
import util.Paging;
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		//검색과 관련된 파라미터 받기
		String search = request.getParameter("search");//카테고리
		String search_text = request.getParameter("search_text");//검색내용
		
		//검색어가 입력되어있는 경우
		if( search != null && !search.equalsIgnoreCase("all") ) {
			  
			switch( search ) {
			
			case "name_subject_content":
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
				break;
				
			case "name":
				map.put("name", search_text);
				break;
				
			case "subject":
				map.put("subject", search_text);
				break;
				
			case "content":
				map.put("content", search_text);
				break;
			
			}//switch
			
		}
		

		//1) 전체 목록 조회
		List<BoardVO> list = null;
		BoardDAO dao = BoardDAO.getInstance();
		
		
		//페이지 별 목록을 map으로 보내기
		list = dao.selectList(map);
		
	    //페이지 메뉴 생성
		int row_total = dao.getRowTotal(map);
		
		String search_param = String.format("search=%s&search_text=%s", search, search_text );
		
		//하단 페이지 메뉴 생성 (검색한게 있으면 그것도 같이 보내주기)
		String pageMenu = Paging.getPaging("list.do", //url매핑과일치하게
											nowPage, // 현재 페이지 수
											row_total, // 전페 게시글의 수 
											search_param, //검색했을때
											Common.Board.BLOCKLIST, // 한페이지에 보여줄 게시글 수
											Common.Board.BLOCKPAGE);// 페이지 메뉴의 수
		
		
		// pageMenu를 바인딩
		request.setAttribute("pageMenu", pageMenu);
		
		// 2) DB에서 받아온 list를 바인딩
		request.setAttribute("list", list);

		// 4) 세션에10 기록되어있는 check정보 삭제
		request.getSession().removeAttribute("check");
		
		
		// 3) DB에서 받아온 list를 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
		
		
		
	}

}
