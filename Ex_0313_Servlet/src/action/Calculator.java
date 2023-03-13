package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calculator
 */
@WebServlet("/calc.do")
public class Calculator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		int su1 = Integer.parseInt( request.getParameter("su1"));
		int su2 = Integer.parseInt( request.getParameter("su2"));
		int resultPl = su1+su2;
		int resultMi = su1-su2;
		int resultMul = su1*su2;
		int resultDiv = su1/su2;
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		
			out.print("+ 결과 : " + resultPl +"<br>");
			out.print("- 결과 : " + resultMi +"<br>");
			out.print("* 결과 : " + resultMul +"<br>");
			out.print("/ 결과 : " + resultDiv +"<br>");
		
		out.print("</body>");
		out.print("</html>");
		
		
		
	}

}
