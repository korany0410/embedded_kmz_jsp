<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function reply() {
		location.href = "reply_form.jsp?idx=${vo.idx}";
	}

	
function modify( pwd ) {
		
		let c_pwd = document.getElementById( "c_pwd" ).value;
		 if(c_pwd == pwd){
			 location.href="modify.do?idx="+${vo.idx};
			 return;
		 }else if(c_pwd != pwd){
			 alert("비밀번호가 맞지 않습니다.");
			 c_pwd = "";
			 return;
		 }else{
			 alert("비밀번호를 입력하세요");
			 return;
		 }
		

	}
</script>
</head>
<body>
	<form name="f">

		<table border="1" style="margin: 0 auto;" width="600">
			<caption>작성글</caption>
			<tr>
				<th width="120">제목</th>
				<td>${ vo.subject }</td>
			</tr>
			<tr>
				<th width="120">작성자</th>
				<td>${ vo.name }</td>
			</tr>
			<tr>
				<th width="120">작성일</th>
				<td>${ vo.regdate }</td>
			</tr>
			<tr>
				<th width="120">ip</th>
				<td>${ vo.ip }</td>
			</tr>
			<tr>
				<th width="120">내용</th>
				<!-- pre태그 : enter값을 포함한 글 그대로 출력되게 함 -->
				<td>
					<pre>${ vo.content }</pre>
				</td>
			</tr>
			<tr>
				<th width="120">비밀번호</th>
				<td>
					<input type="password" id="c_pwd">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- 목록으로 돌아가기 -->
					<img src="img/btn_list.gif" onclick="location.href='list.do'">

					<!-- 댓글 -->
					<c:if test="${vo.depth eq 0 }">
						<img src="img/btn_reply.gif" onclick="reply();">
					</c:if>

					<!-- 삭제 -->
					<img src="img/btn_delete.gif" onclick="del();">

					<!-- 수정 -->
					<img src="img/btn_modify.gif" onclick="modify(${vo.pwd});">
				</td>
			</tr>


		</table>



	</form>
</body>
</html>