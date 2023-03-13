<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주민번호</title>
<script type="text/javascript">

function jumin_func(f) {
	
	let jumin = f.jumin.value;
	
	let juNum_format = /^\d{2}[0-1]\d[0-3]\d-[1-4]\d{6}$/;
	if(!juNum_format.test(jumin)){
		alert("올바른 주민등록 번호를 입력하세요");
		return;
	}
	
	f.submit();
	
}


</script>
</head>
<body>
	
	<form action="jumin.do">
	
	<div>주민번호</div>
	<input name="jumin">
	<input type="button" value="확인" onclick="jumin_func(this.form);">
	
	</form>
	
</body>
</html>