<%@ page import="Member_Package.MemberDto"%>
<%@ page import="Member_Package.MemberDao"%>

<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memberSelect.jsp" method="post">
		<table border="0">
			<caption>��� �˻�</caption>
			<tr>
				<td>�˻� ����</td>
				<td>��</td>
			</tr>
			<tr>
				<td><select name="type">
						<option value="id">���̵�</option>
						<option value="name">�̸�</option>
				</select></td>
				<td><input type="text" name="value"></td>
				<td><input type="submit" value="�˻�"></td>
			</tr>
		</table>
	</form>
	<table width="600" cellpadding="0" cellspacing="0" border="1">
		<caption>ȸ�� ���</caption>
		<tr>
			<td width="70">���̵�</td>
			<td width="70">�н�</td>
			<td width="70">�̸�</td>
			<td width="140">�̸���</td>
			<td width="250">�ּ�</td>
		</tr>
	</table>
	<%
		request.setCharacterEncoding("euc-kr");

		MemberDao m_dao = MemberDao.getInstance();
		ArrayList<MemberDto> dtos;
		String type = request.getParameter("type");
		String value = request.getParameter("value");
		if (request.getParameter("value") == null) {
			dtos = m_dao.getList();
		} else {
			dtos = m_dao.searchMember(type, value);
		}

		// MemberDAO() Ŭ������ �̿��Ͽ� m_dao ��ü ����

		// memberDAO �� �ִ� getList() �� �����ϰ� ���� 
		// ArrayList<MemberDto>	�� dtos ��ü�� ���� �� 
		// memberDao.getList() �� dtos �� ��ȯ �޾� ���
		for (int i = 0; i < dtos.size(); i++) { // dtos �� size ��ŭ for �� ����
			MemberDto dto = dtos.get(i); // dtos �� i ���� ������ ������ dto �� ����
			String name = dto.getName(); // dto�� name �����Ͽ� ����
			String pw = dto.getPw();
			String id = dto.getId(); // dto�� id �����Ͽ� ����
			String email = dto.geteMail(); // dto�� email �����Ͽ� ����
			String address = dto.getAddress(); // dto�� address �����Ͽ� ����
	%>

	<table width="600" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td width="70"><%=id%></td>
			<td width="70"><%=pw%></td>
			<td width="70"><%=name%></td>
			<td width="140"><%=email%></td>
			<td width="250"><%=address%></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>

<!-- �ҽ��� ���� ����̹� �ε��ϴ� �κе� ����, Ŀ�ؼ� ��ü ���ϴ� �κе� ����, �������� ����.  -->











<%-- <%@ page import="Member_Package.MemberDto" %>
<%@ page import="Member_Package.MemberDao" %>

<%@ page import="java.util.ArrayList"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
MemberDao m_dao= MemberDao.getInstance();
// MemberDAO() Ŭ������ �̿��Ͽ� m_dao ��ü ����

ArrayList<MemberDto> dtos=m_dao.getList();
// memberDAO �� �ִ� getList() �� �����ϰ� ���� 
// ArrayList<MemberDto>	�� dtos ��ü�� ���� �� 
// memberDao.getList() �� dtos �� ��ȯ �޾� ���
for(int i=0; i<dtos.size(); i++) {  // dtos �� size ��ŭ for �� ����
MemberDto dto=dtos.get(i);  // dtos �� i ���� ������ ������ dto �� ����
String name = dto.getName();  // dto�� name �����Ͽ� ����
String pw=dto.getPw();
String id = dto.getId();      // dto�� id �����Ͽ� ����
String email = dto.geteMail();      // dto�� email �����Ͽ� ����
String address = dto.getAddress();  // dto�� address �����Ͽ� ����
			
out.println("�̸� : " + name + ", ���̵� : " + id + ",  pass : " + pw + ",�̸��� : " + email + ", �ּ� : " + address + "<br />" );
}	
%>
</body></html>

<!-- �ҽ��� ���� ����̹� �ε��ϴ� �κе� ����, Ŀ�ؼ� ��ü ���ϴ� �κе� ����, �������� ����.  --> --%>