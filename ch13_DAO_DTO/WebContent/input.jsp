<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<body>
<form action="input_OK" method="post">
이름 : <input type="text" name="name" size="10"><br/>
아이디 : <input type="text" name="id" size="10"><br/>
비밀번호 : <input type="password" name="pw" size="10"><br/>
핸드폰 : <input type="text" name="phone1" size="10"> &nbsp; &nbsp;
      <input type="text" name="phone2" size="10"> &nbsp; &nbsp;
      <input type="text" name="phone3" size="10"> &nbsp; &nbsp;<br>
<select name="gender">
	<option value="남자">남자</option>
	<option value="여자" selected="selected">여자</option>
</select><br/>
<input type="submit" value="전송">    
</form>
</body>
