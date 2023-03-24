<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	제목 : ${ title } <br>
	
	<!-- img태그는 webcontent상의 경로로만 접근이 가능하기 때문에 
	c드라이브에 저장되어있는 이미지를 불러올 수 없다 -->
	<img src="upload/${ filename }"> <!-- 상대경로로 접근하는 거지만 절대경로와 연결되어있으므로 절대경로에서 가져올 수 있다  -->
</body>
</html>