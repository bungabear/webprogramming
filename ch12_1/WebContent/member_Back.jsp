<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = null;
	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	String bad_id = request.getParameter("id");
	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Class.forName(driver); //����̹� �̸����� ����̹��� �ε�   
	conn = DriverManager.getConnection(url, "smj459", "min6422");
	pstmt = conn.prepareStatement("Update member Set status=0WHERE id=?");
	pstmt.setString(1, bad_id);
	pstmt.executeUpdate();
	out.println("<script>");
	out.println("location.href='member_List.jsp'");
	out.println("</script>");
%>