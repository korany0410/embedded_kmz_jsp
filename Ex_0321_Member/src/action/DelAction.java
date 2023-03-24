package action;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

/**
 * Servlet implementation class DelAction
 */
@WebServlet("/member_del.do")
public class DelAction extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//member_del.do?idx=2'
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//idx번호를 데이터베이스에 보내주기(MemberDAO로)
		//( res는 정수구조의 데이터	. 잘 지워졌으면 res=1  안지워졌으면 res=0 )
		int res = MemberDAO.getInstance().delete(idx);
		
		String param = "no";
		if(res>0) {
			//삭제 성공시 param을 yes로 변경
			param = "yes";	
		}
		
		//json구조로하면
		//String resultStr = String.format("[{'res':'%'}", param);
		
		//콜백 메서드로 복귀
		response.getWriter().print(param);
	}

}
