<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>

 <!-- 자바 빈을 연결하기 위한 자바 빈 객체 생성 -->
 <jsp:useBean id="join" class="ch13_EL.JoinBean" />

<!--  자바 빈에서 정보를 읽어오기 위한 액션태그 -->
<%-- <jsp:setProperty name="join" property="id"/>
     <jsp:setProperty name="join" property="name"/> --%>
     <jsp:setProperty name="join" property="*"/>
 <!--  * 는 자바빈 클래스의 필드명과  똑같게 사용할 때 사용가능  -->

<html><head>
<title>회원가입 입력</title>
</head><body>
<table border=1 >
<!-- <tr> <td width="150px"><font size=2>아이디 : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="id"/> </td> </tr> --%>

<!-- <tr> <td width="150px"> <font size=2>비밀번호 : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="pass"/> </td> </tr> --%>

<!-- <tr> <td width="150px"> <font size=2>이름 : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="name"/> </td> </tr> --%>

<!-- <tr> <td width="150px"> <font size=2>성별 : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="sex"/> </td> </tr> --%>

<!-- <tr> <td width="150px"> <font size=2>나이 : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="age"/> </td> </tr> --%>

<!-- <tr> <td bgcolor="yellow"><font size=2>이메일주소 : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="email"/> </td> </tr>  --%>

<tr> <td width="150px"><font size=2>아이디 : </td>
<td width="150px"> ${join.id} </td> </tr>

<tr> <td width="150px"> <font size=2>비밀번호 : </td>
<td width="150px"> ${join.pass} </td> </tr>

<tr> <td width="150px"> <font size=2>이름 : </td>
<td width="150px"> ${join.name}</td> </tr>

<tr> <td width="150px"> <font size=2>성별 : </td>
<td width="150px"> ${join.sex}</td> </tr>

<tr> <td width="150px"> <font size=2>나이 : </td>
<td width="150px"> ${join.age} </td> </tr>

<tr> <td bgcolor="yellow"><font size=2>이메일주소 : </td>
<td width="150px"> ${join.email} </td> </tr> 
</table>
</body></html>