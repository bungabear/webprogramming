<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
      request.setCharacterEncoding("euc-kr");
%>
<html><head><title>EL ���尴ü ��� ����</title></head><body>
�Է��� ����(�� ��� ǥ���ķ� ǥ��)<br>
���̵� : <%=request.getParameter("id") %> <br>
�� �� :  <%=request.getParameter("pwd") %> <br><br>

�Է��� ����(El ������� ǥ��)
<h3> ���̵� : ${param.id } </h3>
<h3> �� �� : ${param.pwd } &nbsp; or &nbsp; ${param["pwd"] } </h3>
<h3> ${sessionScope.test} </h3>
</body></html>


