<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
Connection conn=null;
// Connection ��ü ����
String driver="oracle.jdbc.driver.OracleDriver";
// JDBC ����̹� �̸� ����
String url="jdbc:oracle:thin:@localhost:1521:ORCL";
// ����̹��� ����� URL ����, ORCL�� SID �̸����� �⺻���� ORCL ���
Boolean connect=false;
try{
Class.forName(driver);
// jdbc driver �̸����� ����̹� �ε� 
conn=DriverManager.getConnection(url,"kbs123","pass123");
//������ URL �� �̿��Ͽ� connection ��ü ���´�. 
connect=true;      out.println("<h3> JDBC ��.</h3> <br>"); 
conn.close();       }catch(Exception e){
connect=false;
e.printStackTrace();
}
%>
<html><head>
<title>JDBC ���� �׽�Ʈ ����</title>
</head><body>
<h3><%if(connect==true){ %>
����Ǿ����ϴ�.
<% } else {  %>
���ῡ �����Ͽ����ϴ�.
<%} 
%></h3>
</body></html>
