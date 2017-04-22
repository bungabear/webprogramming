 <%@ page language="java" contentType="text/html; charset=EUC-KR"%>
 <%@ page import="java.sql.*" %>
 <%
 Connection conn=null;  // 커넥션 객체 생성
 String driver="oracle.jdbc.driver.OracleDriver";  //드라이버 이름 설정
 String url="jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl"; 
     //드라이버 사용하여 접속할 URL , 즉  DB 가 있는 위치

 Boolean connect=false;   // 결과 저장할 변수 
 Class.forName(driver);  //드라이버 이름으로 드라이버를 로드
 conn=DriverManager.getConnection(url,"smj459","min6422");
      //JDBC URL 을 이용하여 Connection 객체를 얻어온다.
 connect=true;    // 정상적으로 접근이 되면
 conn.close(); // 데이터 베이스 연결 해지
 %>

<html><head>
<title>JDBC 연동 테스트 예제</title>
</head><body>
<h3>
<%if(connect==true){ %>
축하 해 ,  DB  연결  성공…
<%
}
else { 
%>
DB 연결에 실패.
<%
} 
%>   </h3>   </body></html>



