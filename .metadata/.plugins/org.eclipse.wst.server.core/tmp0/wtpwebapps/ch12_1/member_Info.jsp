<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String id = null;
	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	String info_id = request.getParameter("id");
	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
		conn = DriverManager.getConnection(url, "smj459", "min6422");
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ���� ����)</title>
</head>
<body>
	<center>
		<table border=1 width=300>
			<caption>ȸ�� ����</caption>
			<tr align=center>
				<td>���̵� :</td>
				<td><%=rs.getString("id")%></td>
			</tr>
			<tr align=center>
				<td>��й�ȣ :</td>
				<td><%=rs.getString("pass")%></td>
			</tr>
			<tr align=center>
				<td>�̸� :</td>
				<td><%=rs.getString("name")%></td>
			</tr>
			<tr align=center>
				<td>���� :</td>
				<td><%=rs.getString("age")%></td>
			</tr>
			<tr align=center>
				<td>���� :</td>
				<td><%=rs.getString("gender")%></td>
			</tr>
			<tr align=center>
				<td>�̸��� �ּ� :</td>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr align=center>
				<td colspan=2><a href="member_List.jsp">����Ʈ��</a> &nbsp; &nbsp;
					<a href="member_Back.jsp?id=<%=rs.getString("id") %>"> ����ȸ������
						����ϱ�</a></td>
			</tr>
		</table>
	</center>
</body>
</html>

