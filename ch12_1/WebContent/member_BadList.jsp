<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");

	String id = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";

	try {
		Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
		conn = DriverManager.getConnection(url,"smj459","min6422");
		pstmt = conn.prepareStatement("SELECT * FROM member where status=1");
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ��� ����)</title>
</head>
<body>
	<center>
		<table border=1 width=400>
			<tr align=center>
				<td colspan=2>�ҷ� ȸ�� ���</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr align=center>
				<td><a href="member_Info.jsp?id=<%=rs.getString("id")%>"> <%=rs.getString("id")%>
				</a></td>
				<td><%=rs.getString("name")%></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
</body>
</html>

