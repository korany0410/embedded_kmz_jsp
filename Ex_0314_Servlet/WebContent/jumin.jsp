<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주민번호</title>
<script type="text/javascript">
	function check(f) {
		/* let jumin = f.jumin.value; 유효성 체크하는데 필요한것*/
		
		
		f.action = "jumin.do";

		f.submit();
	}
</script>

</head>
<body>
	<form>
	<!-- /jumin.do?jumin=990211-1144789 -->
		주민번호<input name="jumin"> <input type="button" value="확인"
			onclick="check(this.form);">

	</form>
</body>
</html>





