<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	request.setCharacterEncoding("utf-8");
    
    //. sung_del.jsp?no=1
    int no = Integer.parseInt(request.getParameter("no"));
    
    //삭제할 학생번호를 dao에 전달
    SjDAO.getInstance().delete(no);
    response.sendRedirect("student.jsp");
    
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