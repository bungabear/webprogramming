<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.Enumeration"%>
<html>
<head>
<title>Attribute Test</title>
</head>
<body>
	<h2>������ �Ӽ� �׽�Ʈ</h2>
	<table border="1">
		<tr>
			<td colspan="2">Application ������ ����� �����</td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><%=application.getAttribute("name")%></td>
		</tr>
		<tr>
			<td>���̵�</td>
			<td><%=application.getAttribute("id")%></td>
		</tr>
	</table>
	<br>
	<table border="1">
		<tr>
			<td colspan="2">Session ������ ����� �����</td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><%=session.getAttribute("email")%></td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td><%=session.getAttribute("address")%></td>
		</tr>
		<tr>
			<td>��ȭ</td>
			<td><%=session.getAttribute("tel")%></td>
		</tr>
	</table>
</body>
</html>



