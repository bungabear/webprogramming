<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
	function answerCheck() {
		// 		String answer = document.addQeustion.answer.value;
		// 		if (document.addQeustion.ex1.value != answer)
		// 			if (document.addQeustion.ex2.value != answer)
		// 				if (document.addQeustion.ex3.value != answer)
		// 					if (document.addQeustion.ex4.value != answer) {
		// 						document.getElementById("error").innerHTML = "정답이 보기에 없습니다.";
		// 						return 0;
		// 					}
		document.addQuestion.submit();
	}
	
	function selectQType()
	{
		var x = document.getElementById("mySelect").value;
		var str = "examEdit.jsp?addtype=" + x;
		location.href=str;
	}
</script>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String name = (String)request.getParameter("studentNum");
	String pass =(String)request.getParameter("name");
	
	if(name == null || pass == null)
	{
		%><form name="errorForm" action="examLogin.jsp" method="post">
		<input type="hidden" name="error" value="관리자 정보를 입력해주세요">
	</form>
	<script>
		document.errorForm.submit();
	</script>
	<%
	}
	else if(!name.equals("admin") || !pass.equals("admin"))
	{
		%><form name="errorForm" action="examLogin.jsp" method="post">
		<input type="hidden" name="error" value="관리자 정보가 틀립니다.">
	</form>
	<script>
		document.errorForm.submit();
	</script>
	<%
	}
	
	String addtype = (String)request.getParameter("addtype");
	if(addtype == null)
		addtype = "TT";
	
	%><center>
		<form name="addQeustion" action="examEdit_ok.jsp" method="post">
			<table>
				<tr>
					<td><h3>문제 출제하기</h3></td>
					<td>문제 유형<select name="addtype" onchange="selectQType()">
							<option value="TT">TT</option>
							<option value="IT">IT</option>
							<option value="TI">TI</option>
					</select></td>
				</tr>
				<%
	if(addtype.equals("TT"))
	{
		%>
				<tr>
					<td>문제</td>
					<td><input type="text" name="question"></td>
				</tr>
				<tr>
					<td>문제이미지</td>
					<td><input type="text" name="qimage"></td>
				</tr>
				<tr>
					<td>보기1</td>
					<td><input type="text" name="ex1"></td>
				</tr>
				<tr>
					<td>보기2</td>
					<td><input type="text" name="ex2"></td>
				</tr>
				<tr>
					<td>보기3</td>
					<td><input type="text" name="ex3"></td>
				</tr>
				<tr>
					<td>보기4</td>
					<td><input type="text" name="ex4"></td>
				</tr>
				<tr>
					<td>정답</td>
					<td><input type="text" name="answer"></td>
				</tr>
				<%
	}
	else if(addtype.equals("IT"))
	{
		%>
				<tr>
					<td>문제</td>
					<td><input type="text" name="question"></td>
				</tr>
				<tr>
					<td>문제이미지</td>
					<td><input type="text" name="qimage"></td>
				</tr>
				<tr>
					<td>보기1</td>
					<td><input type="text" name="ex1"></td>
				</tr>
				<tr>
					<td>보기2</td>
					<td><input type="text" name="ex2"></td>
				</tr>
				<tr>
					<td>보기3</td>
					<td><input type="text" name="ex3"></td>
				</tr>
				<tr>
					<td>보기4</td>
					<td><input type="text" name="ex4"></td>
				</tr>
				<tr>
					<td>정답</td>
					<td><input type="text" name="answer"></td>
				</tr>
				<%
	}
	else if(addtype.equals("TI"))
	{
		%>
				<tr>
					<td>문제</td>
					<td><input type="text" name="question"></td>
				</tr>
				<tr>
					<td>문제이미지</td>
					<td><input type="text" name="qimage"></td>
				</tr>
				<tr>
					<td>보기1</td>
					<td><input type="text" name="ex1"></td>
				</tr>
				<tr>
					<td>보기2</td>
					<td><input type="text" name="ex2"></td>
				</tr>
				<tr>
					<td>보기3</td>
					<td><input type="text" name="ex3"></td>
				</tr>
				<tr>
					<td>보기4</td>
					<td><input type="text" name="ex4"></td>
				</tr>
				<tr>
					<td>정답</td>
					<td><input type="text" name="answer"></td>
				</tr>
				<%
	}
%>
			</table>
			<input type="submit" value="문제 출제" ">
			<input type="hidden" value="1" name="requestType">
		</form>
		<p id="error" />
		<table style="border-collapse: collapse; border: 1px" border="1">
			<%!
				String check(String str, char type) {
		if (type == 'I')
		{
			str = "<img src=image/" + str + ">";
			return str;
		}
			else str = "";
		return str;
			}%>
			<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
			String address = "localhost";
			String address1 = "orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com";
			String url = "jdbc:oracle:thin:@" + address1 + ":1521:orcl";
					int number = 1;
					try {
						Class.forName(driver); //드라이버 이름으로 드라이버를 로드
						conn = DriverManager.getConnection(url, "smj459", "min6422");
						pstmt = conn.prepareStatement(
								"select * from quiz order by q_num");
						rs = pstmt.executeQuery();
						while (rs.next()) {
							String question = rs.getString("Q_QUESTION");
							String qImage = rs.getString("Q_IMAGE");
							String ex[] = { rs.getString("Q_EX1"), rs.getString("Q_EX2"), rs.getString("Q_EX3"),
									rs.getString("Q_EX4") };
							String type = rs.getString("Q_TYPE");
							String answer = rs.getString("Q_ANSWER");
							char type1 = type.charAt(0), type2 = type.charAt(1);
							int qNum = rs.getInt("Q_NUM");
				%>
			<tr>
				<td rowspan=2><h3>
						<%=qNum%><br>
					</h3></td>
			</tr>
			<tr>
				<td colspan=5><%=question%> <%if (type1 == 'I'){%><br> <img
					src="image/<%=qImage%>"> <%} %></td>
			</tr>
			<tr>
				<td>보기</td>
				<td><%=ex[0]%><%=check(ex[0], type2)%></td>
				<td><%=ex[1]%><%=check(ex[1], type2)%></td>
				<td><%=ex[2]%><%=check(ex[2], type2)%></td>
				<td><%=ex[3]%><%=check(ex[3], type2)%></td>
			</tr>
			<tr>
				<td>정답</td>
				<td><%=answer%><%=check(answer, type2)%></td>
				<td><a href="examEdit_ok.jsp?requestType=2&qnum=<%=qNum%>">삭제하기</a></td>
			</tr>
			<%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
		</table>
	</center>
</body>
</html>