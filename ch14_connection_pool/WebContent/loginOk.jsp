<%@page import="Member_Package.MemberDto"%>
<%@page import="Member_Package.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
    /* ������ �Է� �� ���� �޾� ������  */
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = MemberDao.getInstance();
	/*  MemberDao.getInstance(); ������ �� ��  */
	int checkNum = dao.userCheck(id, pw);
	/* dao.userCheck(id, pw) �� ���� �� �� */
	/* id�� pw�� ������ dao.userCheck(id, pw)�� ����  
	üũ�ϰ� ��� �� ��ȯ ����*/
	if(checkNum == -1) {  /* ���ϰ��� ���� ó�� */ 
%>
		<script language="javascript">
			alert("���̵� �������� �ʽ��ϴ�.");
			history.go(-1);  /* �� �ܰ� �ڷ� ���� */
		</script>
<%
	} else if(checkNum == 0) {  /* ���ϰ��� ���� ó�� pw Ʋ���� */ 
%>
		<script language="javascript">
			alert("��й�ȣ�� Ʋ���ϴ�.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		MemberDto dto = dao.getMember(id);  
		/* dao.getMember() �� ���� �� ��  */
		/*  ȣ�� MemberDto.getMember(id) ȣ���Ͽ� ó���� ��ȯ�� ���� */
		
		if(dto == null) {
			/* dto�� null �� �ƴϸ� �����͸� ������ �� ����  */
%>
		<script language="javascript">
			alert("�������� �ʴ� ȸ�� �Դϴ�.");
			history.go(-1);
		</script>
<%
		} else {   
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("ValidMem", "yes");
			response.sendRedirect("main.jsp");
		/* ���������� ó���� �Ǹ� ���� �� ���� �� main.jsp �� �̵� */
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>
</body></html>