<%@page import="dao.SjDAO"%>
<%@page import="vo.SjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //sung_update_result.jsp?no=1&name=일길동&kor=77&eng=88&mat=99
    
    //업데이트를위해 넘겨받은 파라미터를 vo로 묶는다
    int no = Integer.parseInt(request.getParameter("no"));
    int kor = Integer.parseInt(request.getParameter("kor"));
    int eng = Integer.parseInt(request.getParameter("eng"));
    int mat = Integer.parseInt(request.getParameter("mat"));
    String name = request.getParameter("name");
    
    SjVO vo = new SjVO();
    vo.setNo(no);
    vo.setKor(kor);
    vo.setEng(eng);
    vo.setMat(mat);
    vo.setName(name);
    
    //dao에게 업데이트를 요청
    SjDAO.getInstance().update(vo);
    
    // 업데이트가 완료되면 student.jsp로 화면전환
    response.sendRedirect("student.jsp");
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>