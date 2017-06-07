<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
      session.setAttribute("test","Session Test");
%>
<html><head>
<title>EL 내장객체 사용 예제</title>
</head><body>
<form action="el_test2.jsp" method="post">
<label for="userid"> 아이디 : </label> 
     <input type="text" name="id" id="userid"><br><br>
<label for="userpwd"> 패 &nbsp; 스 : </label> 
     <input type="text" name="pwd"  id="userpwd"><br>
<input type="submit" value="전송"><br>
</form></body></html>


