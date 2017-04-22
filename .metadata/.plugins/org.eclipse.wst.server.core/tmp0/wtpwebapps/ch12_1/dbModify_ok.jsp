<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	int num1 = Integer.parseInt(request.getParameter("num"));
	String name1 = request.getParameter("name");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";

	Class.forName(driver); //드라이버 이름으로 드라이버를 로드
	conn = DriverManager.getConnection(url, "smj459", "min6422");

	// String SQL="update student set name = ? ";  // 이름 전체가 수정 됨 
	String SQL = "update student set name = ? where num = ? ";
	pstmt = conn.prepareStatement(SQL);

	pstmt.setString(1, name1);
	pstmt.setInt(2, num1);
	int result = pstmt.executeUpdate();
%>
<a href="statement_Select.jsp "> 리스트로 가기 </a>




