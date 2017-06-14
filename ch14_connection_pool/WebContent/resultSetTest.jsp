<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
 Connection conn = null;
 String sql="SELECT * FROM student";
 try {
  Context init = new InitialContext();
  DataSource ds = (DataSource) 
                init.lookup("java:comp/env/jdbc/Oracle11g");
  conn = ds.getConnection();
PreparedStatement pstmt=conn.prepareStatement(sql);
  ResultSet  rs=pstmt.executeQuery();

  while(rs.next()){
  out.println(rs.getInt(1)+","+rs.getString(2)+"<br>");
  }
  rs.close();
}catch(Exception e){
out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
e.printStackTrace();
 }
%>
  