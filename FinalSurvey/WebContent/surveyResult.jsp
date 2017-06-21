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
<h3>[ 투표 결과 보기 ]</h3>
<table border="1">
<tr>
	<th>여행지</th><th>투표수</th><th>비율</th>
</tr>
<tr>
	<td>우도</td>
	<td><%=answer[0] %></td>
	<td><%=answer[0] %> / <%=total %></td>
</tr>
<tr>
	<td>제주도</td>
	<td><%=answer[1] %></td>
	<td><%=answer[1] %> / <%=total %></td>
</tr>
<tr>
	<td>가파도</td>
	<td><%=answer[2] %></td>
	<td><%=answer[2] %> / <%=total %></td>
</tr>
<tr>
	<td>마라도</td>
	<td><%=answer[3] %></td>
	<td><%=answer[3] %> / <%=total %></td>
</tr>
</table>
</center>
</body>
</html>