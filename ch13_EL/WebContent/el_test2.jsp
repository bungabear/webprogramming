<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
      request.setCharacterEncoding("euc-kr");
%>
<html><head><title>EL 내장객체 사용 예제</title></head><body>
입력한 정보(옛 방식 표현식로 표기)<br>
아이디 : <%=request.getParameter("id") %> <br>
패 스 :  <%=request.getParameter("pwd") %> <br><br>

입력한 정보(El 방식으로 표기)
<h3> 아이디 : ${param.id } </h3>
<h3> 패 스 : ${param.pwd } &nbsp; or &nbsp; ${param["pwd"] } </h3>
<h3> ${sessionScope.test} </h3>
</body></html>


