<%@page import="java.util.ArrayList"%>
<%@page import="vo.DeptVO"%>
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
// 톰캣이 참조할 JNDI검색을 하기위해 객체 생성
InitialContext ic = new InitialContext();

// context의 위치 검색
Context ctx = (Context) ic.lookup("java:comp/env");

// Resource의 위치 검색
DataSource dataSource = (DataSource) ctx.lookup("jdbc/oracle_test");

// Resource에서 얻어낸 정보를 통해서 DB에 연결하기 위한 객체 생성
Connection conn = dataSource.getConnection();

System.out.println("--DB연결 성공--");

//////////////////////////////////////////////////
// DB연결 후 DEPT테이블 조회
String sql = "select * from dept";

// sql의 결과가 pstmt에 담김
PreparedStatement pstmt = conn.prepareStatement(sql);

// db에서 행단위로 데이터를 가지고 올 수있게 해줌
ResultSet rs = pstmt.executeQuery();

// 
List<DeptVO> dept_list = new ArrayList<>();

//db에서 행을 한줄씩 검색하여 vo에 저장하고 그 값을 dept_list에 add()gkwk
while (rs.next()) {
	DeptVO vo = new DeptVO();
	vo.setDeptno(rs.getInt("deptno"));
	vo.setDname(rs.getString("dname"));
	vo.setLoc(rs.getString("loc"));

	dept_list.add(vo);
}

// db접근을 위해 만들어진 객체들(pstmt, rs)는 역순으로 닫아주기
rs.close();
pstmt.close();

// dbcp를 10으로 잡아놨기 때문에 close()가 없으면 11번째 사용자는 접근이 불가
// DB연결후 원하는 작업을 끝낸 후 반드시 클로즈로 빠져나가야 함
conn.close();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(no) {
		//alert(no);
		let f = document.ff; //name이 ff인 form태그 가져와
		
		f.deptno.value = no;
		
		//alert(f.deptno.value);
		f.action = "jdbc_sawon.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<form name="ff">
		<table border='1'>
			<caption>부서 목록</caption>

			<tr>
				<th>부서번호</th>
				<th>부서이름</th>
				<th>부서위치</th>
			</tr>
			<%
				for (int i = 0; i < dept_list.size(); i++) {
				/* dept_list.get(i).getDeptno(); */
				DeptVO vo = dept_list.get(i);
			%>
			<tr>
				<td><%=vo.getDeptno()%></td>

				<td><a href="javascript:send('<%=vo.getDeptno()%>');"> <%=vo.getDname()%>
				</a></td>

				<td><%=vo.getLoc()%></td>
			</tr>

			<%
				}
			%>


		</table>
		<!-- hidden으로 숨겨놓은 입력상자가 넘어감  -->
		<input type="hidden" name="deptno">

	</form>
</body>
</html>








