package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/join.do")
public class Ex3_registerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		//join.do?id=a&pwd=1&age=2
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		int age = Integer.parseInt( request.getParameter("age") );
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
			out.print("<body>");
				out.print("회원가입 성공  <br> ");
				out.print("ID : " + id + "<br>");				
				out.print("PW : " + pwd + "<br>");				
				out.print("나이 : " + age );				
			out.print("</body>");
		out.print("</html>");
		
		
		
		
		
		
	}

}
