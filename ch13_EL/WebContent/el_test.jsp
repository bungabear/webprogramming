<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
      session.setAttribute("test","Session Test");
%>
<html><head>
<title>EL ���尴ü ��� ����</title>
</head><body>
<form action="el_test2.jsp" method="post">
<label for="userid"> ���̵� : </label> 
     <input type="text" name="id" id="userid"><br><br>
<label for="userpwd"> �� &nbsp; �� : </label> 
     <input type="text" name="pwd"  id="userpwd"><br>
<input type="submit" value="����"><br>
</form></body></html>


