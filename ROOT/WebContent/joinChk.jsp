<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>

    <jsp:useBean id="join" class="join.JoinJava" />
    <jsp:setProperty name="join" property="*"/>

<html><head>
<title>회원가입 입력 정보 확인 페이지</title>
</head><body>
<table border=1 >
<tr> <td width="150px"><font size=2>아이디 : </td>
<td width="150px">< <jsp:getProperty name="join" property="id"/> </td> </tr>

<tr> <td width="150px">< <font size=2>비밀번호 : </td>
<td width="150px">< <jsp:getProperty name="join" property="pass"/> </td> </tr>

<tr> <td width="150px">< <font size=2>이름 : </td>
<td width="150px">< <jsp:getProperty name="join" property="name"/> </td> </tr>

<tr> <td width="150px">< <font size=2>성별 : </td>
<td width="150px">< <jsp:getProperty name="join" property="sex"/> </td> </tr>

<tr> <td width="150px">< <font size=2>나이 : </td>
<td width="150px">< <jsp:getProperty name="join" property="age"/> </td> </tr>

<tr> <td bgcolor="yellow"><font size=2>이메일주소 : </td>
<td width="150px">< <jsp:getProperty name="join" property="email"/> </td> </tr> 
</table>
