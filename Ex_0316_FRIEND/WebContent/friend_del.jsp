<%@page import="dao.FriendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    
    
    int no = Integer.parseInt(request.getParameter("no"));
    
    //삭제할 학생번호를 dao에 전달
    FriendDAO.getInstance().delete(no);
    response.sendRedirect("friend.jsp");
    
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