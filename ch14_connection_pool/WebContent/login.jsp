<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- �̹� ���ǰ��� �ִ� ����̸� �� �α����� ����̸� main.jsp �� ����-->
<% if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page="main.jsp"></jsp:forward> 
	<!-- JSP �׼��±� �� �̿��� ������-->
<% } %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="loginOk.jsp" method="post">
	���̵� : <input type="text" name="id" 
	    value="<% if(session.getAttribute("id") != null) 
	  	              /* ���� ������  id �� ��� */ 
	   out.println(session.getAttribute("id")); %>"> <br />
	     <!--   ȸ�������ϰ� ���� �Ƶ� ��µǴ� ����  -->
		��й�ȣ : <input type="password" name="pw"><br />
		<input type="submit" value="�α���"> &nbsp;&nbsp; 
		<input type="button" value="ȸ������" 
		onclick="javascript:window.location='join.jsp'">
	<!-- Ŭ�� �̺�Ʈ �߻��� window.location = 'join.jsp' �� ����  -->
	</form>
</body>
</html>