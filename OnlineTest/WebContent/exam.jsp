<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>온라인 시험 - 201301459 손민재</title>
</head>
<script>
	var countDownDate = new Date().getTime() + 1000 * 20;
	var x = setInterval(function() {
		var now = new Date().getTime();
		var distance = countDownDate - now;
		var seconds = Math.floor(distance / 1000);
		document.getElementById("timer").innerHTML = "남은 시험 시간 : " + seconds
				+ "초 ";
		if (distance < 1000) {
			clearInterval(x);
			document.exam_form.submit();
		}
	}, 1000);
</script>
<body>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String address = "localhost";
	String address1 = "orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com";
	String url = "jdbc:oracle:thin:@" + address1 + ":1521:orcl";
	
	request.setCharacterEncoding("euc-kr");
	String studentNum = request.getParameter("studentNum");
	String name = request.getParameter("name");
	if(studentNum == null)
		studentNum = "";
	if(name == null)
		name = "";
	if(studentNum.equals("") || name.equals(""))
	{
		%><form name="errorForm" action="examLogin.jsp" method="post">
		<input type="hidden" name="error" value="학번과 이름을 입력해주세요">
		</form>
		<script>
			document.errorForm.submit();
		</script>
		<%
	}
	else
	{
		session.setAttribute("studentNum", studentNum);
		session.setAttribute("name", name);
		Class.forName(driver); //드라이버 이름으로 드라이버를 로드
		conn = DriverManager.getConnection(url, "smj459", "min6422");
		pstmt = conn.prepareStatement(
				"select s_name from score where s_num = ?");
		pstmt.setString(1,studentNum);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
			 String errormsg = "이미 '" + rs.getString("s_name") + "'이름으로 시험을 보았습니다.";
			 %><form name="errorForm" action="examLogin.jsp" method="post">
				<input type="hidden" name="error" value="<%=errormsg%>">
				</form>
				<script>
					document.errorForm.submit();
				</script>
				<%
		}
	}
%>
	<center>
		<form name="exam_form" action="exam_ok.jsp" method="post">
			<h2>
				<p id="timer" />
			</h2>
			<br> <br> 학번:<input type="text" name="studentNum"
				value="<%=studentNum %>" readonly> 이름:<input
				type="text" name="name" value="<%=name %>" readonly>
			<table style="border-collapse: collapse; border: 1px" border="1">
				<%!
				String check(String str, char type) {
		if (type == 'I')
			str = "<img src=image/" + str + ">";
		return str;
	}%>
				<%
					int number = 1;
					try {
						Class.forName(driver); //드라이버 이름으로 드라이버를 로드
						conn = DriverManager.getConnection(url, "smj459", "min6422");
						pstmt = conn.prepareStatement(
								"select * from (select * from quiz order by DBMS_RANDOM.RANDOM) where rownum <= 5 order by Q_NUM");
						rs = pstmt.executeQuery();
						while (rs.next()) {
							String question = rs.getString("Q_QUESTION");
							String qImage = rs.getString("Q_IMAGE");
							String ex[] = { rs.getString("Q_EX1"), rs.getString("Q_EX2"), rs.getString("Q_EX3"),
									rs.getString("Q_EX4") };
							String type = rs.getString("Q_TYPE");
							char type1 = type.charAt(0), type2 = type.charAt(1);
							int qNum = rs.getInt("Q_NUM");
							for (int i = 0; i < ex.length; i++) {
								int random = (int) (Math.random() * ex.length);
								String tmp = ex[i];
								ex[i] = ex[random];
								ex[random] = tmp;
							}
				%>
				<tr>
					<td rowspan=2><h3>
							문제<%=number%><br> <input type="hidden"
								name="question<%=number%>" value="<%=qNum%>">
						</h3></td>
					<td colspan=4><%=question%> <%if (type1 == 'I'){%><br> <img
						src="image/<%=qImage%>"> <%} %></td>
				</tr>
				<tr>
					<td><input type="radio" name="answer<%=number%>"
						value="<%=ex[0]%>"><%=check(ex[0], type2)%></td>
					<td><input type="radio" name="answer<%=number%>"
						value="<%=ex[1]%>"><%=check(ex[1], type2)%></td>
					<td><input type="radio" name="answer<%=number%>"
						value="<%=ex[2]%>"><%=check(ex[2], type2)%></td>
					<td><input type="radio" name="answer<%=number%>"
						value="<%=ex[3]%>"><%=check(ex[3], type2)%></td>
				</tr>
				<%
					number++;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
			<input type="hidden" name="questionNum" value="<%=--number%>">
			<input type="submit" value="제출하기">

		</form>
	</center>
</body>
</html>