<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="DAO_DTO.MemberDTO"%>
<%@page import="DAO_DTO.MemberDAO"%>
<!--  패키지이름.클래스이름  으로 import -->
<%@page import="java.util.ArrayList"%>
<!-- ArrayList 사용하겠다고 선언 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
int index = -1;
ArrayList<MemberDTO> dtos = dao.memberSelect();
for(int i = 0; i< dtos.size(); i++)
{
	String dtosId = dtos.get(i).getId();
	if(dtosId.equals(id))
		index = i;
}
MemberDTO member = dtos.get(index);
%>

<form action="input_OK" method="post">
<input type="hidden" name="type" value="update">
이름 : <input type="text" name="name" size="10" value="<%=member.getName()%>"><br/>
아이디 : <input type="text" name="id" size="10" value="<%=member.getId()%>" readonly><br/>
비밀번호 : <input type="password" name="pw" size="10" value="<%=member.getPw()%>"><br/>
핸드폰 : <input type="text" name="phone1" size="10" value="<%=member.getPhone1()%>"> &nbsp; &nbsp;
      <input type="text" name="phone2" size="10" value="<%=member.getPhone2()%>"> &nbsp; &nbsp;
      <input type="text" name="phone3" size="10" value="<%=member.getPhone3()%>"> &nbsp; &nbsp;<br>
<select name="gender">
	<option value="남자" <% if(member.getGender().equals("남자")){%> selected<% }%>">남자</option>
	<option value="여자" <% if(!member.getGender().equals("남자")){%> selected<% }%>>여자</option>
</select><br/>
<input type="submit" value="전송">    
</form>

</body>
</html>