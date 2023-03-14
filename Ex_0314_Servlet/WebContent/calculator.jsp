<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기 과제</title>

<script type="text/javascript">

	function myClick(f) {
		let su1 = f.su1.value;
		/* 입력상자1번에 있던 값을 가져오기 */
		let su2 = f.su2.value;
		
		// 정규식을 통해 숫자인지 판단
		let num_patt = /^[0-9]+$/;
		if(!num_patt.test(su1)){
			alert("숫자만 입력할 수 있습니다.");
			return;
		}
		if(!num_patt.test(su2)){
			alert("숫자만 입력할 수 있습니다.");
			return;
		}
		// su1과 su2를 calc.do로 보내기
		// f.action = "calc.do"
		f.submit();
		
	}

</script>
</head>
<body>
	<form action="calc.do">  
		수1 : <input name="su1"><br>
		수2 : <input name="su2"><br>
		<!-- /calc.do?su1=3&su2=2 -->
		<input type="button" value="확인" onclick="myClick(this.form);">
	</form>
</body>
</html>


























