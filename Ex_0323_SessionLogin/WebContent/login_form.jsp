<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>

<script>
	function send(f) {                                                   
		let id = f.id.value;
		let pwd = f.pwd.value;
		                       
		//유효성체크 했다치고
		
		var url = "login.do";
		//encodeURIComponent(pwd) :특수문자가 섞여있는 데이터를 파라미터로 보내려면 필요한 함수
		var param = "id="+id+"&pwd="+ encodeURIComponent(pwd);
		sendRequest(url, param, resFn, "Post");
	}
	//콜백함수
	function resFn() {
		if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			
			if( data == 'no_id'){
				alert("아이디가 존재하지 않습니다.");
			}else if(data == 'no_pwd'){
				alert("비밀번호가 일치하지 않습니다.")
			}else{
				//로그인에 성공했다면 메인페이지로 이동!
				location.href="main_content.jsp";
			}
		}
	}
</script>
</head>

<body>
	<form action="">
		<table border=" 1" align="center">
			<caption>로그인</caption>
			<tr>
				<th>아이디</th>
				<td><input name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd" type="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="send(this.form)">
					 <!-- reset : 폼태그 내부의 모든 입력상자가 지워짐  -->
					<input type="reset" value="취소">
				</td>
			</tr>

		</table>
	</form>
</body>
</html>