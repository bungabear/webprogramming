<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Arrays" %>
<%request.setCharacterEncoding("euc-kr");%>
<body>
<%!
String name, gender;
String[] hobbys;
%>
<%
name = request.getParameter("name");
gender = request.getParameter("gender");
hobbys = request.getParameterValues("hobby");
%>


<h3>Request �����Դϴ�.</h3>
<table border="1" width="400">
<tr><td>�̸�</td>
      <td> <%= name %> </td> </tr>
<tr><td>����</td>
     <td> <%= gender %> </td></tr>
<tr><td>���</td>
     <td> <%= Arrays.toString(hobbys) %>
</td></tr>
</table></body>


