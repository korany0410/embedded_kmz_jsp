package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/insert.do")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//insert.do?id=MyBlueStar&pwd=8888&name=왕푸른별&..
		
		//post방식으로 받아왔을때 한글 안깨지게 하기
		request.setCharacterEncoding("utf-8");
		
		//DAO를 거치지 않으면 DB에 들어갈 수 없다 그래서 DAO에 회원을 추가하는 VO메서드를 만들어둠!
		//데이터들 요청받기
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		//DAO로 전달할 파라미터들을 VO로 묶기
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setAddr(addr);
		
		//회원추가
		MemberDAO.getInstance().insert(vo);
		
		//location.href="" "member_list.do"로 돌아가
		response.sendRedirect("member_list.do");
		
		
		
		
		
	}
}










