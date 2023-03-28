<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	function send( f ){
		
		
		let name = f.name.value;
		let subject = f.subject.value;
		let content = f.content.value;
		let pwd = f.pwd.value;
		f.name.value = f.name.value.replaceAll('<','x메롱');
	    f.subject.value = f.subject.value.replaceAll('<','x테러못하지~바보');
	    f.content.value = f.content.value.replaceAll('<','x테러못하겠지메롱');
		
		//제목,이름,내용,비밀번호에 대한 유효성 체크 했다고 치고
		
		
		f.action="insert.do";
		f.method="post";
		f.submit();
	}
	
	</script>
</head>
<body>
<form name="f">
	<table border="1" align="center" style="width:600px;">
		<caption>:::글 작성:::</caption>
		
		<tr>
			<th>작성자</th>
			<td><input name="name" style="width:500px;"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="subject"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" placeholder="내용을 입력하세요~~" rows="9" cols="74" style="resize:none;"></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<input type="button" value="작성하기" onclick="send(this.form);">
			<input type="button" value="취소하기" onclick="history.go(-1)"> 
			</td>
		</tr>
	
	</table>
</form>
</body>
</html>