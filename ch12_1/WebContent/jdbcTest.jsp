 <%@ page language="java" contentType="text/html; charset=EUC-KR"%>
 <%@ page import="java.sql.*" %>
 <%
 Connection conn=null;  // Ŀ�ؼ� ��ü ����
 String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
 String url="jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl"; 
     //����̹� ����Ͽ� ������ URL , ��  DB �� �ִ� ��ġ

 Boolean connect=false;   // ��� ������ ���� 
 Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�
 conn=DriverManager.getConnection(url,"smj459","min6422");
      //JDBC URL �� �̿��Ͽ� Connection ��ü�� ���´�.
 connect=true;    // ���������� ������ �Ǹ�
 conn.close(); // ������ ���̽� ���� ����
 %>

<html><head>
<title>JDBC ���� �׽�Ʈ ����</title>
</head><body>
<h3>
<%if(connect==true){ %>
���� �� ,  DB  ����  ������
<%
}
else { 
%>
DB ���ῡ ����.
<%
} 
%>   </h3>   </body></html>



