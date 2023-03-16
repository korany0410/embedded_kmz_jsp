
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f) {
		let name = f.name.value;
		if(name ==''){
			alert("이름을 입력하세요");
			f.name.focus();
			return;}
		let age = f.age.value;
		let tel = f.tel.value;
		
		f.action="friend_register.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<form>
	<table border="1">
		<caption>친구추가</caption>
		<tr>
			<th>이름</th>
			<td><input name="name"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input name="age"></td>
		</tr>
		<tr>
			<th>전화</th>
			<td><input name="tel"></td>
		</tr>
		<tr  align="center">
			<td  colspan="2">
				<input type="button" value="등록" onclick="send(this.form)" >
				<input type="button" value="취소" onclick="location.href='friend.jsp'" >
			</td>
		</tr>

	</table>
	</form>
</body>
</html>