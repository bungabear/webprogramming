<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}

	try {
		Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
		conn = DriverManager.getConnection(url, "smj459", "min6422");
		pstmt = conn.prepareStatement("SELECT * FROM member where status=0");
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<title>ȸ������ �ý��� �����ڸ��(ȸ�� ��� ����)</title>
</head>
<body>
	<center>
		<table border=1 width=500>
			<tr align=center>
				<td colspan=4>���� ȸ�� ���</td>
			</tr>
			<tr align=center>
				<td>���̵�</td>
				<td>�̸�</td>
				<td></td>
				<td></td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr align=center>
				<td><a href="member_Info.jsp?id=<%=rs.getString("id")%>">
						<%=rs.getString("id")%></a></td>
				<td><%=rs.getString("name")%></a></td>

				<td><a href="member_Delete.jsp?id=<%=rs.getString("id")%>">�ҷ�ȸ������
						����ϱ�</a></td>
				<td><a href="member_Exit.jsp?id=<%=rs.getString("id")%>">����</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<table border=1 width=500>
			<tr align=center>
				<td><a href="member_BadList.jsp">�ҷ� ȸ�� ����Ʈ ����</a></td>
			</tr>
		</table>
	</center>
</body>
</html>

