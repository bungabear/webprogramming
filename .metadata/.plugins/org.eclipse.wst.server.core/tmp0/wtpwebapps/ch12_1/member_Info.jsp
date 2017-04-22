<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String id = null;
	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	String info_id = request.getParameter("id");
	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName(driver); //드라이버 이름으로 드라이버를 로드
		conn = DriverManager.getConnection(url, "smj459", "min6422");
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
	<center>
		<table border=1 width=300>
			<caption>회원 정보</caption>
			<tr align=center>
				<td>아이디 :</td>
				<td><%=rs.getString("id")%></td>
			</tr>
			<tr align=center>
				<td>비밀번호 :</td>
				<td><%=rs.getString("pass")%></td>
			</tr>
			<tr align=center>
				<td>이름 :</td>
				<td><%=rs.getString("name")%></td>
			</tr>
			<tr align=center>
				<td>나이 :</td>
				<td><%=rs.getString("age")%></td>
			</tr>
			<tr align=center>
				<td>성별 :</td>
				<td><%=rs.getString("gender")%></td>
			</tr>
			<tr align=center>
				<td>이메일 주소 :</td>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr align=center>
				<td colspan=2><a href="member_List.jsp">리스트로</a> &nbsp; &nbsp;
					<a href="member_Back.jsp?id=<%=rs.getString("id") %>"> 정상회원으로
						등록하기</a></td>
			</tr>
		</table>
	</center>
</body>
</html>

