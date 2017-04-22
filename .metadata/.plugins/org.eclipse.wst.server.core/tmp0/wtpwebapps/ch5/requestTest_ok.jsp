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


<h3>Request 예제입니다.</h3>
<table border="1" width="400">
<tr><td>이름</td>
      <td> <%= name %> </td> </tr>
<tr><td>성별</td>
     <td> <%= gender %> </td></tr>
<tr><td>취미</td>
     <td> <%= Arrays.toString(hobbys) %>
</td></tr>
</table></body>


