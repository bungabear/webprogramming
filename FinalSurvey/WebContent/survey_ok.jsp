<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Survey.SurveyDAO"%>
<%@page import="Survey.SurveyDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String id = (String)session.getAttribute("id");
	
	String answer1 = request.getParameter("answer");
	int answer = 0;
	if(answer1 !=null)
	{
		answer = Integer.parseInt(answer1);
	}
	else
	{
		%>
		<script language="javascript">
			alert("�׸��� �������ּ���");
			history.go(-1);
		</script>
		<%
	}
	SurveyDAO dao = SurveyDAO.getInstance();
	//SurveyDTO dto = new SurveyDTO(id, answer);
	System.out.println(dao.checkAnswered(id));
	if(dao.checkAnswered(id) == true)
	{
		
		%>
		<script language="javascript">
			alert("�̹� ��ǥ�� �Ͽ����ϴ�");
			history.go(-1);
		</script>
		<%
	}
	else
	{
		SurveyDTO dto = new SurveyDTO(id, answer);
		dao.insertAnswer(dto);
		response.sendRedirect("surveyResult.jsp");
	}
%>

</body>
</html>