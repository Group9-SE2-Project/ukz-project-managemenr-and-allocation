<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.User" %>
<%@page import="db_connection.UserDatabase" %>
<%@page import="user.Student" %>
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
  <title>Students List</title>
  <%@ include file="components/styles.jspf" %>
</head>
<body>
<div class="main__wrapper">
  <%@ include file="components/sidebar.jspf" %>
  <!--Main Content-->
  <div class="main-content">
    <%@ include file="components/navigation.jspf" %>
    <main>
      <p class="page-title">Students</p>
      <p class="page-subtitle">See the list of students.</p>
      <div class="mt-4 table">
        <div class="my-3">
          <a href="register.jsp" class="btn btn-dark">Enroll New Student</a>
        </div>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>ID</th>
              <th>Student ID</th>
              <th>Email</th>
              <th>First Name</th>
              <th>Last Name</th>
            </tr>
          </thead>
          <tbody>
            <%
              try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectallocationdb","root","CarlTech@_56");

                Statement stmt = con.createStatement();
                String sql = "select * from students";

                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()){
            %>
            <tr>
              <td><%=rs.getInt("Id")%></td>
              <td><%=rs.getString("StudentID")%></td>
              <td><%=rs.getString("Email")%></td>
              <td><%=rs.getString("FirstName")%></td>
              <td><%=rs.getString("LastName")%></td>
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
