<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%
	int in_num = Integer.parseInt(request.getParameter("num"));
	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
		conn = DriverManager.getConnection(url, "smj459", "min6422");
		pstmt = conn.prepareStatement("SELECT * FROM student WHERE num=?");
		pstmt.setInt(1, in_num);
		rs = pstmt.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<form name="dbModify" action="dbModify_ok.jsp" method="post">
	<table border=1 width=300>
		<caption>�����ϱ�</caption>
		<tr align=center>
			<td>��ȣ :</td>
			<td><input type="text" name="num" VALUE="<%=rs.getInt("num")%>"></td>
		</tr>
		<tr align=center>
			<td>�̸� :</td>
			<td><input type="text" name="name"
				VALUE="<%=rs.getString("name")%>"></td>
		</tr>
		<tr align=center>
			<td colspan=2><input type="submit" value="�����ϱ�">
	</table>