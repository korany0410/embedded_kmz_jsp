package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jumin.do")
public class JuminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//jumin.do?jumin=990211-1144789
		String jumin = request.getParameter("jumin");
		char gender = jumin.charAt(7); // '1' '2' '3' '4'
		
		String genResult = "남자";
		// gender 는 int가 아닌 char인데 gender/2
		// '1'/2 여서 는 아스키 코드값으로 변환된 31/2 로 계산된다.
		if(gender % 2 == 0) {
			genResult = "여자";
		}
		
		String season = jumin.substring(2,4);
		String seasonResult = "";
		
		switch (season) {
		case "03":
		case "04":
		case "05":
			seasonResult = "봄";
			break;
			
		case "06":
		case "07":
		case "08":
			seasonResult = "여름";
			break;
			
		case "09":
		case "10":
		case "11":
			seasonResult = "가을";
			break;
			
		case "12":
		case "01":
		case "02":
			seasonResult = "겨울";
			break;

	
		}
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
			out.print("<body>");
				out.print("<table border='1'>");
				
					out.print("<tr>");
						out.print("<td>주민번호</td>");
						out.printf("<td>%s</td>",jumin);
					out.print("</tr>");
					
					out.print("<tr>");
						out.print("<td>성별</td>");
						out.printf("<td>%s</td>",genResult);
					out.print("</tr>");
					
					out.print("<tr>");
						out.print("<td>계절</td>");
						out.printf("<td>%s</td>",seasonResult);
					out.print("</tr>");
				
				out.print("</table>");
			out.print("</body>");
		out.print("</html>");
		
		
		
	}

}
