package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class juminAction
 */
@WebServlet("/jumin.do")
public class juminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String jumin = request.getParameter("jumin");

		String gender = "";
		if (jumin.substring(7, 8).equals("1") || jumin.substring(7, 8).equals("3")) {
			gender = "남자";
		}else{
			gender = "여자";
		}

			String season = "";
			switch (jumin.substring(2, 4)) {
			case "03":
			case "04":
			case "05":
				season = "봄";
				break;
			case "06":
			case "07":
			case "08":
				season = "여름";
				break;
			case "09":
			case "10":
			case "11":
				season = "가을";
				break;
			case "12":
			case "01":
			case "02":
				season = "겨울";
				break;

			}

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<html>");
			out.print("<body>");

			out.print("<table>");
			out.print("<tr>");
				out.print("<td>주민번호</td>");
				out.print("<td>"+jumin+"</td>");
			out.print("</tr>");

			out.print("<tr>");
				out.print("<td>성별</td>");
				out.print("<td>"+gender+"</td>");
			out.print("</tr>");

			out.print("<tr>");
				out.print("<td계절</td>");
				out.print("<td>"+season+"</td>");
			out.print("</tr>");

			out.print("</table>");

			out.print("</body>");
			out.print("</html>");

		}

	}

