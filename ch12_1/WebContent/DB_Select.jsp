<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>  
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%
Connection connection;
Statement statement;
ResultSet resultSet;

String driver = "oracle.jdbc.driver.OracleDriver"; 
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String uid = "smj459";     
String upw = "min6422";
String query = "select * from student";
%>



<body>
<%
Class.forName(driver);
connection = DriverManager.getConnection(url, uid, upw);
statement = connection.createStatement();
// connection 객체를 사용하여 statement 객체 사용
// statement 객체는 SQL 문 실행하기 위해 사용
resultSet = statement.executeQuery(query);
// statement 객체를 이용하여 SQL  문 실행 후 결과를 resultSet 에 저장 
/* 실행한 결과 데이터를 resultSet 에 저장됨 */
out.println(" 번호 "  + "  이름 " +   "<br />");
out.println(" ====  ====== " +   "<br />");


while(resultSet.next())     // 처음부터 끝까지 
{
int num = resultSet.getInt("num");
//  int num = resultSet.getInt(1);
String name = resultSet.getString("name");
//  String name = resultSet.getString(2);
out.println(num  + "&nbsp;&nbsp;&nbsp;" + name + "<br />");
}
if(resultSet != null)   resultSet.close();
if(statement != null)  statement.close();
if(connection != null) connection.close();
%>
</body>


	