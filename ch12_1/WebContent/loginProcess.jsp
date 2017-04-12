<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
   String id=request.getParameter("id");
   String pass=request.getParameter("pass");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

String driver="oracle.jdbc.driver.OracleDriver";  //드라이버 이름 설정
String url="jdbc:oracle:thin:@localhost:1521:orcl";

Class.forName(driver);  //드라이버 이름으로 드라이버를 로드
conn=DriverManager.getConnection(url,"smj459","min6422");

 pstmt=conn.prepareStatement("SELECT * FROM member WHERE id=?");
  pstmt.setString(1,id);
  rs=pstmt.executeQuery();
  if(rs.next()){
  if(pass.equals(rs.getString("pass")))
   {
    session.setAttribute("id",id);
    out.println("<script>");
    out.println("location.href='main.jsp'");
    out.println("</script>");
   } 
 }
  out.println("<script>");
  out.println("location.href='loginForm.jsp'");
  out.println("</script>");  
%>

