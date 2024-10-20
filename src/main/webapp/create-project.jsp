<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.User" %>
<%@page import="java.sql.*"%>
<%
  User user = (User) session.getAttribute("user");
  if(user == null){
    response.sendRedirect("login.jsp");
  }
%>
<html>
<head>
  <title>Projects | New</title>
  <%@include file="components/styles.jspf"%>
</head>
<body>
<div class="main__wrapper">
  <%@ include file="components/sidebar.jspf" %>
  <!--Main Content-->
  <div class="main-content">
    <%@ include file="components/navigation.jspf" %>
    <main>
      <p class="page-title">Create Project</p>
      <p class="page-subtitle">Create new project.</p>
      <div class="content-wrapper">
        <form action="create-project" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="projectDoc">Project Document (PDF Only)</label>
            <input type="file" id="projectDoc" accept="application/pdf" name="projectDoc" class="form-control">
          </div>
          <div class="form-group">
            <label for="module" class="form-label">Module Name:</label>
            <select name="module" id="module" class="form-select">
              <%
                try{
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectallocationdb","root","CarlTech@_56");

                  Statement stmt = con.createStatement();
                  String sql = "select * from module";

                  ResultSet rs = stmt.executeQuery(sql);
                  while (rs.next()){
              %>
              <option value="<%=rs.getString("ModuleName")%>"><%=rs.getString("ModuleName")%></option>
              <%
                  }
                }
                catch (Exception e){
                  e.printStackTrace();
                }
              %>
            </select>
          </div>
          <div class="form-group">
            <label for="marks" class="form-label">Project Marks:</label>
            <input type="text" autocomplete="off" name="marks" id="marks" required placeholder="100 (Marks)"  class="form-control">
          </div>
          <div class="form-group">
            <label for="projectDesc">Project Description:</label>
            <textarea name="projectDesc" placeholder="Project Description" required id="projectDesc" cols="30" rows="5" class="form-control"></textarea>
          </div>
          <button type="submit" class="btn btn-primary mt-3">
            <i class="fas fa-plus btn-icon"></i>
            Save Project
          </button>
        </form>
      </div>
    </main>
  </div>
</div>
<%@include file="components/scripts.jspf"%>
</body>
</html>
