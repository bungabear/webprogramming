<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���</title>
</head>
<body>
	<center>
		<h1>���� ���</h1>
		<table border=1>
			<tr bgcolor="lightgray">
				<td><b>�й�</b></td>
				<td><b>�̸�</b></td>
				<td><b>����</b></td>
				<td><b>���� �ð�</b></td>
			</tr>
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
				String url = "jdbc:oracle:thin:@localhost:1521:orcl";

				try {
					Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
					conn = DriverManager.getConnection(url, "smj459", "min6422");
					pstmt = conn.prepareStatement("select * from score order by Q_INDATE desc");
					rs = pstmt.executeQuery();
					int number = 0;

					while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("S_NUM")%></td>
				<td><%=rs.getString("S_Name")%></td>
				<td><%=rs.getString("S_GRADE")%></td>
				<td><%=rs.getString("Q_INDATE")%></td>
			</tr>

			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

		</table>
	</center>
</body>
</html>