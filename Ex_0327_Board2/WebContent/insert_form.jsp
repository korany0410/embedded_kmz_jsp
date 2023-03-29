<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="700" border="1" align="center">
		<caption>새 글 등록하기</caption>
		<tr>
			<th>작성자</th>
			<td><input name="name" ></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="subject" style="width:500px;"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="70" rows="8" >내용을 입력하세요</textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input name="pwd" ></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="취소" onclick="history(-1)">
				<input type="button" value="등록" onclick="send(this.form)">
			</td>
		</tr>
	
	</table>
</body>
</html>