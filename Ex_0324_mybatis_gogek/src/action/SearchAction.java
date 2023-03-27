package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

/**
 * Servlet implementation class SearchAction
 */
@WebServlet("/gogek_search.do")
public class SearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		//get방식으로 보내옴
		//gogek_search.do?addr=서울시 마포구
		
		//아무것도 없을때 all이라고 채워서 mapper에 보내기 위해
		String search = "all";
		String addr = request.getParameter("addr");
		
		//.do? --> 파라미터에 아무것도 없을때 null
		//.do?addr= 빈값일때 -->'' , empty
		
		// 정상적으로 파라밑어가 전달 된 경우 ( 만약 null도 아니고 비어있지도 않다면)
		if( addr != null && !addr.isEmpty() ) {
				search = addr;
		}
		
		
		//목록 가져오기
		List<GogekVO> list = null;
		
		//search=all이어서 전체조회가 필요한 경우
		if(search .equals("all")) {
			//맨처음페이지에서 고객리스트를 모두 보여주기때문에 그 페이지를 가져오면 됨
			list = GogekDAO.getInstance().select();
			
		}else {
			list =  GogekDAO.getInstance().select(search);
		}
		
		//list 객체 바인딩 및 포워딩
		request.setAttribute("list", list);
		RequestDispatcher disp = 
				request.getRequestDispatcher("gogek_list.jsp");
		disp.forward(request, response);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
