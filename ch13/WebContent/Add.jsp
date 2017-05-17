<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 어트리뷰트는 편하게 가져올 수 있다. -->
	num1 :<%= request.getAttribute("n1") %><br> 
	num2 :<%= request.getAttribute("n2") %><br> 
	합 :<%= request.getAttribute("hap") %><br>
	${n1} + ${n2} = ${hap}
	

</body>
</html>