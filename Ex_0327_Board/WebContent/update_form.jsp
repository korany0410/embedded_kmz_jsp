<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	function send( f ){
		
		let idx = f.idx.value;
		let name = f.name.value;
		let subject = f.subject.value;
		let content = f.content.value;
		
		//제목,이름,내용,비밀번호에 대한 유효성 체크 했다고 치고
		
		
		f.action="modify.do";
		f.method="get";
		f.submit();
		
	}
	
	</script>
</head>
<body>
<form name="f">
	<table border="1" align="center" style="width:600px;">
		<caption>:::글 수정:::</caption>
		<input type="hidden" value="${vo.idx}" name="idx">
		<tr>
			<th>작성자</th>
			<td><input name="name" style="width:500px;" value="${vo.name}"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="subject" value="${vo.subject}"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="9" cols="74" style="resize:none;">${vo.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<input type="button" value="수정하기" onclick="send(this.form);">
			<input type="button" value="취소하기" onclick="history.go(-1)"> 
			</td>
		</tr>
	
	</table>
</form>
</body>
</html>