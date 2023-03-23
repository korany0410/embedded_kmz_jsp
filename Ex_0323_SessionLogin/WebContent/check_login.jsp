<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ empty user}">
	<script>
		alert("로그인 후 이용하세요");
		location.href = "login_form.jsp"
	</script>
</c:if>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>체크로그인
</body>
</html>