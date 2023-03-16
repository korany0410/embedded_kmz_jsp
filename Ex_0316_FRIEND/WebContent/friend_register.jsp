<%@page import="dao.FriendDAO"%>
<%@page import="vo.FriendVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	// friend_input.jsp로부터 넘겨받은 파라미터를 수신
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
	
	// 새로운 Friend정보 객체 생성
	FriendVO vo = new FriendVO();
	vo.setName(name);
	vo.setAge(age);
	vo.setTel(tel);
	
	//friendDAO에 새친구 정보 전달
	int n = FriendDAO.getInstance().insert(vo);
	//등록에 성공했다면 friend.jsp로 화면 전환
	if(n == 1){
		response.sendRedirect("friend.jsp"); //자바코드
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