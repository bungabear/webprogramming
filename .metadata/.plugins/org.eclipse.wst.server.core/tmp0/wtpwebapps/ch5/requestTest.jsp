<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html><head>
<title>Request Test</title>
</head><body>
<h3>Request �����Դϴ�.</h3>
<form action="requestTest_ok.jsp" method="get">
<table border="1" width="400">
<tr><td>�̸�</td><td><input type="text" name="name"></td></tr>
<tr>
<td>����</td><td>��<input type="radio" name="gender" value="����">
	               ��<input type="radio" name="gender" value="����">
</td></tr>




<tr><td>���</td>	
                  <td>����<input type="checkbox" name="hobby" value="����">
                        ����<input type="checkbox" name="hobby" value="����">
	           TV��û<input type="checkbox" name="hobby" value="TV��û">
	           �౸<input type="checkbox" name="hobby" value="�౸">
	           ��Ÿ<input type="checkbox" name="hobby" value="��Ÿ">	   
                   </td></tr>
<tr><td colspan="2"> <input type="submit" value="����"> </td></tr>
</table>
</form>
</body>  </html>



