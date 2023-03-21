<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="js/httpRequest.js"></script>
<script>
	// 아이디 중복여부 체크
	let b_idCheck = false;
	
	// send 메서드를 폼태그를 통해 받아서 함수로 유효성 체크
	function send(f) {
		let id = f.id.value;
		let pwd = f.pwd.value;
		let name = f.name.value;
		let email = f.email.value;
		let addr = f.addr.value;
		
		//유효성 체크 
		if( id == ''){
			alert("아이디를 입력하세요");
			return;
		}
			if( !b_idCheck ){
				alert("아이디 중복체크를 하세요");
				return;
			}
		//다 했다 치고
		
		//DB에 서블릿 insert시키러 갈게
		f.action = "insert.do";
		f.method = "post";
		f.submit();
	}
	
		// 아이디 중복체크를 위한 함수
		function check_id() {
			let id = document.getElementById("id").value.trim();
			
			if( id == ''){
				alert("아이디를 입력하세요");
				return;
			}
			
				
			
			//아이디 중복검사
			//Ajax써야함!!
			var url = "check_id.do";
			var param = "id="+id;
			//url과 파람을 보냄
			//보낸 결과를 자동으로 받기위해 callback메서드 만들기
			sendRequest(url,param, resultFn, "GET");
			
		}
			//중복체크 버튼 클릭 후 자동으로 호출되는 콜백 메서드
			function resultFn() {
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					//서블릿에서 넘겨준 resultStr값
					let data = xhr.responseText;
					
					//문자열로 넘어온 data를 실제 json구조로 변경
					let json = (new Function('return'+data))();
					
					if( json[0].result == 'no' ){
						alert("이미 사용중인 아이디 입니다.");
						
					}else{
						alert("사용가능한 아이디 입니다.");
						b_idCheck  = true;
					}
				}
			}
			
			//아이디를 입력받는 창의 값이 변경되면 호출되는 메서드
			function che(){
				b_idCheck = false;
			}
</script>
</head>
<body>
	<form action="">
		<table border="1">
			<caption>회원가입</caption>

			<tr>
				<th>아이디</th>
				<td><input name="id" id="id" onchange='che();'> <input type="button" value="중복체크"
					onclick="check_id();"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="email"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name="addr"></td>
			</tr>

			<tr>
				<td colspan="2"><input type="button" value="가입"
					onclick="send(this.form);"> <!-- 유효성체크를 위해 send메서드 사용  -->
					<input type="button" value="취소" onclick="history.go(-1)"></td>

			</tr>
		</table>
	</form>
</body>
</html>