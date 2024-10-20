<%@ page import="user.User" %>
<%
  User user = (User) session.getAttribute("user");
  if(user == null){
    response.sendRedirect("login.jsp");
  }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
  <%@include file="components/styles.jspf"%>
</head>
<body>
<div class="main__wrapper">
  <%@ include file="components/sidebar.jspf" %>
  <!--Main Content-->
  <div class="main-content">
    <%@ include file="components/navigation.jspf" %>
    <main>
      <p class="page-title">Register</p>
      <p class="page-subtitle">Register user details.</p>
      <div class="content-wrapper">
        <input type="hidden" name="status" id="status" value="<%= request.getAttribute("status")%>">
        <form action="register" method="post">
          <div class="form-group">
            <label for="identity" class="form-label">Student/Staff ID:</label>
            <input type="text" autocomplete="off" name="identity" id="identity" placeholder="Max. 8 Char(s)" maxlength="8" class="form-control">
          </div>
          <div class="form-group">
            <label for="role">Role:</label>
            <select id="role" name="role" class="form-select mt-1">
              <option value="" selected>Select Role</option>
              <option value="">Lecturer</option>
              <option value="Student">Student</option>
            </select>
          </div>
          <div class="form-input-split">
            <div>
              <label for="first_name">First Name:</label>
              <input type="text" autocomplete="off" id="first_name" class="form-control" name="first_name" placeholder="John">
            </div>
            <div>
              <label for="last_name">Last Name:</label>
              <input type="text" autocomplete="off" id="last_name" class="form-control" name="last_name" placeholder="Doe">
            </div>
          </div>
          <div class="form-group">
            <label for="password" class="form-label">Password:</label>
            <input type="password" autocomplete="off" name="password" id="password" placeholder="At Least 6 Char(s)" class="form-control">
          </div>
          <div class="form-group">
            <label for="confirm_password" class="form-label">Confirm Password:</label>
            <input type="password" autocomplete="off" name="confirm_password" id="confirm_password" placeholder="At Least 6 Char(s)" class="form-control">
          </div>
          <button type="submit" class="btn btn-primary mt-3">
            <i class="fas fa-sign-in btn-icon"></i>
            Enroll Staff/ Student
          </button>
        </form>
      </div>
    </main>
  </div>
</div>
<%@include file="components/scripts.jspf" %>
</body>
</html>
