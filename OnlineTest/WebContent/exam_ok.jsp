<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>시험 결과</title>
</head>
<body>
<center>
	<table style="border-collapse: collapse; border: 1px" border="1">
	<%!
	String check(String str, char type) {
		if (type == 'I')
			str = "<img src=image/" + str + ">";
		return str;
	}
	%>
	<%
	request.setCharacterEncoding("euc-kr");
	String studentNum = request.getParameter("studentNum");
	String name = request.getParameter("name");
	if (studentNum.equals("") || name.equals("")) {
			response.sendRedirect("exam.jsp");
		} else {
			int questionNum = Integer.valueOf(request.getParameter("questionNum"));
			int score = 0;
			Vector<Integer> incorrect = new Vector<Integer>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";

			try {
				Class.forName(driver); //드라이버 이름으로 드라이버를 로드
				conn = DriverManager.getConnection(url, "smj459", "min6422");
				pstmt = conn.prepareStatement("select Q_ANSWER from quiz where Q_NUM = ?");

				for (int i = 1; i <= questionNum; i++) {
					int qNum = Integer.valueOf(request.getParameter("question" + i));
					pstmt.setInt(1, qNum);
					rs = pstmt.executeQuery();
					rs.next();
					if (rs.getString("Q_ANSWER").equals(request.getParameter("answer" + i))) {
						score++;
						incorrect.add(0);
						continue;
					}
					incorrect.add(qNum);
				}
				pstmt = conn.prepareStatement("insert into score(S_NUM, S_NAME, S_GRADE) values(?,?,?)");
				pstmt.setString(1, studentNum);
				pstmt.setString(2, name);
				pstmt.setInt(3, score);
				pstmt.executeUpdate();
				%>

			<h1>시험 결과</h1>
			<table border=1>
				<tr>
					<td>학번</td>
					<td><%=studentNum%></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%=name%></td>
				</tr>
				<tr>
					<td>점수</td>
					<td><%=score%>/<%=questionNum%></td>
				</tr>
				<tr>
					<td colspan=2><a href="examresult.jsp">점수 리스트 보러가기</a></td>
				</tr>
			</table>
			<%
				for (int i = 1; i <= questionNum; i++) {
					if (incorrect.get(i-1) == 0)
						continue;
					pstmt = conn.prepareStatement("select * from quiz where Q_NUM = ?");
					pstmt.setInt(1, incorrect.get(i-1));
					rs = pstmt.executeQuery();
					rs.next();
					String question = rs.getString("Q_QUESTION");
					String qImage = rs.getString("Q_IMAGE");
					String answer = rs.getString("Q_ANSWER");
					String type = rs.getString("Q_TYPE");
	%>

			<tr>
		<td rowspan=2><h3>문제<%=i%></h3></td>
		<td><%=question%> <%if (type.charAt(0) == 'I') {%><br> <img src="image/<%=qImage%>"> <%	} %></td>
	</tr>
	<tr>
		<td><%if(request.getParameter("answer"+i) != null) {check(request.getParameter("answer"+i), type.charAt(1));} else {%>선택안함<%} %> -> <%=check(answer, type.charAt(1))%></td>

	</tr>
	
	<%
		}
	%>
	</table>
		
	</center>

	<%
			} catch (Exception e) {
				response.sendRedirect("exam.jsp");
				e.printStackTrace();
			}
		}
	%>
</body>
</html>