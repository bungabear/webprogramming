<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
      session.setMaxInactiveInterval(5);   // �� 
%>
<html><head>
<title>Session Test</title>
</head><body>
<h2>���� �׽�Ʈ</h2>
  isNew() : <%=session.isNew()%><br>  <%-- true, false --%>
�����ð� : <%=session.getCreationTime()%><br>
���� ���� �ð�: <%=session.getLastAccessedTime()%><br>
����ID : <%=session.getId()%> <br>
</body></html>



