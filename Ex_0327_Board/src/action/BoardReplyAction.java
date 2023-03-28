package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;


@WebServlet("/reply.do")
public class BoardReplyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//댓글 처리 서블릿
		
		//한글파일 안깨지게
		request.setCharacterEncoding("utf-8");
		
		//넘어온 파라미터 모두 받기
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//기준글 idx를 통해 댓글을 달고싶은 원본글의 정보 얻어오기
		BoardVO baseVO = dao.selectOne(idx);
		
		//기준글(baseVO) 의 step보다 큰 값들은 모두 step = step + 1
		dao.update_step(baseVO);
		
		//댓글 정보를 vo에 저장
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		//댓글이 들어갈 위치 선정
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep() +1 );
		vo.setDepth(baseVO.getDepth() +1 );
		
		dao.reply(vo);
		response.sendRedirect("list.do");
		
	}

}
