<%@page import="DAO_DTO.MemberDTO"%>
<%@page import="DAO_DTO.MemberDAO"%>
<!--  ��Ű���̸�.Ŭ�����̸�  ���� import -->
<%@page import="java.util.ArrayList"%>
<!-- ArrayList ����ϰڴٰ� ���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<table border=1>
		<th width=80>�̸�</th>
		<th width=100>���̵�</th>
		<th width=80>��й�ȣ</th>
		<th width=150>����ó</th>
		<th width=50>����</th>
		<th colspan=2>����</th>


		<%
			MemberDAO memberDAO = new MemberDAO();
			// MemberDAO() Ŭ������ �̿��Ͽ� memberDAO ��ü ����
			// MemberDAO�� 20���α��� �����

			ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
			// memberDAO �� �ִ� memberSelect() �� �����ϰ� ���� 
			// ArrayList ������ dtos ��ü�� ����µ�
			// �����ͱ����� MemberDTO �̴�
			// memberDAO.memberSelect()�� ������ dtos�� ��ȯ �޾� ���
			// memberDAO.memberSelect() �� ���� �� ��

			// dtos �� ��ȯ�޾� ��� 
			for (int i = 0; i < dtos.size(); i++) { // dtos �� size ��ŭ for �� ����
				MemberDTO dto = dtos.get(i); // dtos �� i ���� ������ ������ dto �� ����
				String name = dto.getName(); // dto�� name �����Ͽ� ����
				String id = dto.getId(); // dto�� id �����Ͽ� ����
				String pw = dto.getPw(); // dto�� pw �����Ͽ� ����
				String phone = dto.getPhone1() + " - " + dto.getPhone2() + " - " + dto.getPhone3();
				String gender = dto.getGender(); // dto�� gender �����Ͽ� ����
		%>
		<tr>
			<td width=80>
				<%
					out.println(name);
				%>
			</td>
			<td width=100>
				<%
					out.println(id);
				%>
			</td>
			<td width=80>
				<%
					out.println(pw);
				%>
			</td>
			<td width=150>
				<%
					out.println(phone);
				%>
			</td>
			<td width=50>
				<%
					out.println(gender);
				%>
			</td>
			<td>
				<form action="memberEdit.jsp" method="post">
					<input type="hidden" name="id" value="<%=id%>">
					<input
						type="submit" value="����">
				</form>
			</td>
			<td>
				<form action="input_OK" method="post">
					<input type="hidden" name="type" value="delete"><input
						type="hidden" name="id" value="<%=id%>"><input
						type="submit" value="����">
				</form>
			</td>
		</tr>

		<!-- out.println("�̸�:" + name + ", ID:" + id + ", PW:" + pw + ", ����ó:" + phone + ",  ����:" + gender + "<br />" ); -->
		<%
			}
		%>
	</table>
</body>
</html>









<%-- <body>
<%
MemberDAO memberDAO = new MemberDAO();
// MemberDAO() Ŭ������ �̿��Ͽ� memberDAO ��ü ����
// MemberDAO�� 20���α��� �����

ArrayList<MemberDTO> dtos = 
      memberDAO.memberSelect();
// memberDAO �� �ִ� memberSelect() �� �����ϰ� ���� 
// ArrayList ������ dtos ��ü�� ����µ�
// �����ͱ����� MemberDTO �̴�
// memberDAO.memberSelect()�� ������ dtos�� ��ȯ �޾� ���
// memberDAO.memberSelect() �� ���� �� ��

// dtos �� ��ȯ�޾� ��� 
for(int i=0; i<dtos.size(); i++) {  // dtos �� size ��ŭ for �� ����
MemberDTO dto = dtos.get(i);  // dtos �� i ���� ������ ������ dto �� ����
String name = dto.getName();  // dto�� name �����Ͽ� ����
String id = dto.getId();      // dto�� id �����Ͽ� ����
String pw = dto.getPw();      // dto�� pw �����Ͽ� ����
String phone = dto.getPhone1() + " - "+ dto.getPhone2() + " - " + dto.getPhone3();
String gender = dto.getGender();  // dto�� gender �����Ͽ� ����
			
out.println("�̸�:" + name + ", ID:" + id + ", PW:" + pw + ", ����ó:" + phone + ",  ����:" + gender + "<br />" );
}	
%>
</body></html>
 --%>
