<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberDTO"%>
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
	String password = request.getParameter("password");
	if(id != null && password != null)
	{
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO(id, password);
		int result = dao.userCheck(dto);
		switch(result)
		{
		case 0:
			//ok
			session.setAttribute("id", id);
			response.sendRedirect("survey.jsp");
		case -1:
		case -2:
			//��й�ȣ Ʋ��
			%>
		<script language="javascript">
			alert("���̵�� ��й�ȣ�� Ȯ�����ּ���.");
			history.go(-1);
		</script>
		<%
		}
	}
	else 
	{
		%>
		<script language="javascript">
			alert("���̵�� ��й�ȣ�� ��� �Է����ּ���");
			history.go(-1);
		</script>
		<%
	}
	
%>

</body>
</html>