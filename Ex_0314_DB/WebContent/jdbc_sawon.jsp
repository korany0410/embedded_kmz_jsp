<%@page import="java.util.ArrayList"%>
<%@page import="vo.sawonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	//jdbc_sawon.jsp?depno=10
    	//jsp에서 jsp로 파라미터 값 받기
    	int deptno = Integer.parseInt(request.getParameter("deptno"));
    	//쿼리문 where로 조건달기

    
    	//JDNI전체를 찾는 객체 ic만들기
    	InitialContext ic = new InitialContext();
    	//<context>찾는 객체 ctx만들기  oracle에서 지정해 놓은 값 ("java:comp/env")
    	Context ctx =  (Context)ic.lookup("java:comp/env");
    	// <resource> 찾는 객체 ds만들기
    	DataSource ds = (DataSource)ctx.lookup("jdbc/oracle_test");
    	// <resource>과 연결 db접속 하기
    	Connection conn = ds.getConnection();
    	//////////////////////////////////////////////////////////
    	// DB연결 후 테이블 조회
    	// 전부다 가져와도 vo안에 있는 값만 가져오게 됨
   		String sql = "select * from sawon where deptno=" + deptno;
    	// 쿼리문 실행 해서 10줄 짜리 사원목록을 조회 
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	// 사원목록 내부의 쿼리문을 한줄씩 조회
    	ResultSet rs = pstmt.executeQuery();
    	// sawonVO만 가져오는 사원목록을 저장할 ArrayList만들기 (제너릭 타입 : sawonVO)
    	List<sawonVO> sawon_list = new ArrayList<>();
    	// while문을 이용해 필요한정보들(사번,이름,성별, 부서번호, 직책)vo에 저장
    	while(rs.next()){
    		sawonVO vo = new sawonVO();
    		//rs.get이름은 반드시 반드시 db상의 이름과 같아야함! db에서 조회해서 가져오는거라서!
    		vo.setSabun(rs.getInt("sabun"));
    		vo.setSaname(rs.getString("saname"));
    		vo.setSagen(rs.getString("sagen"));
    		vo.setDeptno(rs.getInt("deptno"));
    		vo.setSajob(rs.getString("sajob"));
    		//sawon_list에 담아주기
    		sawon_list.add(vo); 
    	}//while
    	//까먹지 말고 열려있는 객체들을 닫아준다
    	rs.close();
    	pstmt.close();
    	conn.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border='1'>
		<caption>사원테이블</caption>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>성별</th>
			<th>부서번호</th>
			<th>직책</th>
		</tr>
		<% for(int i = 0; i < sawon_list.size(); i++){ 
			/* dept_list.get(i).getDeptno(); */
			sawonVO vo = sawon_list.get(i);
		%>
		<tr>
			<td><%= vo.getSabun() %> </td>
			<td><%= vo.getSaname() %> </td>
			<td><%= vo.getSagen() %> </td>
			<td><%= vo.getDeptno()%> </td>
			<td><%= vo.getSajob() %> </td>
		</tr>			
		<%} %>
	</table>
</body>
</html>