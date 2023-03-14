<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 위는 헤더 파일 -->
    
    <!-- 
    	jsp : java server page
    	html만으로는 불가능한 연산, 라이브러리 등을 사용할 수 있는 언어
    	servlet만으로는 한계가 있는 디자인적인 부분을 쉽게 할 수 있도록 도와준다.
     -->
     
<%
	// 스크립트릿(sriptlet) : jsp에서 자바코드를 사용하고자 할 떄 지정하는 영역
	// jsp  ->  Servlet  -> web
	// jsp는 서블릿을 거쳐 화면으로 반환되기때문에 servlet이 가지고 있는 
	// 요청(request), 응답(response) 처리 객체를 사용할 수 있다
	
	String ip = request.getRemoteAddr(); // ip주소 가져옴
	
	String msg = "안녕하세요";
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>&lt; %@ 내용 %&gt; : jsp헤더 - 페이지 인코딩 , import등의 설정을 위해 반드시 필요한 영역</p>
	<p>&lt; % 자바코드; %&gt; : 스크립트 릿 - jsp에서 자바코드를 사용하고자 할때 지정하는 영역 </p>
	<p>&lt; %= 변수명 %&gt; :  스크립트릿에 정의된 변수를 출력하는 영역(변수명; 과같이 ;은 사용불가!) 
	
	
	<h1>
		<%= ip %>  <!-- 스크립트 출력 코드 영역  (스크립트릿 뒤에 =을 붙여줌)-->
	</h1>
	
	<%= msg %>
	
</body>
</html>