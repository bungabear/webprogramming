<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if ((session.getAttribute("id") == null)) {
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
	<form action=member_Modify_ok.jsp method=post>
		<table border=1 width=300>
			<caption>회원 정보</caption>
			<tr align=center>
				<td>아이디 :</td>
				<td><input type=text name=id value=<%=rs.getString("id")%>></td>
			</tr>
			<tr align=center>
				<td>비밀번호 :</td>
				<td><input type=text name=pass value=<%=rs.getString("pass")%>></td>
			</tr>
			<tr align=center>
				<td>이름 :</td>
				<td><input type=text name=name value=<%=rs.getString("name")%>></td>
			</tr>
			<tr align=center>
				<td>나이 :</td>
				<td><input type="number" name=age
					value=<%=rs.getString("age")%>></td>
			</tr>
			<tr align=center>
				<td>성별 :</td>
				<td><input type="radio" name="gender" value="남자"
					<%if (rs.getString("gender").equals("남자")) {%> checked <%}%>>
					<font size=2>남자</font> <input type="radio" name="gender" value="여자"
					<%if (rs.getString("gender").equals("여자")) {%> checked <%}%>>
					<font size=2>여자</font></td>
			</tr>
			<tr align=center>
				<td>이메일 주소 :</td>
				<td><input type="email" name=email
					value=<%=rs.getString("email")%>></td>
			</tr>
			<tr align=center>
				<td colspan=2><input type=submit value="내 정보 수정하기"> <a
					href="member_Modify.jsp?id=<%=rs.getString("id")%>"> 다시작성</a></td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>

