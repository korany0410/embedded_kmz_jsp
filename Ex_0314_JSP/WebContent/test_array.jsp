<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String[] fruit = { "사과", "배", "오렌지", "참외", "복숭아" };
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일 배열 출력 scriptlet과 java코드 섞어만들기 </title>
</head>
<body>
	<%-- 	
		이렇게 쓰는 건 너무 비효율적!
		<%= fruit[0] %>
		<%= fruit[1] %>     
		for문을 써서 
		자바코드를 가지고 fruit내용을 출력  
	--%>
	<ul>
		<% for (int i = 0; i < fruit.length; i++){ %> 
			<li><%= fruit[i] %></li>
			
		<%} %>

	</ul>





</body>
</html>