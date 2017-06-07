<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String requestType = request.getParameter("requestType");
	String question, qimage, ex1, ex2, ex3, ex4, answer, addtype;
	//System.out.println(requestType);
	int qnum;
	question = request.getParameter("question");
	qimage = request.getParameter("qimage");
	ex1 = request.getParameter("ex1");
	ex2 = request.getParameter("ex2");
	ex3 = request.getParameter("ex3");
	ex4 = request.getParameter("ex4");
	answer = request.getParameter("answer");
	addtype = request.getParameter("addtype");
	
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
String address = "localhost";
String address1 = "orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com";
String url = "jdbc:oracle:thin:@" + address1 + ":1521:orcl";

try {
	Class.forName(driver); //드라이버 이름으로 드라이버를 로드
	conn = DriverManager.getConnection(url, "smj459", "min6422");
	if(requestType.equals("1"))
	{
		pstmt = conn.prepareStatement("select q_num as count from quiz order by q_num;");
		pstmt.executeQuery();
		rs.last();
		qnum = rs.getInt("q_num");
		qnum++;
		System.out.println(qnum);
		pstmt = conn.prepareStatement("insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
		pstmt.setInt(1,qnum);
		pstmt.setString(2, addtype);
		pstmt.setString(3, question);
		pstmt.setString(4,qimage);
		pstmt.setString(5,ex1);
		pstmt.setString(6,ex2);
		pstmt.setString(7,ex3);
		pstmt.setString(8,ex4);
		pstmt.setString(9,answer);
		pstmt.executeUpdate();
	}
	else
	{
		String s_qnum = request.getParameter("qnum");
		qnum = Integer.valueOf(s_qnum);
		pstmt = conn.prepareStatement("delete from quiz where Q_NUM = ?");	
		pstmt.setInt(1,qnum);
		pstmt.executeUpdate();
	}
	response.sendRedirect("examEdit.jsp?studentNum=admin&name=admin");
} catch (Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>
