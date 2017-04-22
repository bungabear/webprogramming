<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = null;
		if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		}
		String delete_id = request.getParameter("id");
		String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
		String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Class.forName(driver); //드라이버 이름으로 드라이버를 로드
		conn = DriverManager.getConnection(url,"smj459","min6422");
	%>

	<center>
		<br>
		<br>
		<h3>
			<%=request.getParameter("id")%>
			님을 불량회원으로 등록하시겠습니까 ? &nbsp; <br> <br> <a
				href="member_Delete_ok.jsp?id=<%=delete_id%>">Yes</a> &nbsp;
			&nbsp; <a href="member_List.jsp">No</a>
		</h3>
	</center>

</body>
</html>

