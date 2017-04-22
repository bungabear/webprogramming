<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
<%!
int age;
%>
<%
String str=request.getParameter("age");
age=Integer.parseInt(str);
if(age>=20)
{   response.sendRedirect("pass.jsp?age="+age);  
 }
else{  response.sendRedirect("ng.jsp?age="+age);
}
%></body>

