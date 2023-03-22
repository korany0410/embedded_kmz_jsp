<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 스타일시트 참조 링크  -->
<link rel="stylesheet" href="css/photo.css">
</head>
<body>
	<div id="main_box">
		<h1>::PhotoGallery::</h1>
		
		<div align="center" style="margin:10px">
			<input type="button" value="사진등록"
				onclick="location.href='photo_insert_form.jsp'">
		</div>
		
		<div id="photo_box">
			<c:forEach var="vo" items="${ list }"> 
				<div class="photo_type">
					<img src="upload/${ vo.filename }">
					<div class="title">${ vo.title }</div>
					
					<div align="center">
						<input type="password" name="pwd2" size="10">
						<input type="button" value="삭제" onclick="del(this.form);">
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>