<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JSP Standard Tag Library 
: jsp에서 for, if와 같은 제어문을 사용하게 해주는 라이브러리  -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--
 prefix="이름 지정" 
 uri="../core" :if, choose, forEach 같은 제어문을 사용할 수있도록 해주는 라이브러리
 uri="../fmt" : 숫자에 대한 출력포멧 라이브러리
  -->

<%
	Date today = new Date();
	int money = 10000000;
	request.setAttribute("today", today);
	request.setAttribute("money", money);
	
	List<String> sido = new ArrayList<>();
	sido.add("서울");
	sido.add("경기");
	sido.add("인천");
	sido.add("대전");
	sido.add("대구");
	sido.add("부산");
	sido.add("울산");
	request.setAttribute("list", sido);
%>  

<title>Insert title here</title>
</head>
<body>
	${ today } <br>
	${ money } <br>
	fmt를 통한 날짜형식 변경 - <fmt:formatDate value="${ today }" pattern="YY년 MM월 dd일"/> <br>
	<!-- fmt : 위의 prefix에서 지정해둔 숫자포멧 출력 라이브러리의 이름 
	formatDate :날짜에 대한 기능을 사용하는 라이브러리 / pattern : 날짜 표현법 변경-->
	fmt를 통한 숫자형식 지정 - &#8361;<fmt:formatNumber value="${ money }"/>
	<!-- &#8361; : 원화 표시 -->
	
	<hr>
	
	<!-- <:choose> : switch문 같음 -->
	<c:choose>
		<c:when test="${param.msg eq 10}"> 나는 10이다 </c:when>
		<c:when test="${param.msg eq 11}"> 나는 11이다 </c:when>
		<c:otherwise>모두 아니다</c:otherwise>
	</c:choose>
	
	<hr>
	
	<!-- for문과 문법이 완전 다름 
		var : 매회전마다 변화되는 begin의 값을 갱신 변수
		begin : 시작 값 / end : 끝 값
		step : 증가 값
	-->
	
	<c:forEach var="n" begin="1" end="5" step="1">
		<c:if test = "${ n mod 2 eq 1 }"> <!--${ n%2 ==1 } -->
			forEach ${ n } <br>
		</c:if>
		
		<c:if test="${ n mod 2 eq 0 }">
			<font color=green> font태그 ${ n }</font> <br>
		</c:if>
	</c:forEach>
	
	
	List에 담긴 내용 출력하기 1
	<ul>
		<c:forEach var="val" items="${ list }">
			<li>${ val }</li>
			
		</c:forEach>
	</ul>
	
	
	List에 담긴 내용 출력하기 2 (index개념 추가) <br>
	<c:forEach var="value" items="${ list }" varStatus="cnt">
		
		<!-- cnt.index : index번호(0부터) / cnt.count : 순번(1부터) -->
		${ value } / ${ cnt.index } / ${ cnt.count } <br>
		
	</c:forEach>
	
	
	
	
	
</body>
</html>

















