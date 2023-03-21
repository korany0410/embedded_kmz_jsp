package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;


@WebServlet("/check_id.do")
public class CheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//check_id.do?id=mybluestar
		String id = request.getParameter("id");
		
		//id중복검사
		MemberVO vo =  MemberDAO.getInstance().selectOne(id);
		
		String res = "no";
		
		// vo == null이란건 아이디 가입이 가능한 상태
		if( vo == null ) {
			res = "yes";
		}
		//결과  res값을 갖고 json형태로 담기
		String resultStr = String.format("[{'result':'%s'}]", res);
		
		//resultStr을 콜백메서드로 전송
		response.getWriter().print(resultStr);
	}

}
