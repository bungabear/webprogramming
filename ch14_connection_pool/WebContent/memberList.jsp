
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
 	Connection conn = null;
 	String sql="SELECT * FROM members";
 	
	try {
  		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle11g");
  		conn = ds.getConnection();
  		
  		PreparedStatement pstmt=conn.prepareStatement(sql);
  		ResultSet rs=pstmt.executeQuery();
		%>
		<table width="600" cellpadding="0" cellspacing="0" border="1">
		<caption>ȸ������Ʈ ���� </caption>  
		<tr>
			<td>���̵�</td>	<td>�н�</td><td>�̸�</td>	<td>�̸���</td>	<td>�ּ�</td>
		</tr>
				<%
  		while(rs.next()){ %>		
  			<tr> <td><%=rs.getString(1)%> </td> 
  			<td><%=rs.getString(2)%> </td> 
  			<td><%=rs.getString(3)%>    </td> 
  			<td><%=rs.getString(4)  %> </td>  
  			<td><%=rs.getString(6)  %> </td> </tr>
  			
  			
  		<%	
  		}
		%>
		</table>
		<%
  		rs.close();
	}catch(Exception e){
		out.println("<h3>������ �������⿡ �����Ͽ����ϴ�.</h3>");
		e.printStackTrace();
 	}
%>
 
