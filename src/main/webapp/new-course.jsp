<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.User" %>
<%
  User user = (User) session.getAttribute("user");
  if(user == null){
    response.sendRedirect("login.jsp");
  }
%>
<html>
<head>
    <title>Courses | New</title>
  <%@include file="components/styles.jspf"%>
</head>
<body>
<div class="main__wrapper">
  <%@ include file="components/sidebar.jspf" %>
  <!--Main Content-->
  <div class="main-content">
    <%@ include file="components/navigation.jspf" %>
    <main>
      <p class="page-title">Course</p>
      <p class="page-subtitle">Add new course.</p>
      <div class="content-wrapper">
        <form action="new-course" method="post">
          <div class="form-group">
            <label for="courseName" class="form-label">Course Name:</label>
            <input type="text" autocomplete="off" name="courseName" id="courseName" placeholder="Diploma in Software Eng."  class="form-control">
          </div>
          <div class="form-group">
            <label for="courseCode" class="form-label">Course Code:</label>
            <input type="text" autocomplete="off" name="courseCode" id="courseCode" placeholder="DIPSOE" class="form-control">
          </div>
          <div class="form-group">
            <label for="courseDuration" class="form-label">Duration:</label>
            <input type="number" autocomplete="off" name="courseDuration" id="courseDuration" placeholder="3 Years" class="form-control">
          </div>
          <button type="submit" class="btn btn-primary mt-3">
            <i class="fas fa-plus btn-icon"></i>
            Save New Course
          </button>
        </form>
      </div>
    </main>
  </div>
</div>
<%@include file="components/scripts.jspf"%>
</body>
</html>
