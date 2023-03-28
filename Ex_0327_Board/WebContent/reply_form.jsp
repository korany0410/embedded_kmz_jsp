<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	function send() {
		let f = document.f;

		let name = f.name.value;
		let subject = f.subject.value;
		let content = f.content.value;
		f.name.value = f.name.value.replaceAll('<','x메롱');
		f.subject.value = f.subject.value.replaceAll('<','x테러못하지~바보');
		f.content.value = f.content.value.replaceAll('<','x테러못하겠지메롱');
		console.log(f);
		let pwd = f.pwd.value;
		//제목, 이름, 내용, 비밀번호에대한 유효성 체크 했다쳐
		if(subject == ''){
			alert("제목은 필수입니다");
			return;
		}
		
		f.action = "reply.do";
		f.method = "post";
		f.submit();
		
	}
	
	
	
</script>
</head>
<style>
	

</style>
<body>
	<!-- 폼태그에 이름주기 -->
	<form name="f" >
		<!--  누구의 댓글인지 알기 위해서 idx를 넘김 hidden으로 숨겨놓기-->
		<input type="hidden" name="idx" value="${param.idx}">
	
		<table border="1" width="700" align="center">
			<caption>댓글 등록하기</caption>
			<tr>
				<th>작성자</th>
				<td><input name="name" ></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="subject" style="width:610px;"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<!-- rows="세로의 길이 " cols="가로너비" -->
					<textarea name="content" rows="10" cols="85"
								placeholder="내용을 입력하세요" style="resize:none;" >
					</textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd"></input></td>
			</tr>
			<tr>
				<td align="center"  colspan="2">
					<img src="img/btn_back.gif" onclick="history.go(-1)"  style="cursor:pointer;"> 
					<!-- input태그가 아닌 img태그로 감싸져 있기때문에 send(this.form)으로 쓸 수 없다-->
					<img src="img/btn_reg.gif" onclick="send();" style="cursor:pointer;">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>