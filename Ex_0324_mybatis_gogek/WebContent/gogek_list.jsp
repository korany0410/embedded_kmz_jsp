<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function del(f) {
		f.action = "gogek_del.do?idx="+f.idx.value;
		f.submit();
	}
	
	function search() {
		let addr_search = document.getElementById("addr_search").value;
		
		location.href="gogek_search.do?addr="+addr_search;
		
	}
</script>
</head>
<body>
	<table border="1">
		<caption>:::고객목록:::</caption>
		<tr>
			<td colspan="6" align="center">
				<input type="button" value="등록" onclick="location.href='insert_form.jsp'">
				
				<input placeholder="검색할 지역을 입력하세요" id="addr_search">
		
				<input type="button" value="검색" onclick="search();">
			</td>
		</tr>
		<tr>
			<th>고객번호</th>
			<th>고객명</th>
			<th>고객주소</th>
			<th>고객주민등록번호</th>
			<th>고객담당자</th>
			<th>비고</th>
			<!-- 추후 삭제버튼 -->
			
		</tr>
	<!-- 변수이름, 포워딩을 통해 받은 키값 -->
		<c:forEach var="vo" items="${ list }">
			<form>
				<tr>
					<td>${vo.gobun}</td>
					<td>${vo.goname}</td>
					<td>${vo.goaddr}</td>
					<td>${vo.gojumin}</td>
					<td>${vo.godam}</td>
					
					<!-- scipt에서 del함수가 만들어졌을때 idx로   -->
					<input type="hidden" name="idx" value="${vo.gobun}">
					<td><input type="button" value="삭제" onclick="del(this.form);"></td>
				</tr>
			</form>
		</c:forEach>
	</table>
</body>
</html>