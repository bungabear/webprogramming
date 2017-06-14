<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
  <!--   회원 가빙 버튼을 클릭하면 입력한 정보들이 request 객체에 담겨 joinOk.jsp 로 전달되어 옴 -->
	<form action="joinOk.jsp" method="post" name="reg_frm">
		아이디 : <input type="text" name="id" size="20"><br />
		비밀번호 : <input type="password" name="pw" size="20"><br />
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br />
		이름 : <input type="text" name="name" size="20"><br />
		메일 : <input type="text" name="eMail" size="20"><br />
		주소 : <input type="text" name="address" size="50"><br />
			<input type="submit" value="회원가입">&nbsp;&nbsp; 
		<input type="reset" value="취소" 
		onclick="javascript:window.location='login.jsp'">
		 <!-- 자바 스크립트의 onclick 이벤트 사용하여 호출 --> 
	</form>  
</body>
</html>
