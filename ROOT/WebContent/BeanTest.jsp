<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%-- <jsp:setProperty name="beantest" property="name" value="KBS"/> --%>
<jsp:useBean id="beantest" class="join.BeanTest" scope="page"/>
<jsp:setProperty name= "beantest" property="name" param="nameA"/>

<html><head>
<title>JavaBean Test</title>
</head><body>
<b>�ڹٺ� ��� ����</b>

<%-- <h3>    <%= beantest.getName() %>      </h3> --%>
<h3><jsp:getProperty name= "beantest" property= "name" />   </h3>
<!-- request���� ������ �ʿ䰡 ���� setter�� getter���� �������� �� �ִ�.. -->
</body></html>
