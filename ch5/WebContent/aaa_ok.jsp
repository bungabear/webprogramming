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
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		if (id.equals("kbs") && passwd.equals("1234")) {
			session.setAttribute("id", id);
			session.setAttribute("passwd", passwd);
			session.setAttribute("name", "ȫ�浿");
			response.sendRedirect("ccc.jsp");
		}
			%>
			<script>
				alert("�մ����� ���̱���");
				location.href="aaa.jsp"
			</script>

			<%
				//response.sendRedirect("aaa.jsp");
		
			%>

	
</body>
</html>