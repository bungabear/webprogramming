<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
	Boolean connect = false;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "smj459", "min6422");
		connect = true;
		out.println("<h3> JDBC ��.</h3> <br>");
		conn.close();
	} catch (Exception e) {
		connect = false;
		e.printStackTrace();
	}
%>

<html>
<head>
<title>JDBC ���� �׽�Ʈ ����</title>
</head>
<body>
	<h3>
		<%
			if (connect == true) {
		%>
		����Ǿ����ϴ�.
		<%
			} else {
		%>
		���ῡ �����Ͽ����ϴ�.
		<%
			}
		%>
	</h3>
</body>
</html>


