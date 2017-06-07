<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
  String id1="kbs";
  String pwd1="1234";
  String name1="honggildong ";
  request.setCharacterEncoding("euc-kr");
   if(id1.equals(request.getParameter("id")) &&
            pwd1.equals(request.getParameter("pwd")) )
     {
         response.sendRedirect("main.jsp?name="+ name1);
      }
  else
  {
     response.sendRedirect("loginForm.jsp");
   }
%>
