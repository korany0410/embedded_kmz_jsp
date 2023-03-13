package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet (server + let ) 1) 웹응용프로그램을 만드는 자바기술, 실행된 결과값을 html구조로 돌려준다 2) html은
 * 할 수없는 동적인 움직임을 구현할 수 있다. 3) 자바언어로 작성되어있어 자바의 일반적인 특징을 모두 갖고있다 4) 자동으로 스레딩 처리가
 * 된다 (동시다발적인 클라이언트의 요청에 대응하는것이 용이)
 */
@WebServlet("/hello.do") // url 매핑 ( 다른 서블릿과 동일한 이름으로 작성하면 X)
public class Ex1_HelloAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// url매핑이 호출되면 맨처음 실행되늰 메서드 (service)
		// request : 요청 처리 객체
		// response : 응답 처리 객체

		// 접속한 클라이언트의 ip를 출력
		String ip = request.getRemoteAddr(); // 접속자(request)의 ip
		System.out.println(ip + "님 환영합니다");

		System.out.println("---서블릿 객체의 service메서드가 호출됨---");

		// 응답처리객체를 통해 브라우저에 결과를 표기
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		
		out.print("<head>");
			out.print("<title>서블릿 예제</title>");
			out.print("<style>h1{color:red;}</style>");
		out.print("</head>");

		out.print("<body>");
		out.print("<h1>" + ip + "님 환영합니다</h1>"); // <-- PrintWriter를 통해 화면에 결과를 출력
		out.print("</body>");
		out.print("</html>");
	}

}
