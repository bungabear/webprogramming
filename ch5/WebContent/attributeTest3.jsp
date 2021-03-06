<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.Enumeration"%>
<html>
<head>
<title>Attribute Test</title>
</head>
<body>
	<h2>영역과 속성 테스트</h2>
	<table border="1">
		<tr>
			<td colspan="2">Application 영역에 저장된 내용들</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=application.getAttribute("name")%></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=application.getAttribute("id")%></td>
		</tr>
	</table>
	<br>
	<table border="1">
		<tr>
			<td colspan="2">Session 영역에 저장된 내용들</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=session.getAttribute("email")%></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=session.getAttribute("address")%></td>
		</tr>
		<tr>
			<td>전화</td>
			<td><%=session.getAttribute("tel")%></td>
		</tr>
	</table>
</body>
</html>



