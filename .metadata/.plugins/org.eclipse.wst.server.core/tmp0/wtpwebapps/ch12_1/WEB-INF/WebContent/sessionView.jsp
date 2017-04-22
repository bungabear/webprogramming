<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<html><head>
<title>Session View</title>
</head><body>
<center>
<h3> 다른-모든 페이지에서 세션유무 확인이 가능  </h3>
<h3>저장되어 넘겨져 온  세션은  :             
       <%=(String)session.getAttribute("id")%> </h3>
</center>
</body>
</html>
