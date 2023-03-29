<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

caption {
	margin-bottom: 5px;
	color: gray;
}

table {
	border-collapse: collapse;
}

th {
	padding: 5px 0 5px 0;
	background-color: gray;
	color: white;
	border-color: white;
}

a {
	text-decoration: none;
	color: black;
}

.td {
	padding-left: 5px;
}

td a {
	margin-top: 10px;
	padding: 10px 0 10px 0;
}

a:hover {
	font-weight: bold;
}

.c {
	position: relative;
	padding: 3px 0 3px 0;
	color: gray;
}

#reg {
	position: absolute;
	width: 49px;
	right: 1px;
	top: 2px;
}
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

			<tr>
				
				<c:if test="${vo.del_info ne -1 }">
					<td align="center">${ vo.idx }</td>
				</c:if>
				
				<c:if test="${vo.del_info eq -1 }">
					<td align="center"></td>
				</c:if>
				<td align="center">${ vo.name }</td>
				<td class="td">
					<!-- 댓글 들여쓰기 -->
					<c:forEach begin="1" end="${vo.depth}">&nbsp;</c:forEach>
					<!-- 댓글 기호 표시 -->
					<!-- depth가 0이 아니면 댓글 -->
					<c:if test="${vo.depth ne 0 }">└</c:if>
					<c:if test="${vo.del_info ne -1 }">
						<a href="view.do?idx=${vo.idx}">${ vo.subject}</a>
					</c:if>
					<c:if test="${vo.del_info eq -1 }">
						<font color="gray">이미 삭제된 게시글입니다</font>
					</c:if>
				</td>
				<td align="center">${ vo.regdate }</td>
				<td align="center">${ vo.readhit }</td>
			</tr>


		</c:forEach>

		<!-- 새글쓰기 버튼 -->
		<tr>
			<td class="c" colspan="5" align="center" style="cursor: pointer;">
				◀&nbsp;&nbsp;&nbsp; 1 &nbsp;&nbsp;&nbsp; 2 &nbsp;&nbsp;&nbsp; 3 &nbsp;&nbsp;&nbsp; ▶

				<img id="reg" src="img/btn_reg.gif" onclick="location.href='insert_form.jsp'"
					style="cursor: pointer;">
			</td>
		</tr>


	</table>
</body>
</html>











