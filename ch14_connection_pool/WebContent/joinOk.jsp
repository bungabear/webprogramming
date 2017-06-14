<%@page import="java.sql.Timestamp"%>
<%@page import="Member_Package.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!-- �׼� �±� ���  -->
<jsp:useBean id="dto" class="Member_Package.MemberDto"/>
<!--  �ڹ� ���� ����ϴµ� �̸��� dto �� �ϰڴ�.   -->
<jsp:setProperty name="dto" property="*" />
<!--  * �� ��� property�� �ѹ��� set �ϰڴ�.  -->
<!-- dto�� �ʵ��� �������� name ���� ���� �� �ϰ� set �ϱ� ���� ���  -->

<!-- UI �� ���� ��ſ� ���� ������ ���Ե�
���⼭ ȸ�� ���� ó���� ���� �ʰ� Dao�� �����͸� ���´ٰ� 
���⼭�� ��ȯ �޾� ����� ó��  -->
<%
dto.setrDate(new Timestamp(System.currentTimeMillis()));
 /* �ð��� �������� �˾Ƽ� ó�� ȸ�� ���Խ� �ð� ���� dto�� setter ������ 60-66 */
MemberDao dao = MemberDao.getInstance();
/* �̱��� ���� -- getInstance�� �������� �ʰ� �ٷ� �����ؼ� ���  */
/* MemberDao.getInstance(); �� ���� �� ��  */
/* MemberDao.java �� MemberDao()�� ������   private �̹Ƿ� �ٷ� ���� �ȵ� 
 ���� public static MemberDao getInstance() ����� �ٷ� �����Ͽ� ��� */
if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT) {
	/* ������ �Է��� ID�� dto ��ü�� ���, �� id�� �̾Ƽ� 
	confirmId()�� ���´ٰ� ��� ��ȯ  ��� ���� �̰����� ���� �� 
	id ���� confirmId()�� ���´ٰ� 0 �̳� 1 �� ��ȯ ����*/
%>
		<script language="javascript">
			alert("���̵� �̹� ���� �մϴ�."); // 1 �̸� 
			history.back();   /* �������� �ڷ� ���� */
		</script>
<%
		} else {    // 0 �̸� 
		/* ��ȯ���� 1�� �ƴϸ� ������ ������ dto ��ü�� ������ 
		dao.insertMember()�� ���ٰ� ����� �޾� ri �� ����*/
			int ri = dao.insertMember(dto);
			/* dao.insertMember() �� ���� �� ��*/
			if(ri == MemberDao.MEMBER_JOIN_SUCCESS) {
				/* ��ȯ����  1 �̸� */
				session.setAttribute("id", dto.getId());
%>
			<script language="javascript">
				alert("ȸ�������� ���� �մϴ�.");
				document.location.href="login.jsp";
			</script>
<%
			} else {
				/* ��ȯ����  0 �̸� */
%>
			<script language="javascript">
				alert("ȸ�����Կ� �����߽��ϴ�.");
				document.location.href="login.jsp";
			</script>
<%
			}
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>	</body></html>