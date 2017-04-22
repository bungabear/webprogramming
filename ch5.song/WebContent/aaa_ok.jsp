<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>낄낄</title>
</head>
<body>
<%
 String id = "kbs";
 String pwd = "1234";
 String name = "홍길동";
 
  if(id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pw")))
  {
	  session.setAttribute("loginName", name);
	  response.sendRedirect("ccc.jsp");
  }
  else{ }
 %>
     <script>
       alert("손님으로 오셨군요");
       location.href="aaa.jsp";
     </script>
</body>
</html>