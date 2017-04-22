<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<% session.setAttribute("id",request.getParameter("id")); %>
<html><head>
<title>Session Login2</title>
</head><body>
<center>
<h3>로그인되었습니다.</h3>
<h3>로그인 아이디 :             
       <%=(String)session.getAttribute("id")%></h3><br>
       <a href="sessionView.jsp">다른 페이지에서 세션 보기</a> <br><br>
       <a href="sessionLogout.jsp">로그아웃</a><br>
</center>
</body>
</html>

