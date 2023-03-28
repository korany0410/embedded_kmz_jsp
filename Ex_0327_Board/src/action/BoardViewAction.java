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


@WebServlet("/view.do")
public class BoardViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//view.do?idx=22
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//받아온 idx에 해당되는 게시글 한건 조회
		BoardDAO dao = BoardDAO.getInstance();
		
		//dao로 넘어감
		BoardVO vo = dao.selectOne(idx);
		
		
		//조회수 관리를 위한 세션 영역
		HttpSession session = request.getSession();
		String check = (String)session.getAttribute("check");
		
		if( check == null ) {
			
			//조회수 증가
			dao.update_readhit( idx );
			session.setAttribute("check", "");
			
		}
		
		//정보를 가지고 돌아온 vo를 request영역에 바인딩
		request.setAttribute("vo", vo);
		
		//어디에서 보여줄 건지 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
		//board_view.jsp로 가서 만들기
		
		
		
		
		
		
		
		
		
		
		
	}

}
