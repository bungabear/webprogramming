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
		String email = request.getParameter("email"); // 읽어서 저장
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		session.setAttribute("email", email); // 세션으로 저장
		session.setAttribute("address", address);
		session.setAttribute("tel", tel);
		String name = (String) application.getAttribute("name");
	%>

	<h3><%=name%>님의 정보가 모두 저장되었습니다.
	</h3>
	<a href="attributeTest3.jsp">확인하러 가기</a>
</body>
</html>



