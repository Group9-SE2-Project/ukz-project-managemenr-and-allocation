<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.User" %>
<%
  User user = (User) session.getAttribute("user");
%>
<html>
<head>
    <title>Register Success</title>
  <%@include file="components/styles.jspf"%>
</head>
<body>
<div class="main__wrapper">
  <%@ include file="components/sidebar.jspf" %>
  <!--Main Content-->
  <div class="main-content">
    <%@ include file="components/navigation.jspf" %>
    <main>
      <p class="page-title">Request Success</p>
      <p class="page-subtitle">Your request was successfully processed with 0 errors.</p>
      <div class="mt-2">
        <i style="font-size: 40px" class="fa fa-check-circle text-success"></i>
      </div>
    </main>
  </div>
</div>
<%@include file="components/scripts.jspf"%>
</body>
</html>
