<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if ((session.getAttribute("id") == null)) {
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
	<form action=member_Modify_ok.jsp method=post>
		<table border=1 width=300>
			<caption>ȸ�� ����</caption>
			<tr align=center>
				<td>���̵� :</td>
				<td><input type=text name=id value=<%=rs.getString("id")%>></td>
			</tr>
			<tr align=center>
				<td>��й�ȣ :</td>
				<td><input type=text name=pass value=<%=rs.getString("pass")%>></td>
			</tr>
			<tr align=center>
				<td>�̸� :</td>
				<td><input type=text name=name value=<%=rs.getString("name")%>></td>
			</tr>
			<tr align=center>
				<td>���� :</td>
				<td><input type="number" name=age
					value=<%=rs.getString("age")%>></td>
			</tr>
			<tr align=center>
				<td>���� :</td>
				<td><input type="radio" name="gender" value="����"
					<%if (rs.getString("gender").equals("����")) {%> checked <%}%>>
					<font size=2>����</font> <input type="radio" name="gender" value="����"
					<%if (rs.getString("gender").equals("����")) {%> checked <%}%>>
					<font size=2>����</font></td>
			</tr>
			<tr align=center>
				<td>�̸��� �ּ� :</td>
				<td><input type="email" name=email
					value=<%=rs.getString("email")%>></td>
			</tr>
			<tr align=center>
				<td colspan=2><input type=submit value="�� ���� �����ϱ�"> <a
					href="member_Modify.jsp?id=<%=rs.getString("id")%>"> �ٽ��ۼ�</a></td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>

