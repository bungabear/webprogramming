<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
String id = (String)session.getAttribute("id");
boolean logined = false;
if(id != null)
{
	logined = true;
}

%>
<center>
<form action="survey_ok.jsp" method="post">
<table border="1">
<tr>
	<th colspan="4">�̹� �⸻��� ������ ���� �� ���� ���� ��������?</th>
</tr>
<tr>
	<td>�쵵<input type="radio" name="answer" value="1"></td>
	<td>���ֵ�<input type="radio" name="answer" value="2"></td>
	<td>���ĵ�<input type="radio" name="answer" value="3"></td>
	<td>����<input type="radio" name="answer" value="4"></td>
</tr>
<tr>
	<td colspan="4"> <center><input type="submit" value="��ǥ�ϱ�" <%if(!logined){ %>disabled<% }%>> </center></td>
</tr>

</table>
</form>
</center>

</body>
</html>