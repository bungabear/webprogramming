<%@ page language="java" import="java.util.*" import="java.sql.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<html>
<header> </header>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = request.getParameter("id"); // 폼에서 id 참조, 처음에는 null
	boolean fnd = false; // select 결과가 있는지 여부 저장
	if (id == null)
		id = "";
	else {
		String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";

		Connection conn = null;
		Class.forName(driver); //드라이버 이름으로 드라이버를 로드
		conn = DriverManager.getConnection(url, "smj459", "min6422");
		ResultSet rs = null;

		Statement stmt = conn.createStatement();
		String strSQL = "SELECT id FROM member WHERE id='" + id + "'";
		rs = stmt.executeQuery(strSQL);

		if (rs.next())
			fnd = true; // select 된 결과 행이 있으면 fnd 는 true
		stmt.close();
		conn.close();
	}
%>
<script>
	function id_ok(a) {
		opener.document.joinform.id.value = a;
		self.close();
	}
</script>
<BODY>
	<CENTER>
		<BR>
		<P align="center">사용할 ID를 입력 후 검색 버튼을 누르세요</P>
		<FORM NAME="form_id_check" ACTION="id_check.jsp" METHOD="POST">
			<TABLE WIDTH="200">
				<TR>
					<TD WIDTH="150">ID</TD>
					<TD WIDTH="100"><INPUT TYPE="text" NAME="id" size="20"
						VALUE=<%=id%>></TD>
					<TD WIDTH="40"><INPUT TYPE="button" VALUE="검색"
						onClick="javascript:id_search()"></TD>
				</TR>
			</TABLE>
		</FORM>
	</CENTER>
</BODY>
</html>