<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html><head>
<title>Request Test</title>
</head><body>
<h3>Request 예제입니다.</h3>
<form action="requestTest_ok.jsp" method="get">
<!-- <form action="requestTest_ok.jsp" method="post"> -->
<table border="1" width="400">
<tr><td>이름</td><td><input type="text" name="name"></td></tr>
<tr>
<td>성별</td><td>남<input type="radio" name="gender" value="남자">
	               여<input type="radio" name="gender" value="여자">
</td></tr>
<tr><td>취미</td>	
                  <td>독서<input type="checkbox" name="hobby" value="독서">
                        게임<input type="checkbox" name="hobby" value="게임">
	           TV시청<input type="checkbox" name="hobby" value="TV시청">
	           축구<input type="checkbox" name="hobby" value="축구">
	           기타<input type="checkbox" name="hobby" value="기타">	   
                   </td></tr>
<tr><td colspan="2"> <input type="submit" value="전송"> </td></tr>
</table>
</form>
</body>  </html>