<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//DeptDAO dao = new DeptDAO();// 이렇게 못함 
	// 중복되게 생성자를 메모리 할당을 받을 수없게 싱클톤을 이용해 생성자 호출을 불가하게 해서
	DeptDAO dao = DeptDAO.getInstance();
	//코드를 줄임
	List<DeptVO> dept_list = dao.selectList();
	
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
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
		<!-- 개선된 for문 : 0번 부터 전부 다 출력하고싶을때 사용 -->
		<% for( DeptVO vo : dept_list ){ %>
		<tr>
			<td><%= vo.getDeptno() %></td>
			<td><%= vo.getDname() %></td>
			<td><%= vo.getLoc() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>