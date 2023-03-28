<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	caption { 
				border-top: 3px dashed olive
				;
			  background: orange;
			  color : purple;
			  border-bottom: double;
			   padding : 5px 0px;
			   font-size:20px;
			   border-radius: 20px;}
 	
	td:nth-child(1) {
		border-radius: 20px 0px 0px 20px;
	}
	
	td:nth-child(5){
		border-radius:0px 20px 20px 0px;
	}
	th:nth-child(1) {
		border-radius: 20px 0px 0px 20px;
	}
	
	th:last-child{
		border-radius:0px 20px 20px 0px;
	}
	tr:nth-child(2n) td {
		background: yellow;
	}
	tr:nth-child(2n+1) td {
		background: red;
		color:white;
	}
	}
	tr:nth-child(3n+1) td {
		background: yellow;
		color:white;
	}
	#b {
 		background: orange;
 		border-radius: 20px 20px 20px 20px;
		height: 5px;
		position: relative;
		padding : 5px 0;
		 color: red;
		 }

	th { background: lime;
		 font-size: 15px;
		 padding : 5px 5px;
		 height: 20px;
		 font-family: "HY헤드라인M";
		}
	td { background: aqua;
		 font-size: 10px;
		 color: blue;
		 margin : 5px 5px;
		 padding : 10px 10px;
		 font-style: inherit;
		 font-weight: bold;
		 }
	table {border-collapse: collapse;}
	a { text-decoration: none;}
	a:hover {color : orange;
			 text-shadow: }	 
	.c {  width: 35px;
		  height : 20px;
		  display: block;
		  position : absolute;
		  right : 5px;
		  bottom : 2px;} 
</style>

</head>
<body>
	<table align="center">
		<caption>:::게시판:::</caption>
		
		<tr class="e" style="background:red">
			<th>번호</th>
			<th>작성자</th>
			<th width="200px">제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<c:forEach var="vo" items="${ list }">
		<tr>
			<td align="center">${ vo.idx }</td>
			
			<td align="center">${ vo.name }</td>
			<td>
			<!-- 댓글 들여쓰기 -->
			<c:forEach begin="1" end="${ vo.depth }">&nbsp;</c:forEach>
			<!-- 댓글 기호 표시 -->
			<c:if test="${vo.depth ne 0 }">└</c:if>
			<a href="view.do?idx=${vo.idx}">${ vo.subject }</a>
			</td>
			<td align="center">${vo.regdate }</td>
			<!-- fn:split(vo.regdate,' ')[0] -->
			<td align="center">${ vo.readhit }</td>
		</tr>
		</c:forEach>
		<tr class="d">
			<td align="center" ID="b" colspan="5">◀&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp; ▶
			<img class="c" src="img/btn_reg.gif" onclick="location.href='insert_form.jsp'" style="cursor:pointer">
			</td>
		</tr>
		
	</table>
</body>
</html>