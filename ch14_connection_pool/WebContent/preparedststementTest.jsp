<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
 
<%
 Connection conn = null; 
 String sql="INSERT INTO student (num,name) VALUES (?,?)";
try {
  Context init = new InitialContext();
  DataSource ds = (DataSource)   
   init.lookup("java:comp/env/jdbc/Oracle11g");
  conn = ds.getConnection();
  PreparedStatement pstmt=conn.prepareStatement(sql);
   int n;
   pstmt.setInt(1, 225);              // ù ��° ����ǥ�� ����
   pstmt.setString(2, "�輭��");   // �� ��° ����ǥ�� ����
   n = pstmt.executeUpdate();    // ���⼭ ������Ʈ ��
   n++;                                   // ó���� �̷������ Ƚ�� ī��Ʈ
   pstmt.setInt(1, 226);
   pstmt.setString(2, "������");
   n = pstmt.executeUpdate();
   n++;
   
   out.println(n + "��");
   out.println("<h3> ���ڵ带 ����Ͽ����ϴ�.</h3>");
   }catch(Exception e){
   out.println("<h3>���ڵ� ��Ͽ� �����Ͽ����ϴ�.</h3>");
   e.printStackTrace();
    }
   %>

 
 