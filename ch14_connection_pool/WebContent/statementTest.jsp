<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
 Connection conn = null; 
 String sql="INSERT INTO student (num,name) VALUES (111,'ȫ�浿')";
 try {
  Context init = new InitialContext();
  DataSource ds = (DataSource) 
              init.lookup("java:comp/env/jdbc/Oracle11g");
  conn = ds.getConnection();
  Statement stmt=conn.createStatement();
  int result=stmt.executeUpdate(sql);
  if(result!=0){
  out.println("<h3>���ڵ尡 ��ϵǾ����ϴ�.</h3>");
}
}catch(Exception e){
out.println("<h3>���ڵ� ��Ͽ� �����Ͽ����ϴ�.</h3>");
e.printStackTrace();
 }
%>
