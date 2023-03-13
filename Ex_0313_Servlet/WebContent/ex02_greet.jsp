<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나라별 인사말</title>

<script type="text/javascript">
	function send(f) {
		f.action = 'greet.do';
		f.submit(); //greet.do로 파라미터 전달
	}
</script>

</head>
<body>
	<form action="">
		원하는 인사말 보기 <br> 
		<input type="radio" name="nation" value="kor">한국<br> 
		<input type="radio" name="nation" value="eng">미국 <br>
		<input type="button" value="알려줘!" onclick="send(this.form);">
	</form>
</body>
</html>