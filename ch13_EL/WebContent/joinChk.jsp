<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>

 <!-- �ڹ� ���� �����ϱ� ���� �ڹ� �� ��ü ���� -->
 <jsp:useBean id="join" class="ch13_EL.JoinBean" />

<!--  �ڹ� �󿡼� ������ �о���� ���� �׼��±� -->
<%-- <jsp:setProperty name="join" property="id"/>
     <jsp:setProperty name="join" property="name"/> --%>
     <jsp:setProperty name="join" property="*"/>
 <!--  * �� �ڹٺ� Ŭ������ �ʵ���  �Ȱ��� ����� �� ��밡��  -->

<html><head>
<title>ȸ������ �Է�</title>
</head><body>
<table border=1 >
<!-- <tr> <td width="150px"><font size=2>���̵� : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="id"/> </td> </tr> --%>

<!-- <tr> <td width="150px"> <font size=2>��й�ȣ : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="pass"/> </td> </tr> --%>

<!-- <tr> <td width="150px"> <font size=2>�̸� : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="name"/> </td> </tr> --%>

<!-- <tr> <td width="150px"> <font size=2>���� : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="sex"/> </td> </tr> --%>

<!-- <tr> <td width="150px"> <font size=2>���� : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="age"/> </td> </tr> --%>

<!-- <tr> <td bgcolor="yellow"><font size=2>�̸����ּ� : </td> -->
<%-- <td width="150px"> <jsp:getProperty name="join" property="email"/> </td> </tr>  --%>

<tr> <td width="150px"><font size=2>���̵� : </td>
<td width="150px"> ${join.id} </td> </tr>

<tr> <td width="150px"> <font size=2>��й�ȣ : </td>
<td width="150px"> ${join.pass} </td> </tr>

<tr> <td width="150px"> <font size=2>�̸� : </td>
<td width="150px"> ${join.name}</td> </tr>

<tr> <td width="150px"> <font size=2>���� : </td>
<td width="150px"> ${join.sex}</td> </tr>

<tr> <td width="150px"> <font size=2>���� : </td>
<td width="150px"> ${join.age} </td> </tr>

<tr> <td bgcolor="yellow"><font size=2>�̸����ּ� : </td>
<td width="150px"> ${join.email} </td> </tr> 
</table>
</body></html>