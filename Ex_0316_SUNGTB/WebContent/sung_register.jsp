<%@page import="vo.SjVO"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

//sung_input.jsp로부터 넘겨받은 파라미터 수신
String name = request.getParameter("name");
int kor = Integer.parseInt(request.getParameter("kor"));
int eng = Integer.parseInt(request.getParameter("eng"));
int mat = Integer.parseInt(request.getParameter("mat"));

SjVO vo = new SjVO();
vo.setName(name);
vo.setKor(kor);
vo.setEng(eng);
vo.setMat(mat);

//dao에 이름, 국영수 정보를 전달
 int n = SjDAO.getInstance().insert(vo);

//등록에 성공했다면 student.jsp로 화면 전환
if(n == 1){
	//location.href="student.jsp" --> js코드라 java안에서 못씀
	response.sendRedirect("student.jsp"); //자바코드
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>