<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- 이미 세션값이 있는 멤버이면 즉 로그인한 사람이면 main.jsp 로 가라-->
<% if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page="main.jsp"></jsp:forward> 
	<!-- JSP 액션태그 를 이용한 포워딩-->
<% } %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="loginOk.jsp" method="post">
	아이디 : <input type="text" name="id" 
	    value="<% if(session.getAttribute("id") != null) 
	  	              /* 값이 있으면  id 값 출력 */ 
	   out.println(session.getAttribute("id")); %>"> <br />
	     <!--   회원가입하고 나면 아디가 출력되는 원리  -->
		비밀번호 : <input type="password" name="pw"><br />
		<input type="submit" value="로그인"> &nbsp;&nbsp; 
		<input type="button" value="회원가입" 
		onclick="javascript:window.location='join.jsp'">
	<!-- 클릭 이벤트 발생시 window.location = 'join.jsp' 로 가라  -->
	</form>
</body>
</html>