<%@page import="DAO_DTO.MemberDTO"%>
<%@page import="DAO_DTO.MemberDAO"%>
<!--  패키지이름.클래스이름  으로 import -->
<%@page import="java.util.ArrayList"%>
<!-- ArrayList 사용하겠다고 선언 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<table border=1>
		<th width=80>이름</th>
		<th width=100>아이디</th>
		<th width=80>비밀번호</th>
		<th width=150>연락처</th>
		<th width=50>성별</th>
		<th colspan=2>수정</th>


		<%
			MemberDAO memberDAO = new MemberDAO();
			// MemberDAO() 클래스를 이용하여 memberDAO 객체 생성
			// MemberDAO의 20라인까지 수행됨

			ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
			// memberDAO 에 있는 memberSelect() 를 실행하고 나서 
			// ArrayList 형태의 dtos 객체를 만드는데
			// 데이터구조는 MemberDTO 이다
			// memberDAO.memberSelect()를 수행후 dtos로 반환 받아 출력
			// memberDAO.memberSelect() 가 보고 올 것

			// dtos 를 반환받아 출력 
			for (int i = 0; i < dtos.size(); i++) { // dtos 를 size 만큼 for 문 돌림
				MemberDTO dto = dtos.get(i); // dtos 의 i 번재 정보를 가져와 dto 에 저장
				String name = dto.getName(); // dto의 name 추출하여 저장
				String id = dto.getId(); // dto의 id 추출하여 저장
				String pw = dto.getPw(); // dto의 pw 추출하여 저장
				String phone = dto.getPhone1() + " - " + dto.getPhone2() + " - " + dto.getPhone3();
				String gender = dto.getGender(); // dto의 gender 추출하여 저장
		%>
		<tr>
			<td width=80>
				<%
					out.println(name);
				%>
			</td>
			<td width=100>
				<%
					out.println(id);
				%>
			</td>
			<td width=80>
				<%
					out.println(pw);
				%>
			</td>
			<td width=150>
				<%
					out.println(phone);
				%>
			</td>
			<td width=50>
				<%
					out.println(gender);
				%>
			</td>
			<td>
				<form action="memberEdit.jsp" method="post">
					<input type="hidden" name="id" value="<%=id%>">
					<input
						type="submit" value="수정">
				</form>
			</td>
			<td>
				<form action="input_OK" method="post">
					<input type="hidden" name="type" value="delete"><input
						type="hidden" name="id" value="<%=id%>"><input
						type="submit" value="삭제">
				</form>
			</td>
		</tr>

		<!-- out.println("이름:" + name + ", ID:" + id + ", PW:" + pw + ", 연락처:" + phone + ",  성별:" + gender + "<br />" ); -->
		<%
			}
		%>
	</table>
</body>
</html>









<%-- <body>
<%
MemberDAO memberDAO = new MemberDAO();
// MemberDAO() 클래스를 이용하여 memberDAO 객체 생성
// MemberDAO의 20라인까지 수행됨

ArrayList<MemberDTO> dtos = 
      memberDAO.memberSelect();
// memberDAO 에 있는 memberSelect() 를 실행하고 나서 
// ArrayList 형태의 dtos 객체를 만드는데
// 데이터구조는 MemberDTO 이다
// memberDAO.memberSelect()를 수행후 dtos로 반환 받아 출력
// memberDAO.memberSelect() 가 보고 올 것

// dtos 를 반환받아 출력 
for(int i=0; i<dtos.size(); i++) {  // dtos 를 size 만큼 for 문 돌림
MemberDTO dto = dtos.get(i);  // dtos 의 i 번재 정보를 가져와 dto 에 저장
String name = dto.getName();  // dto의 name 추출하여 저장
String id = dto.getId();      // dto의 id 추출하여 저장
String pw = dto.getPw();      // dto의 pw 추출하여 저장
String phone = dto.getPhone1() + " - "+ dto.getPhone2() + " - " + dto.getPhone3();
String gender = dto.getGender();  // dto의 gender 추출하여 저장
			
out.println("이름:" + name + ", ID:" + id + ", PW:" + pw + ", 연락처:" + phone + ",  성별:" + gender + "<br />" );
}	
%>
</body></html>
 --%>
