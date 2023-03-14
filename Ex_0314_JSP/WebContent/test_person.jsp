<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- model 1 구조 : 하나의 jsp파일에서 자바의 연산코드와 html디자인코드를 모두 작성하는 형태 
				단점 : 가독성 떨어짐, 유지보수 불편
 -->

<!-- PersonVo클래스의 객체를 만들기위해 스프리트릿 사용 -->
<%
	PersonVO p1 = new PersonVO();
	p1.setName("홍길1");
	p1.setAge(20);
	p1.setTel("010-1111-2222");

	PersonVO p2 = new PersonVO();
	p2.setName("홍길2");
	p2.setAge(22);
	p2.setTel("010-2222-2222");

	PersonVO p3 = new PersonVO();
	p3.setName("홍길3");
	p3.setAge(33);
	p3.setTel("010-3333-3333");
	
	/* 준비해둔 VO객체를 ArrayList에 탑재  */
	List<PersonVO> pList = new ArrayList<>();
	
	// 조회된 어레이리ㅣ스트를 담아보기
	pList.add(p1);
	pList.add(p2);
	pList.add(p3);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table border='1'>
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>전화번호</th>
		</tr>

			<%
				for(int i=0; i<pList.size(); i++){
			%>
			<tr>
				<td><%= pList.get(i).getName() %></td>
				<td><%= pList.get(i).getAge() %></td>
				<td><%= pList.get(i).getTel() %></td>
			</tr>
			
			<%} %>

	</table>
	
	
</body>
</html>