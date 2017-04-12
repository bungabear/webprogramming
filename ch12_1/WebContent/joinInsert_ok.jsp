<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String gender = request.getParameter("sex");
int age = Integer.parseInt((String)request.getParameter("age"));
String email = request.getParameter("email");
  
String sql = "INSERT INTO member(id,pass,name,gender,age,email) VALUES(?,?,?,?,?,?)";
  
String driver="oracle.jdbc.driver.OracleDriver";  //드라이버 이름 설정
String url="jdbc:oracle:thin:@localhost:1521:orcl";

try {
Class.forName(driver);  //드라이버 이름으로 드라이버를 로드
Connection con = DriverManager.getConnection(url, "smj459", "min6422");
PreparedStatement pstmt = con.prepareStatement(sql);   
pstmt.setString(1,id);    
pstmt.setString(2,pass);    
pstmt.setString(3,name);    
pstmt.setString(4,gender);    
pstmt.setInt(5,age);    
pstmt.setString(6,email);  
pstmt.executeUpdate();
pstmt.close();
con.close();
out.println("<h4>member 테이블에 한 행이 저장 됨!!!</h4>");    
} catch (SQLException e) {
    out.println("<h4>에러가 발생. 다시 확인해 보세요!!!</h4>");
}
response.sendRedirect("member_Select.jsp");
%>


