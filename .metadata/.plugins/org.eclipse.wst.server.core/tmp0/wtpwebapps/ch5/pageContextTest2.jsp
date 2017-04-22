<%@ page language="java" contentType="text/html; charset=EUC-KR"     pageEncoding="EUC-KR"%>
<html><head>
<title>pageContext Test</title>
</head><body>
<%
     pageContext.include("pageContextTest3.jsp");
%><!--   pageContextTest3.jsp 를 포함시킨다.  -->
<h3>pageContext의 forward 메소드로 포워딩된 페이지입니다.</h3>
</body></html>
