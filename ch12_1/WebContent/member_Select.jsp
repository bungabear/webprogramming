<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
int i=0;  
String sql="SELECT * FROM member";
String driver="oracle.jdbc.driver.OracleDriver"; 
String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
try {
Class.forName(driver); 
Connection con = 
               DriverManager.getConnection(url, "smj459","min6422");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>

<body> <center>
 <h4> [ 멤버   검색 ] </h4>
 <table border="1" cellspacing="1">
    <tr> <th>NO</th> <th>아이디</th> <th>비밀번호</th> <th>이름</th> <th>나이</th> <th>성별</th> <th>이메일</th> <th>상태</th> </tr>
<%
    // 6단계: 모든 행  반복 처리
    while ( rs.next() )  {
%><tr> <td><%= ++i %></td>
           <td><%= rs.getString("id") %> </td>
           <td><%= rs.getString("pass") %> </td>
           <td><%= rs.getString("name") %> </td>
           <td><%= rs.getInt("age") %> </td>
           <td><%= rs.getString("gender") %> </td>
           <td><%= rs.getString("email") %> </td>
           <td><%= rs.getInt("status") %> </td>
  </tr>
<%
 }
 %>
 </table> 

<% // 7단계: 사용한 자원 해제
 rs.close();
 stmt.close();
 con.close();
%>
 <h4>DB에서 정상적으로 검색 되었습니다!!!</h4>
<%
 } catch (SQLException e) {
%>
   <h4>에러가 발생 했군요. 다시 확인해 보세요!!!</h4>
<% 
} 
%>
</center>
</body></html>
