<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send( f ) {
		let title = f.title.value;
		let photo = f.photo.value;
		//무결성 체크(유효성 체크)
		if( title == ''){
			alert("제목을 입력하세요");
			return;
		}
		if( photo == ''){
			alert("사진을 선택하세요");
			return;
		}
		f.action = "upload.do";
		f.submit();
		
	}
</script>
</head>
<body>
	<!-- 파일 업로드를 위해 반드시 지켜야 하는 고려사항!
	 	: 반드시 form태그에서 사용해야하며, 전송방식은 post, enctype이 설정되어있어야한다!!-->
	 <form method="post" enctype="multipart/form-data">
	 	
	 	제목 : <input name="title"> <br>
	 	첨부 : <input type="file" name="photo"> <br>
	 	<input type="button" value="업로드" onclick="send(this.form);">
	 </form>
</body>
</html>