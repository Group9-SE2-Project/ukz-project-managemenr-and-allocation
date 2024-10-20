<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.User" %>
<%@page import="db_connection.UserDatabase" %>
<%@page import="course.Course" %>
<%@page import="java.sql.*"%>
<%

%>
<%
  User user = (User) session.getAttribute("user");
  if(user == null){
    response.sendRedirect("login.jsp");
  }
%>
<html>
<head>
  <title>Projects List</title>
  <%@ include file="components/styles.jspf" %>
</head>
<body>
<div class="main__wrapper">
  <%@ include file="components/sidebar.jspf" %>
  <!--Main Content-->
  <div class="main-content">
    <%@ include file="components/navigation.jspf" %>
    <main>
      <p class="page-title">Projects</p>
      <p class="page-subtitle">See the list of projects.</p>
      <div class="mt-4 table">
        <div class="my-3">
          <a href="create-project.jsp" class="btn btn-dark">
                        <span>
                            <i class="fa fa-plus btn-icon"></i>
                        </span>
            Add New Project
          </a>
        </div>
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>Project ID</th>
            <th>Module Name</th>
            <th>Upload Status</th>
            <th></th>
          </tr>
          </thead>
          <tbody>
          <%
            try{
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectallocationdb","root","CarlTech@_56");

              Statement stmt = con.createStatement();
              String sql = "select * from project";

              ResultSet rs = stmt.executeQuery(sql);
              while (rs.next()){
          %>
          <tr>
            <td><%=rs.getInt("ProjectID")%></td>
            <td><%=rs.getString("ModuleName")%></td>
            <td>
              <%if(rs.getString("UploadStatus")=="Pending"){%>
              <span class="text-danger"><%=rs.getString("UploadStatus")%></span>
              <%}else{%>
              <span class="text-success"><%=rs.getString("UploadStatus")%></span>
              <%}%>
            </td>
            <td>
              <a href="#" class="btn btn-sm btn-primary">
                <i class="fa fa-upload btn-icon"></i>
                Upload Document
              </a>
            </td>
          </tr>
          <%
              }
            }
            catch (Exception e){
              e.printStackTrace();
            }
          %>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>
<%@include file="components/scripts.jspf" %>
</body>
</html>

