<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- check_login.jsp가 body에서 가장 먼저 호출되도록 한다 -->
	<jsp:include page="check_login.jsp"/>
	
	${user.name } 님 환영합니다 <br>
	<input type="button" value="로그아웃" onclick="location.href='logout.do'">
</body>
</html>