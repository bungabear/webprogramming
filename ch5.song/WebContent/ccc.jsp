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
  <%=name %>�� �ȳ��ϼ���! <br>
  ���� Ȩ�������� �湮���ּż� �����մϴ�. <br>
  ��ſ� �ð� �Ǽ���... <br>
 
   <a href="ccc.jsp">�۾���</a> <br>
   <a href="ccc.jsp">�� ����</a> <br>
   <a href="logout.jsp">�α׾ƿ�</a>
<%
 }
 else{
 %>
	 �մ����� �湮�ϼ̱���. <br>
	 �����ð� �Ǽ���. <br>
	 <a href="aaa.jsp">Home���� ����</a>
 <% }%>
	 
</body>
</html>