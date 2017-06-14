
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
		<caption>회원리스트 보기 </caption>  
		<tr>
			<td>아이디</td>	<td>패스</td><td>이름</td>	<td>이메일</td>	<td>주소</td>
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
		out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
		e.printStackTrace();
 	}
%>
 
