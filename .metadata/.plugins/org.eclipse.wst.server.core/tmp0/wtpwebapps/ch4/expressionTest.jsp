<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%!public int sum() {
		int total = 0;
		for (int i = 1; i <= 100; i++) {
			total += i;
		}
		return total;
	}%>

<%
	String str = "1���� 100������ ��";
%>
<html>
<head>
<title>Expression Test</title>
</head>
<body>
	<h3>
		<%=str%>
		��
		<%=sum()%>
		�Դϴ�.
	</h3>
	<br>
	<h3>
		<%=str%>
		�� 3�� ���ϸ�
		<%=sum() * 3%>
		�� ��.
	</h3>
	<br>
	<h3>
		<%=str%>�� 1000���� ������
		<%=sum() / 1000.%>
		�� ��.
	</h3>
</body>
</html>



