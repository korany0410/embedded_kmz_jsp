package action;

import java.io.IOException;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;



@WebServlet("/member_list.do")
public class MemberListAction extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//dao에서 가져온 회원목록 가져오기 
		List<MemberVO> list = MemberDAO.getInstance().selectList(); 
		
		//list를 request영역에 저장
		request.setAttribute("list", list); //영역에 setAttribute로 저장하면 바인딩
		
		//바인딩된 정보를 출력하고자 하는 jsp로 포워딩
		//포워딩:저장한걸 어디서 쓸지 지정하는것
		RequestDispatcher disp = request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response);
		
		
		
	}

}






















