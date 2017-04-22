<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
 <%
  String name=(String) session.getAttribute("loginName");
 
 if(name!=null) {
  %>
  <%=name %>님 안녕하세요! <br>
  저희 홈페이지에 방문해주셔서 감사합니다. <br>
  즐거운 시간 되세요... <br>
 
   <a href="ccc.jsp">글쓰기</a> <br>
   <a href="ccc.jsp">글 수정</a> <br>
   <a href="logout.jsp">로그아웃</a>
<%
 }
 else{
 %>
	 손님으로 방문하셨군요. <br>
	 좋은시간 되세요. <br>
	 <a href="aaa.jsp">Home으로 가기</a>
 <% }%>
	 
</body>
</html>