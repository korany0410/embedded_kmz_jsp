<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.TestVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        //el표기법은 어떠한 방식에 담겨있어도 모두 출력할 수 있다
        
        //HashMap의 정보를 출력해보자
    	Map<String, Object> map = new HashMap<>();
    	map.put("name", "홍길동");
    	map.put("age", 20);
    	map.put("tall", 167.2);
    	//EL표기법으로 가져오고싶을때 4가지 스코프를 사용해서 저장을 먼저 해야한다.
    	request.setAttribute("myMap", map);
    	
    	
    	//request영역에 VO를 저장하고 출력해보자
    	//vo1
    	TestVO vo1 = new TestVO();
    	vo1.setName("일길동");
    	vo1.setAge(11);
		//vo2
    	TestVO vo2 = new TestVO();
    	vo2.setName("이길동");
    	vo2.setAge(22);
    	//scope에 vo를 저장한다
    	request.setAttribute("vo", vo1);
    	
    	
    	//ArrayList에 담긴 vo들의 정보를 출력해보자
    	List<TestVO> list = new ArrayList<>();
    	list.add(vo1);
    	list.add(vo2);
    	//scope에 ArrayList를 저장한다
    	request.setAttribute("arr", list);
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><mark>EL표기법은 어떠한 방식에 담겨있어도 모두 출력할 수 있다</mark></h2>
	<h2>HashMap 내용 출력하기</h2>
	이름 출력 : \${ myMap.get("name")} = ${ myMap.get("name") } <br>
	나이 출력(생략 해서) : \${ myMap['age'] } = ${ myMap['age'] } <br>
	신장 출력(더 생략해서) : \${ myMap.tall } = ${ myMap.tall } -> 가장 많이 사용하는 방법 <br>
	
	<hr>
	<h2>vo 내용 출력하기</h2>
	이름 : \${ vo.getName() } = ${ vo.getName() } <br>
	이름 : \${ vo.name } = ${ vo.name} <br> 
	너무 중요!! <br>
	getName으로 접근하지 않아도 출력 가능하지만  <br>
	그 이유는 vo.name이 내부적으로 설정되어 있는 getter로 알아서 접근해주기 때문이다. <br>
	따라서 vo를 생성할때 getter를 생략해선 안됨! <br>
	
	<hr>
	<h2>ArrayList 내용 출력하기</h2>
	이름 : ${ arr.get(0).getName() } <br>
	(생략해서) 이름 : ${ arr[0].name } / 나이 :  ${ arr[0].age } <br>
	
	\${arr[1].name} / ${arr[1].age }
	
</body>
</html>