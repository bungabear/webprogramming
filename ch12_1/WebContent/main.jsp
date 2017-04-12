<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	
	if(session == null){
		response.sendRedirect("loginForm.jsp");
	}
	String id = (String)session.getAttribute("id");
	out.print(id+"님 로그인 하셨습니다.");
	if(id.equals("admin")){ 
		%>
		<a href="member_List.jsp	">관리자 모드로 접속(회원 목록 보기)</a>
		<%
	}else{
		%>
		<a href="member_Modify.jsp?id=<%=id%>">내 정보 수정하기</a>
		<%
	}
	
%>

</body>
</html>