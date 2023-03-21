<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!-- 조건, 반복문을 사용하기 위해  미리 준비-->
<!-- 
		Model 2 
		현재페이지와 같이 servlet을 통한 db조회와 결과 출력을 나눠서 작업하는 구조를 model2(MVC패턴) 구조라고 한다
			M (Model) : DAO
			V (View) : JSP
			C (Controller) :SERVLET
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버리스트</title>
<!-- Ajax 사용을 위한 js를 등록해준다 -->
<script src="js/httpRequest.js"></script>
</head>
<body>
	<table border="1">
		<caption>회원목록</caption>
		<tr> 
			<td colspan="7">
				<input type="button" value="회원가입" onclick="location.href='member_form.jsp'">
			</td>
		</tr>
		
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th colspan="2">주소</th>
		</tr>
		
		<c:forEach var="vo" items="${ list }">
		
			<tr>
				<td>${ vo.idx }</td>
				<td>${ vo.name }</td>
				<td>${ vo.id }</td>
				<td>${ vo.pwd }</td>
				<td>${ vo.email }</td>
				<td>${ vo.addr }</td>
				<td>
					<input type="button" value="삭제" onclick="del('${vo.idx}');">
				</td>
			</tr>
		
		</c:forEach>
		
	</table>
	
</body>
</html>