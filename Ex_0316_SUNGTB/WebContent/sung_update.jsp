<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>

	window.onload = function () {
		//해당브라우저가 실행되면 가장 먼저 자동으으로 호출되는 함수영역
		<%
			String name = request.getParameter("name");
			int no = Integer.parseInt(request.getParameter("no"));
			int kor = Integer.parseInt(request.getParameter("kor"));
			int eng = Integer.parseInt(request.getParameter("eng"));
			int mat = Integer.parseInt(request.getParameter("mat"));
		%>
		
		//폼태그의 이름이 ff
		let ff = document.ff; 
		ff.name.value = '<%= name %>';
		ff.no.value = '<%= no %>';
		ff.kor.value = '<%= kor %>';
		ff.eng.value = '<%= eng %>';
		ff.mat.value = '<%= mat %>';
		
	}
	
	function send(f) {
		let name = f.name.value;
		if(name ==''){
			alert("이름을 입력하세요");
			f.name.focus();
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
		
		f.action = "sung_update_result.jsp";
		
		f.submit();
	}
</script>
</head>
<body>
	<form name="ff">
		<input type="hidden" name="no">
		<table border="1">
			<caption>::: 성적 수정 :::</caption>
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