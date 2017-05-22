<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
	function studentNumber_Check() {
		
	}
	function admin_Check() {
		location.
	}
</script>

<body>
	<center>
		<table>
			<form name="loginForm" action="exam.jsp" method="post">
				<tr>
					<td>아아디</td>
					<td><input type="text" name="id"></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td><input type="button" value="시험보기"
						onClick="javascript:studentNumber_Check()"></td>
					<td><input type="button" value="문제 출제하기"
						onClick="javascript:admin_Check()"></td>
				</tr>
				
			</form>
		</table>
	</center>
</body>
</html>