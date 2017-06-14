<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
Connection conn=null;
// Connection 객체 생성
String driver="oracle.jdbc.driver.OracleDriver";
// JDBC 드라이버 이름 설정
String url="jdbc:oracle:thin:@localhost:1521:ORCL";
// 드라이버를 사용할 URL 지정, ORCL은 SID 이름으로 기본으로 ORCL 사용
Boolean connect=false;
try{
Class.forName(driver);
// jdbc driver 이름으로 드라이버 로드 
conn=DriverManager.getConnection(url,"kbs123","pass123");
//설정한 URL 을 이용하여 connection 객체 얻어온다. 
connect=true;      out.println("<h3> JDBC 로.</h3> <br>"); 
conn.close();       }catch(Exception e){
connect=false;
e.printStackTrace();
}
%>
<html><head>
<title>JDBC 연동 테스트 예제</title>
</head><body>
<h3><%if(connect==true){ %>
연결되었습니다.
<% } else {  %>
연결에 실패하였습니다.
<%} 
%></h3>
</body></html>
