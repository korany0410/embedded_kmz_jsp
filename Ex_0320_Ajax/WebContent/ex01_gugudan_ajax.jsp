<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	//ex01_gugudan_ajax.jsp?dan=5
 	int dan = Integer.parseInt(request.getParameter("dan"));
 
 	//for문을 통해 html형태로 작성
 	String str = "";
 	for(int i = 1; i<=9; i++){
 		//변수에 값을 담을 수 있지만 printf와 같은 기능!
 		str += String.format( "%d X %d = %d<br>",dan,i,dan*i );
 	}
 	
 %>   
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= str %>
</body>
</html>