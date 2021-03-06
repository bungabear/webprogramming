<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");

	String id = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
	
	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}

	try {
		Class.forName(driver); //드라이버 이름으로 드라이버를 로드
		conn = DriverManager.getConnection(url, "smj459", "min6422");
		pstmt = conn.prepareStatement("SELECT * FROM member where status=0");
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
	<center>
		<table border=1 width=500>
			<tr align=center>
				<td colspan=4>정상 회원 목록</td>
			</tr>
			<tr align=center>
				<td>아이디</td>
				<td>이름</td>
				<td></td>
				<td></td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr align=center>
				<td><a href="member_Info.jsp?id=<%=rs.getString("id")%>">
						<%=rs.getString("id")%></a></td>
				<td><%=rs.getString("name")%></a></td>

				<td><a href="member_Delete.jsp?id=<%=rs.getString("id")%>">불량회원으로
						등록하기</a></td>
				<td><a href="member_Exit.jsp?id=<%=rs.getString("id")%>">퇴출</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<table border=1 width=500>
			<tr align=center>
				<td><a href="member_BadList.jsp">불량 회원 리스트 보기</a></td>
			</tr>
		</table>
	</center>
</body>
</html>


