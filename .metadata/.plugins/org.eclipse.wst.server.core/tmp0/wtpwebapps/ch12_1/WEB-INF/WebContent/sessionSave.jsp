<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<% session.setAttribute("id",request.getParameter("id")); %>
<html><head>
<title>Session Login2</title>
</head><body>
<center>
<h3>�α��εǾ����ϴ�.</h3>
<h3>�α��� ���̵� :             
       <%=(String)session.getAttribute("id")%></h3><br>
       <a href="sessionView.jsp">�ٸ� ���������� ���� ����</a> <br><br>
       <a href="sessionLogout.jsp">�α׾ƿ�</a><br>
</center>
</body>
</html>

