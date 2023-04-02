<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<!-- 외부 스타일시트 참조 링크  -->
<link rel="stylesheet" href="css/table.css">

</head>

<style>

</style>
<body>
	<table border="1" style="margin: 0 auto;" width="700">
		<caption>&lt;&nbsp;게시판&nbsp;&gt;</caption>
		<tr>
			<th width="50">번호</th>
			<th width="90">작성자</th>
			<th width="410">제목</th>
			<th width="100">작성일</th>
			<th width="50">조회수</th>
		</tr>
		<c:forEach var="vo" items="${list}">

			<!-- depth가 0인 글 제목만 보이게 하기 (댓글,대댓글은 게시물 리스트에서 안보이게) -->
			<c:if test="${vo.depth eq 0 }">
				<tr>
					<td align="center">${ vo.idx }</td>
					<td align="center">${ vo.name }</td>
					<td class="td">
						<a href="view.do?idx=${vo.idx}">${ vo.subject}</a>
					</td>
					<td align="center">${ vo.regdate }</td>
					<td align="center">${ vo.readhit }</td>
				</tr>
			</c:if>

		</c:forEach>

		<tr>
			<td class="c" colspan="5" align="center" style="cursor: pointer;">
				◀&nbsp;&nbsp;&nbsp; 1 &nbsp;&nbsp;&nbsp; 2 &nbsp;&nbsp;&nbsp; 3 &nbsp;&nbsp;&nbsp; ▶
				
				<!-- 새 글쓰기 버튼 -->
				<img id="reg" src="img/btn_reg.gif" onclick="location.href='insert_form.jsp'"
					style="cursor: pointer;">
			</td>
		</tr>


	</table>
</body>
</html>












