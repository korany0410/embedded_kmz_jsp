<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    <%-- 보낼때 안깨지는거라 post방식으로 보내면 깨져서 표기됨 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function send(f) {
		let name = f.name.value.trim();
		let age = f.age.value;
		let tel = f.tel.value;
		
		//유효성 체크
		if(name == ''){
			alert("이름을 입력하세요");
			f.name.focus(); // name속성의 input에게 커서를 옮긴다
			return;
		}
		if(age ==''){
			alert("나이를 입력하세요");
			f.age.focus();
			return;
		}
		
		f.action = "t_param.jsp";
		//t_param.jsp?name=홍길동&age=30&tel=01055556666
		f.method = "post"; 
		//post : 데이터를 숨겨서 보내기 
		//post방식으로 보내면 한글파일이 꺠짐 -> 받는 파일에서 수정을 해줘야 함
		// request를 통해 메서드를 정의해줘야한다.
		f.submit();
	}
</script>
</head>
<body>
	<form action="">
		이름 : <input name= "name"><br>
		나이 : <input name= "age"><br>
		번호 : <input name= "tel"><br><br>
		<input type="button" value="Send Parameters" onclick="send(this.form);">
	</form>
</body>
</html>