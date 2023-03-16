<%@page import="vo.FriendVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.FriendDAO"%>
<%@page import="service.DBservice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//친구정보를 조회해서 표현
FriendDAO dao = FriendDAO.getInstance();
List<FriendVO> friend_list = dao.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<caption>친구정보</caption>
		<tr>
			<th>no</th>
			<th>이름</th>
			<th>나이</th>
			<th>전화</th>
			<th>비고</th>
		</tr>

		<%
			for (FriendVO vo : friend_list) {
		%>
		<tr>
			<td><%=vo.getNo()%></td>
			<td><%=vo.getName()%></td>
			<td><%=vo.getAge()%></td>
			<td><%=vo.getTel()%></td>
			
		</tr>
		<%
			}
		%>

		<tr align="center">
			<td colspan="5"> <input type="button" value="친구 추가" onclick="location.href='friend_input.jsp'"></td>
		</tr>

	</table>

</body>
</html>