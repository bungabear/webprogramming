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
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		if((id == null) || (password2 == null) || (password1 == null))
		{
			%>
			<script language="javascript">
				alert("���̵�� ��й�ȣ�� ��� �Է����ּ���");
				history.go(-1);
			</script>
			<%
			
		}
		else
		{
			System.out.println("id '" + id + "'  password1 '" + password1 + "'  password2 '" + password2+"'" );
			if(id.equals("") || password1.equals("") || password2.equals(""))
			{
				
					%>
					<script language="javascript">
						alert("������ ��� �Է����ּ���");
						history.go(-1);
					</script>
					<%
					return;
			}
			if(password1.equals(password2))
			{
				MemberDTO dto = new MemberDTO(id, password1);
				MemberDAO dao = MemberDAO.getInstance();
				int result = dao.insertMember(dto);
				switch(result)
				{
				case 0:
					//OK
					%>
					<script language="javascript">
						alert("ȸ�������� �Ϸ�Ǿ����ϴ�..");
					</script>
					<%
					response.sendRedirect("login.jsp");
					return;
				case -1:
					//fail execQuery
					%>
					<script language="javascript">
						alert("ȸ�����Կ� �����߽��ϴ�.");
						history.go(-1);
					</script>
					<%
					return;
				}
			
			}
			else
			{
				%>
				<script language="javascript">
					alert("��й�ȣ Ȯ���� Ʋ���ϴ�");
					history.go(-1);
				</script>
				<%
			}
		}
	%>
</body>
</html>