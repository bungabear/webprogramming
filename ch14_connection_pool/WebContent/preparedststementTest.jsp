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
   pstmt.setInt(1, 225);              // 첫 번째 물음표에 저장
   pstmt.setString(2, "김서방");   // 두 번째 물음표에 저장
   n = pstmt.executeUpdate();    // 여기서 업데이트 됨
   n++;                                   // 처리가 이루어지는 횟수 카운트
   pstmt.setInt(1, 226);
   pstmt.setString(2, "나서방");
   n = pstmt.executeUpdate();
   n++;
   
   out.println(n + "개");
   out.println("<h3> 레코드를 등록하였습니다.</h3>");
   }catch(Exception e){
   out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
   e.printStackTrace();
    }
   %>

 
 