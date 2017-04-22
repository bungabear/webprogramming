<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
<%!
int age;
%>
<%
  String str=request.getParameter("age");
  age=Integer.parseInt(str);
%>
<%=age%>살입니다. 술을 살 수 없습니다.
</body>