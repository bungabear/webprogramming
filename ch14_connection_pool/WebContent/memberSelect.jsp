<%@ page import="Member_Package.MemberDto"%>
<%@ page import="Member_Package.MemberDao"%>

<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memberSelect.jsp" method="post">
		<table border="0">
			<caption>멤버 검색</caption>
			<tr>
				<td>검색 유형</td>
				<td>값</td>
			</tr>
			<tr>
				<td><select name="type">
						<option value="id">아이디</option>
						<option value="name">이름</option>
				</select></td>
				<td><input type="text" name="value"></td>
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
	</form>
	<table width="600" cellpadding="0" cellspacing="0" border="1">
		<caption>회원 목록</caption>
		<tr>
			<td width="70">아이디</td>
			<td width="70">패스</td>
			<td width="70">이름</td>
			<td width="140">이메일</td>
			<td width="250">주소</td>
		</tr>
	</table>
	<%
		request.setCharacterEncoding("euc-kr");

		MemberDao m_dao = MemberDao.getInstance();
		ArrayList<MemberDto> dtos;
		String type = request.getParameter("type");
		String value = request.getParameter("value");
		if (request.getParameter("value") == null) {
			dtos = m_dao.getList();
		} else {
			dtos = m_dao.searchMember(type, value);
		}

		// MemberDAO() 클래스를 이용하여 m_dao 객체 생성

		// memberDAO 에 있는 getList() 를 실행하고 나서 
		// ArrayList<MemberDto>	의 dtos 객체를 생성 후 
		// memberDao.getList() 를 dtos 로 반환 받아 출력
		for (int i = 0; i < dtos.size(); i++) { // dtos 를 size 만큼 for 문 돌림
			MemberDto dto = dtos.get(i); // dtos 의 i 번재 정보를 가져와 dto 에 저장
			String name = dto.getName(); // dto의 name 추출하여 저장
			String pw = dto.getPw();
			String id = dto.getId(); // dto의 id 추출하여 저장
			String email = dto.geteMail(); // dto의 email 추출하여 저장
			String address = dto.getAddress(); // dto의 address 추출하여 저장
	%>

	<table width="600" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td width="70"><%=id%></td>
			<td width="70"><%=pw%></td>
			<td width="70"><%=name%></td>
			<td width="140"><%=email%></td>
			<td width="250"><%=address%></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>

<!-- 소스에 보면 드라이버 로드하는 부분도 없고, 커넥션 객체 구하는 부분도 없고, 쿼리문도 없다.  -->











<%-- <%@ page import="Member_Package.MemberDto" %>
<%@ page import="Member_Package.MemberDao" %>

<%@ page import="java.util.ArrayList"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
MemberDao m_dao= MemberDao.getInstance();
// MemberDAO() 클래스를 이용하여 m_dao 객체 생성

ArrayList<MemberDto> dtos=m_dao.getList();
// memberDAO 에 있는 getList() 를 실행하고 나서 
// ArrayList<MemberDto>	의 dtos 객체를 생성 후 
// memberDao.getList() 를 dtos 로 반환 받아 출력
for(int i=0; i<dtos.size(); i++) {  // dtos 를 size 만큼 for 문 돌림
MemberDto dto=dtos.get(i);  // dtos 의 i 번재 정보를 가져와 dto 에 저장
String name = dto.getName();  // dto의 name 추출하여 저장
String pw=dto.getPw();
String id = dto.getId();      // dto의 id 추출하여 저장
String email = dto.geteMail();      // dto의 email 추출하여 저장
String address = dto.getAddress();  // dto의 address 추출하여 저장
			
out.println("이름 : " + name + ", 아이디 : " + id + ",  pass : " + pw + ",이메일 : " + email + ", 주소 : " + address + "<br />" );
}	
%>
</body></html>

<!-- 소스에 보면 드라이버 로드하는 부분도 없고, 커넥션 객체 구하는 부분도 없고, 쿼리문도 없다.  --> --%>