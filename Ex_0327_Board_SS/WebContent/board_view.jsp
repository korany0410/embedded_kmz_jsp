<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	function reply(){
		location.href="reply_form.jsp?idx=${vo.idx}";
	}
	function modify( pwd ){
		let c_pwd = document.getElementById("c_pwd").value;
		if(c_pwd == pwd){
			location.href="update.do?idx="+${vo.idx};
			return;
		}else if(c_pwd != pwd){
			alert("비밀번호가 다릅니다. 다시 입력하세요.");
			c_pwd = "";
			return;
		}else{
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		
	}
	
	</script>
</head>
<body>
	<form name="f">
		<table border="1" style="margin:0 auto;" width="600">
			<tr>
				<th>제목</th>
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
				<td>${ vo.content }</pre></td>
			</tr>
			
			<tr>
				<th width="120">비밀번호</th>
				<td><input type="password" id="c_pwd"></td>
			</tr>
			
			
			<tr>
				<td colspan="2">
				<!-- 목록으로 돌아가기 -->
				<img src="img/btn_list.gif" onclick="location.href='boardList.do'">
				<c:if test="${vo.depth eq 0}">
				<!-- 댓글 -->
				<img src="img/btn_reply.gif" onclick="reply();">
				</c:if>
				<!-- 글삭제 -->
				<img src="img/btn_delete.gif" onclick="del();">
				<!-- 수정하기 -->
				<img src="img/btn_modify.gif" onclick="modify(${vo.pwd});">
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>