<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
</head>
<body>
<%
 String id = "kbs";
 String pwd = "1234";
 String name = "ȫ�浿";
 
  if(id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pw")))
  {
	  session.setAttribute("loginName", name);
	  response.sendRedirect("ccc.jsp");
  }
  else{ }
 %>
     <script>
       alert("�մ����� ���̱���");
       location.href="aaa.jsp";
     </script>
</body>
</html>