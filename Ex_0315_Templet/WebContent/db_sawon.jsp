<%@page import="vo.sawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.sawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	sawonDAO dao = sawonDAO.getInstance();
    	List<sawonVO> sawon_list = dao.selectList();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>부서번호</th>
			<th>사원연봉</th>
		</tr>
		<% for( sawonVO vo : sawon_list){ %>
		<tr>
			<td><%= vo.getSabun() %></td>
			<td><%= vo.getSaname()%></td>
			<td><%= vo.getDeptno()%></td>
			<td><%= vo.getSapay()%></td>
		</tr>
		<%} %>
	</table>
</body>
</html>