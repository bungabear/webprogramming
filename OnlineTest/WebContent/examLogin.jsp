<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
	function admin_Check() {
		document.loginForm.action = "examAdd.jsp"
		document.loginForm.submit();
	}
</script>

<body>
	<center>
		<table>
			<form name="loginForm" action="exam.jsp" method="post">
				<tr>
					<td>학번</td>
					<td><input type="text" name="studentNum"></td>
				</tr>

				<tr>
					<td>이름</td>
					<td><input type="password" name="name"></td>
				</tr>
				<tr>
					<td><input type="submit" value="시험보기"></td>
					<td><input type="button" value="문제 출제하기"
						onClick="javascript:admin_Check()"></td>
				</tr>
				
			</form>
		</table>
	</center>
</body>
</html>