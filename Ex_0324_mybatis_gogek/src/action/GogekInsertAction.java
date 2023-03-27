package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

/**
 * Servlet implementation class GogekInsertAction
 */
@WebServlet("/insert_form.do")
public class GogekInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//post로 전달받은 정보의 한글이 깨지는 것을 방지해줘야함
		request.setCharacterEncoding("utf-8");
		
		//name, addr, jumin, godam 파라미터 받기
		// insert_from.do?name=홍길동&addr=서울시 관악구&jumin=801111....&godam=10;
		String name = request.getParameter("name");
		String addr= request.getParameter("addr");
		String jumin= request.getParameter("jumin");
		int godam= Integer.parseInt(request.getParameter("godam"));
		
		//정보들을 vo로 묶어서 dao에 전달
		GogekVO vo = new GogekVO();
		vo.setGoname(name);
		vo.setGoaddr(addr);
		vo.setGojumin(jumin);
		vo.setGodam(godam);
		
		GogekDAO.getInstance().insert(vo);
		//서블릿으로 보내기
		response.sendRedirect("list.do");
	}

}
