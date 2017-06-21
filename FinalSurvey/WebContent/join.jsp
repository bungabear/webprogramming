<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<center>
	<form action="join_ok.jsp" method="post">
<table border="1">

	<tr>
		<td>아이디 </td>
		<td><input type="text" name="id" size="20"></td>
	</tr>
	<tr>
		<td>비밀번호 </td><td>
		<input type="password" name="password1" size="20"></td>
	</tr>
	<tr>
		<td>비밀번호 확인 </td>
		<td><input type="password" name="password2" size="20"></td>
	</tr>
	<tr>
		<td colspan="2"><center><input type="submit" value="회원가입"></center></td>
	</tr>

	</table>
		</form>  
	</center>
</body>
</html>
