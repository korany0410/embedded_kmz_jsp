package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc.do")
public class Calculator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//calc.do가 호출되면 service메서드가 실행된다!
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		//클라이언트 측에서 넘어온 su1과 su2에대한 파라미터 값을 받는다.
		//calc.do?su1=3&su2=2
		
		int su1 = Integer.parseInt(request.getParameter("su1"));
		//(request.getParameter("su1") : "3"
		int su2 = Integer.parseInt(request.getParameter("su2"));
		//(request.getParameter("su2")) : "2"
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		out.print("<html>");
		out.print("<body>");
		
			out.printf("+ 결과 : %d<br>", su1 + su2);
			out.printf("- 결과 : %d<br>", su1 - su2);
			out.printf("* 결과 : %d<br>", su1 * su2);
			out.printf("/ 결과 : %d<br>", su1 / su2);

		out.print("</body>");
		out.print("</html>");
	}

}
