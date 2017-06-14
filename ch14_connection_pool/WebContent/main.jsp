<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(session.getAttribute("ValidMem") == null) {
		/* loginOk.jsp 에서  지정된 결과에 따라
		yes 가 아니면 비 로그인이므로 */
%>
	<jsp:forward page="login.jsp" />
<%
	}
     /*  로그인 한 회원이면 아래로 수행  */
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1><%= name %>님 안녕하세요.</h1> <br />
<form action="logout.jsp" method="post">
<input type="submit" value="로그아웃">&nbsp;&nbsp;&nbsp;

<input type="button" value="정보수정" 
onclick="javascript:window.location='modify.jsp'">&nbsp;&nbsp;&nbsp;

<input type="button" value="리스트보기" 
onclick="javascript:window.location='memberList.jsp'">&nbsp;&nbsp;&nbsp;

<input type="button" value="삭제하기" 
onclick="javascript:window.location='memberDelete.jsp'">&nbsp;&nbsp;&nbsp;
 	     
</form>

</body></html>