<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
int num   = Integer.parseInt((String)request.getParameter("num"));
String name = request.getParameter("name");
  
String sql = "INSERT INTO student(num, name) VALUES(?,?)";
  
String driver="oracle.jdbc.driver.OracleDriver";  //드라이버 이름 설정
String url="jdbc:oracle:thin:@localhost:1521:orcl";

try {
Class.forName(driver);  //드라이버 이름으로 드라이버를 로드
Connection con = DriverManager.getConnection(url, "smj459", "min6422");
PreparedStatement pstmt = con.prepareStatement(sql);   
pstmt.setInt(1,num);
pstmt.setString(2,name);    
pstmt.executeUpdate();
pstmt.close();
con.close();
out.println("<h4>student 테이블에 한 행이 저장 됨!!!</h4>");    
} catch (SQLException e) {
    out.println("<h4>에러가 발생. 다시 확인해 보세요!!!</h4>");
} %>
<a href="statement_Select.jsp"> 결과 확인하러 가기</a>

