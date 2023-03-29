package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;


@WebServlet("/del.do")
public class BoardDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//보이지 않지만 파라미터 idx가 넘어오고 있음
		int idx = Integer.parseInt(request.getParameter("idx"));
		//update가 잘 되면1 안되면0
		//del.do?idx=3
		int res = BoardDAO.getInstance().update(idx);
	
		//삭제(된것처럼)가 완료되었는지에 대한 결고를 콜백메서드로 view.jsp의 resultFn으로 보낸다.
		response.getWriter().print(res);
		
	}

}
