<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%-- <jsp:setProperty name="beantest" property="name" value="KBS"/> --%>
<jsp:useBean id="beantest" class="join.BeanTest" scope="page"/>
<jsp:setProperty name= "beantest" property="name" param="nameA"/>

<html><head>
<title>JavaBean Test</title>
</head><body>
<b>자바빈 사용 예제</b>

<%-- <h3>    <%= beantest.getName() %>      </h3> --%>
<h3><jsp:getProperty name= "beantest" property= "name" />   </h3>
<!-- request에서 가져올 필요가 없고 setter와 getter에서 가져와줄 수 있다.. -->
</body></html>
