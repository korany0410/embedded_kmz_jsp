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
			f.name.focus(); //커서가 name으로 옮겨질 수 있도록 배려
			return;
		}
		let number = /^[0-9]+$/;
		let kor = f.kor.value;
		let eng = f.eng.value;
		let mat = f.mat.value;
		
		if(!number.test(kor) || kor < 0 || kor > 100){
			alert("0~100사이의 값만 입력하세요");
			return;
		}
		if(!number.test(eng) || eng < 0 || eng > 100){
			alert("0~100사이의 값만 입력하세요");
			return;
		}
		if(!number.test(mat) || mat < 0 || mat > 100){
			alert("0~100사이의 값만 입력하세요");
			return;
		}
		
		f.action = "sung_register.jsp";
		
		f.submit();
	}
</script>
</head>
<body>
	<form action="">
		<table border="1">
			<caption>::: 성적 등록 :::</caption>
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><input name="kor"></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><input name="eng"></td>
			</tr>
			<tr>
				<th>수학</th>
				<td><input name="mat"></td>
			</tr>
			<tr align="right">
				<td colspan="2">
					<input type="button" value="등록" onclick="send(this.form);">
					<input type="button" value="최소" onclick="location.href='student.jsp'">
					<!--<input type="button" value="취소" onclick="history.go(-1)">  -->
				</td>	
			</tr>
			
		</table>
	</form>
</body>
</html>