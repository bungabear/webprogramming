<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
int i=0;  
String sql="SELECT * FROM member";
String driver="oracle.jdbc.driver.OracleDriver"; 
String url="jdbc:oracle:thin:@localhost:1521:orcl";
try {
Class.forName(driver); 
Connection con = 
               DriverManager.getConnection(url, "smj459","min6422");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>

<body> <center>
 <h4> [ ���   �˻� ] </h4>
 <table border="1" cellspacing="1">
    <tr> <th>NO</th> <th>���̵�</th> <th>��й�ȣ</th> <th>�̸�</th> <th>����</th> <th>����</th> <th>�̸���</th> <th>����</th> </tr>
<%
    // 6�ܰ�: ��� ��  �ݺ� ó��
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

<% // 7�ܰ�: ����� �ڿ� ����
 rs.close();
 stmt.close();
 con.close();
%>
 <h4>DB���� ���������� �˻� �Ǿ����ϴ�!!!</h4>
<%
 } catch (SQLException e) {
%>
   <h4>������ �߻� �߱���. �ٽ� Ȯ���� ������!!!</h4>
<% 
} 
%>
</center>
</body></html>