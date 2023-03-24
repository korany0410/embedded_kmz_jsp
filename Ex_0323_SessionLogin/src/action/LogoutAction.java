package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutAction
 */
@WebServlet("/logout.do")
public class LogoutAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션은 어느페이지에서나 필요하면 다 가져다 쓸 수있다
		
		//세션에 저장되어있는 user라는 이름을 제거
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		RequestDispatcher disp = request.getRequestDispatcher("login_form.jsp");
		disp.forward(request,response);
		
		
		
		
		
		
	}

}
