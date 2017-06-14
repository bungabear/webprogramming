<%@page import="Member_Package.MemberDto"%>
<%@page import="Member_Package.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	String id = (String)session.getAttribute("id");
   // 유니크 한 id 값을 받아서 
	MemberDao dao = MemberDao.getInstance();
   // 싱글턴 dao 객체 생성 후 
	MemberDto dto = dao.getMember(id);
   // dao 객체 중애서 id 를 매개변수로 하여 getMember() 호출하여
   // 그 결과를 dto 에 저장 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>
	<form action="modifyOk.jsp" method="post" name="reg_frm">
		아이디 : <%= dto.getId() %><br /> 
		<!-- 11라인에 생성된 dto 객체접근  -->
		비밀번호 : <input type="password" name="pw" size="20"><br />
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br />
		이름 : <%= dto.getName() %><br />
		메일 : <input type="text" name="eMail" size="20" value="<%= dto.geteMail() %>"><br />
		주소 : <input type="text" name="address" size="50" value="<%= dto.getAddress() %>"><br />
		
		<input type="submit" value="수정" >	&nbsp;&nbsp;&nbsp; 
		<input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">
	</form>
</body></html>