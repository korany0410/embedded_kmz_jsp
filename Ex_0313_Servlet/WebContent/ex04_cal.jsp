<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calculator</title>
<script type="text/javascript">

	function calc_func(f) {
		let su1 = f.su1.value;
		let number_format = /^[0-9]+$/;
		if(!number_format.test(su1)){
			alert("정수로 입력하세요");
			return;
		}
		
		let su2 = f.su2.value;
		if(!number_format.test(su2)){
			alert("정수로 입력하세요");
			return;
		}
		
		f.submit();
		
		
		
	}
</script>
</head>
<body>
	<form action="calc.do">
	
	<table border="1">
		<tr> 
			<td>수1</td>
			<td><input name="su1"></td>
		</tr>
		<tr> 
			<td>수2</td>
			<td><input name="su2"></td>
		</tr>
		<tr> 
			<td colspan="2"><input type="button" value="확인" onclick="calc_func(this.form)"></td>
		</tr>
	</table>
	
	
</body>
</html>