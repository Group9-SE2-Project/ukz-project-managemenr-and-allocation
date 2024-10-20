<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.User" %>
<%
  User user = (User) session.getAttribute("user");
%>
<html>
<head>
  <title>Features Page</title>
  <%@ include file="components/styles.jspf" %>
</head>
<body>
<div class="main__wrapper">
  <%@ include file="components/sidebar.jspf" %>
  <!--Main Content-->
  <div class="main-content">
    <%@ include file="components/navigation.jspf" %>
    <main>
      <p class="page-title">Features</p>
      <p class="page-subtitle">See our system features.</p>
      <div class="mt-3">
        <div class="d-flex gap-3">
          <div class="custom-card">
            <div class="custom-card-header">
              <p class="custom-card-title">Security</p>
            </div>
            <div class="custom-card-body">
              <p class="m-0">Our system is 100% secured with realtime user data protection.</p>
              <a href="#" class="btn btn-primary mt-4">
                <i class="fas fa-eye btn-icon"></i>
                View Details
              </a>
            </div>
          </div>
          <div class="custom-card">
            <div class="custom-card-header">
              <p class="custom-card-title">User Friendly</p>
            </div>
            <div class="custom-card-body">
              <p class="m-0">Provides a modern user interface designs.</p>
              <a href="#" class="btn btn-primary mt-4">
                <i class="fas fa-eye btn-icon"></i>
                View Details
              </a>
            </div>
          </div>
          <div class="custom-card">
            <div class="custom-card-header">
              <p class="custom-card-title">Accessibility</p>
            </div>
            <div class="custom-card-body">
              <p class="m-0">Easily accessible and can be used without internet connection.</p>
              <a href="#" class="btn btn-primary mt-4">
                <i class="fas fa-eye btn-icon"></i>
                View Details
              </a>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</div>
<%@include file="components/scripts.jspf" %>
</body>
</html>
