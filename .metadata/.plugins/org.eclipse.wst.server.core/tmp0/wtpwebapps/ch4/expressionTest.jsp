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
	String str = "1부터 100까지의 합";
%>
<html>
<head>
<title>Expression Test</title>
</head>
<body>
	<h3>
		<%=str%>
		은
		<%=sum()%>
		입니다.
	</h3>
	<br>
	<h3>
		<%=str%>
		에 3을 곱하면
		<%=sum() * 3%>
		이 됨.
	</h3>
	<br>
	<h3>
		<%=str%>을 1000으로 나누면
		<%=sum() / 1000.%>
		가 됨.
	</h3>
</body>
</html>



