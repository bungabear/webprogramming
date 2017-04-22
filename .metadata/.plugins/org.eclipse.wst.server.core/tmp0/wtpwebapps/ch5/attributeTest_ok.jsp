<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>Attribute Test</title>
</head>
<body>
	<h2>영역과 속성 테스트</h2>
	<%
		request.setCharacterEncoding("euc-kr");
		String name_1 = request.getParameter("name");
		String id_1 = request.getParameter("id");
		if (name_1 != null && id_1 != null) {
			application.setAttribute("name", name_1);
			application.setAttribute("id", id_1); // application으로 저장
		}
	%>

	<h3><%=name_1%>님 반갑습니다. <br><%=name_1%>님의 아이디는
		<%=id_1%>입니다.
	</h3>
	<form action="attributeTest2.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2">Session 영역에 저장할 내용들</td>
			</tr>
			<tr>
				<td>e-mail 주소</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>집 주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>




