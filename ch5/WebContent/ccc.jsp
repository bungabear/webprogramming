<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% String name = (String)session.getAttribute("name");
		if(name !=null)
		{
			if(name.equals("ȫ�浿"))
			{
				%>
				<%=name%>�� �ȳ��ϼ���!
				���� Ȩ�������� �湮���ּż� �����մϴ�.<br>
				��ſ� �ð� �Ǽ���<br>
				<br>
				<a href="ccc.jsp">�۾���</a><br>
				<a href="ccc.jsp">�� ����</a><br>
				<a href="logout.jsp">�α׾ƿ�</a><br>
				<%
			}
		} else {
			%>
			�մ����� �湮�߱���<br>
			���� �ð� �Ǽ���<br>
			<br>
			<a href="aaa.jsp">Home���� ����</a>
			<%
		}
	%>
</body>
</html>