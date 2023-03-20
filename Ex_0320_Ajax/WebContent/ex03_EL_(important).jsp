<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- 
	EL표기법 : jsp에서 사용되는 표현식을 더 간결하게 사용할 수있도록 해 주는 표현형태
	EL(Expression Language) - EL로 값을 표현하려면 jsp의 관리하에 있는 4개의 영역에서만 사용을 할 수있다
	
	4개의 영역이란
	1) page영역 : 단 하나의 페이지(현재페이지)에서만 값을 저장하고 공유할 수 있다
				일종의 private영역 
	2) *request영역 (가장많이쓰임!) : 지역개념으로 페이지가 닫히면 영역도 종료가 된다.
				최대 두개의 페이지에서 값을 저장하거나 공유할 수 있다.
	3) session영역 : 전역 개념으로 브라우저가 완전히 종료되기 전까지는 영역이 살아있다.
					같은 웹 브라우저 내에서 요청되는 페이지들에게 값을 공유 
					일종의 public같은 느낌
	4) application영역 : 한 프로젝트에서 요청되는 페이지들 간 값을 공유
	
	EL의 접근 형식 : 달러표시{ 영역.변수   } 			
 -->
 <%
 	String msg = "안녕";
 	//pageScope에 값을 저장(안씀)
	
 	
 	//requestScope에 값을 저장 
 	request.setAttribute("msg", "request 영역입니다");
 	request.setAttribute("hi", "안녕안녕!");
 	
	
	//sessionScope에 값을 저장
	session.setAttribute("msg", "session 영역입니다");
 	
 %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03_EL_(important)</title>
</head>
<body>

	일반 jsp 표현식 : <%= msg %> <br>
	<h3> 생략된 EL표현식 *중요*  </h3>
	EL 표현식 (생략방식) : ${ msg } <br>
	EL 표현식 (생략방식) : ${ hi } <br>
	
	<h3> 의도적으로 영역 지정가능 </h3>
	<h4> 이름이 같은 다른 스코프에서 가져오고 싶을 수 있으니까 영역을 지정해 줌 </h4>
	EL 표현식 (오리지널 방식) : ${ requestScope.msg } <br>
	EL 표현식 (오리지널 방식) : ${ sessionScope.msg } <br>
	<h3> 파라미터가 있다면 그 중 age를 가져와 jsp?age=30 *중요*</h3>
	EL 표현식 (파라미터) : ${ param.age } <br>
	
	
	
	<h5>생략식을 상용했을때 영역의 참조순서</h5>
	<div>
		<ol>
			<li>pageScope</li>
			<li>requestScope</li>
			<li>sessionScope</li>
			<li>applicationScope</li>
		</ol>
	</div>
	
	<hr>
	<h2>1. EL표기법의 기본 연산자</h2>
	\${ 1 + 1 } <br>
	\${ 1 + 1 } = ${ 1 + 1 } <br>
	\${ 10 / 3 } = ${ 10/3 } <br>
	
	
	<hr>
	<h2>2. EL표기법의 비교 연산자</h2>
	\${ 3 > 2 } = ${ 3 > 2 } or ${ 3 gt 2 } <br>
	${ 3< 2 } or ${3 lt 2 } <br>
	${ 3 ge 2 } or ${ 3 >= 2 } <br>
	${ 3 == 2 } or ${ 3 eq 2 } <br>
	${ 3 != 2 } or ${ 3 ne 2 } <br>

	<hr>
	<h2>3. EL표기법의 삼항 연산자</h2>
	파라미터값 : ${ param.msg == null ? '값 없음' : param.msg } <br>
	파라미터값  추천방식 : ${ empty param.msg ? '값 없음' : param.msg } <br>
	
	<hr>
	<h2>4. EL표기법의 논리 연산자</h2>
	\${ 10 gt 3 && 5 eq 5 }  = ${ 10 gt 3 && 5 eq 5 } <br>
	\${ 10 gt 3 and 5 eq 5 } = ${ 10 gt 3 and 5 eq 5 } <br>
	
	
</body>

</html>












