<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
String id=null;
if ((session.getAttribute("id")==null) || 
  (!((String)session.getAttribute("id")).equals("admin"))) {
out.println("<script>");
out.println("location.href='loginForm.jsp'");
out.println("</script>");
}
String delete_id=request.getParameter("id");
String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
 String url="jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�   
conn=DriverManager.getConnection(url,"smj459","min6422");
pstmt=conn.prepareStatement("Update member Set status=1 WHERE id=?");
pstmt.setString(1,delete_id);
pstmt.executeUpdate();
out.println("<script>");
out.println("location.href='member_List.jsp'");
out.println("</script>");
%>

