<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Survey.SurveyDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	SurveyDAO dao = SurveyDAO.getInstance();
	int answer[] = dao.getAnswers();
	int total = 0;
	for(int i = 0 ; i < 4; i++)
	{
		//System.out.println(answer[i]);
		total += answer[i];
	}
	
%>
<center>
<h3>[ ��ǥ ��� ���� ]</h3>
<table border="1">
<tr>
	<th>������</th><th>��ǥ��</th><th>����</th>
</tr>
<tr>
	<td>�쵵</td>
	<td><%=answer[0] %></td>
	<td><%=answer[0] %> / <%=total %></td>
</tr>
<tr>
	<td>���ֵ�</td>
	<td><%=answer[1] %></td>
	<td><%=answer[1] %> / <%=total %></td>
</tr>
<tr>
	<td>���ĵ�</td>
	<td><%=answer[2] %></td>
	<td><%=answer[2] %> / <%=total %></td>
</tr>
<tr>
	<td>����</td>
	<td><%=answer[3] %></td>
	<td><%=answer[3] %> / <%=total %></td>
</tr>
</table>
</center>
</body>
</html>