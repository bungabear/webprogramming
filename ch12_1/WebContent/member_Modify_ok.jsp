<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>
<%
String id = null;
if ((session.getAttribute("id") == null)) {
	out.println("<script>");
	out.println("location.href='loginForm.jsp'");
	out.println("</script>");
}
String sessionId = (String)session.getAttribute("id");
id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
int age = Integer.parseInt((String)request.getParameter("age"));
String email = request.getParameter("email");
  
String sql = "update member set id=?, pass=?, name=?, gender=?, age=?, email=? where id=?";
String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";

try {
Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�
Connection con = DriverManager.getConnection(url, "smj459", "min6422");
PreparedStatement pstmt = con.prepareStatement(sql);   
pstmt.setString(1,id);    
pstmt.setString(2,pass);    
pstmt.setString(3,name);    
pstmt.setString(4,gender);    
pstmt.setInt(5,age);    
pstmt.setString(6,email);  
pstmt.setString(7,sessionId);  
pstmt.executeUpdate();
pstmt.close();
con.close();
out.print("�����Ϸ�");
} catch (SQLException e) {
}

%>
<a href="member_List.jsp">����Ʈ�� ����</a>


