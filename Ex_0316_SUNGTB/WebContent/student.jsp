<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//학생정보를 조회해서 테이블로 표현
SjDAO dao = SjDAO.getInstance();
List<SjVO> sj_list = dao.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del(no) {
		if (!confirm("정말 삭제하시겠어용?")) {
			return; //안지울거면 밑으로 못내려가게
		}
		location.href = "sung_del.jsp?no=" + no; //get방식으로 보내기
	}
	
	function modify(no, name, kor, eng, mat) {
		location.href = 
			"sung_update.jsp?no="+no+"&name="+name+"&kor="+kor+"&eng="+eng+"&mat="+mat; //get방식으로 보내기
	}
</script>
</head>
<body>
	<table border="1">
		<caption>학생 성적 정보</caption>
		<tr>
			<th>No</th>
			<th>Name</th>
			<th>Kor</th>
			<th>Eng</th>
			<th>Math</th>
			<th>Total</th>
			<th>Average</th>
			<th>Rank</th>
			<th colspan="2">Note</th>
		</tr>

			<%
				for (SjVO vo : sj_list) {
			%>
		
		<tr>
			<td><%=vo.getNo()%></td>
			<td><%=vo.getName()%></td>
			<td><%=vo.getKor()%></td>
			<td><%=vo.getEng()%></td>
			<td><%=vo.getMat()%></td>
			<td><%=vo.getTot()%></td>
			<td><%=vo.getAvg()%></td>
			<td><%=vo.getRank()%></td>


			<td><input type="button" value="삭제"
				onclick="del('<%=vo.getNo()%>');">
				 <input type="button" value="수정" 
				 onclick="modify('<%= vo.getNo()%>',
								 '<%= vo.getName()%>',
								 '<%= vo.getKor()%>',
								 '<%= vo.getEng()%>',
								 '<%= vo.getMat()%>',);">
			</td>
		

		</tr>

		<%
			}/* for */
		%>

		

		
		<tr align="center">
			<td colspan="9"><input type="button" value="학생 성적 정보 추가"
				onclick="location.href='sung_input.jsp'"></td>
		</tr>
	</table>
</body>
</html>