<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
    <%!
    	// 선언부 :변수나 메서드를 정의하는 영역(전역변수 개념)
    	int n = 0;
    	Random rnd = new Random();
    	
    	public int plus(int a, int b){
    		return a + b;
    	}
    %>
    
    <%
    	// 스크립트 릿 : 지역변수의 개념
    	int n1 = 0;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<p><%= plus(10,5) %> </p>
	<p><%= "n: "+ n++ %> </p>
	<p><%= "n1: "+ n1++ %> </p>
	
</body>
</html>