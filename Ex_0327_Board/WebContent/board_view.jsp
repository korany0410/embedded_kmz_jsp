<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- ajax사용을 위한 준비 -->
<script src="js/httpRequest.js">
	
	
	
</script>


<script type="text/javascript">
	//댓글 폼으로 이동
	function reply() {
		location.href = "reply_form.jsp?idx=${vo.idx}&page=${param.page}";
	}

	//수정
	function modify( pwd ) {
		
		let aa = ${vo.idx};
		alert(aa);
		
		let c_pwd = document.getElementById( "c_pwd" ).value;
		 if(c_pwd == pwd){
			 location.href="update.do?idx=${vo.idx}";
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
	
	//삭제
	function del() {
		
		//삭제를 위해 입력한 비밀번호
		let pwd = document.getElementById("c_pwd").value;
		//원본 비밀번호
		let ori_pwd = ${vo.pwd};
		
		if(pwd != ori_pwd ){
			alert("비밀번호 불일치");
			return;
		}
		//ajax를 통해서 del.do에게 전송하기
		var url = "del.do";
		var param = "idx=${vo.idx}";
		sendRequest(url, param, resultFn, "post");
	}
	
	//ajax의 콜백메서드 함수 resultFn
	function resultFn() {
		if( xhr.readyState == 4 && xhr.status == 200 ){
			
			var data = xhr.responseText;
			
			if( data == 1 ){
				alert("삭제 성공");
			}else{
				alert("삭제 실패");
			}
			//list.do에서 조회를 처음부터 다시한다 
			// 페이지도 같이 따라 다니게 한다!
			location.href="list.do?page=${param.page}";
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
					<!--목록으로 돌아와도 해당페이지를 유지 시키기위해  -->
					<img src="img/btn_list.gif" onclick="location.href='list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}'" style="cursor: pointer;">	

					<!-- 댓글이 0일때만 댓글 버튼img를 보여주기 -->
					<c:if test="${vo.depth eq 0 }">
						<img src="img/btn_reply.gif" onclick="reply();" style="cursor: pointer;">
					</c:if>

					<!-- 삭제 -->
					<img src="img/btn_delete.gif" onclick="del();" style="cursor: pointer;">

					<!-- 수정 -->
					<img src="img/btn_modify.gif" onclick="modify(${vo.pwd});" style="cursor: pointer;">
				</td>
			</tr>


		</table>



	</form>
</body>
</html>