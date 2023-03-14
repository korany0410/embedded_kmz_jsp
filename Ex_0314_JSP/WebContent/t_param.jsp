<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//request자바코드 필요 
//t_param.jsp?name=홍길동&age=30&tel=01055556666
// 받아야함

// post방식으로 보내면 한글파일이 꺠짐 -> 받는 파일에서 수정을 해줘야 함
// 해결방법 : request를 통해 메서드를 정의해줘야한다.
	request.setCharacterEncoding("utf-8");


String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
String tel = request.getParameter("tel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>t.param</title>
<style type="text/css">
table {
	width: 300px;
	margin: 0px auto;
	background-color: purple;
	color: white;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<table border='1'>
		<tr>
			<th>이름</th>
			<td><%=name%></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=age%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=tel%></td>
		</tr>
	</table>
</body>
</html>