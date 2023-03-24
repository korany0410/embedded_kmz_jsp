<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 날짜데이터에서 00:00:00을 제거하기 위해 fuctions를 등록 -->
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
</head>
<body>
	<table border="1">
		<caption>:::사원 목록:::</caption>
		<tr>
			<th>사번</th>
			<th>부서번호</th>
			<th>급여</th>
			<th>사원명</th>
			<th>직책</th>
			<th>입사일</th>
		</tr>
		<c:forEach var="vo" items="${ list }">
			<tr>
				<td>${vo.sabun}</td>
				<td>${vo.deptno}</td>
				<td>${vo.sapay}</td>
				<td>${vo.saname}</td>
				<td>${vo.sajob}</td>
				<td>${fn:split(vo.sahire, ' ')[0]}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>