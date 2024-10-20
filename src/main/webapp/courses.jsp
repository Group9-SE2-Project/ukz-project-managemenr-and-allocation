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
    <title>Courses List</title>
    <%@ include file="components/styles.jspf" %>
</head>
<body>
<div class="main__wrapper">
    <%@ include file="components/sidebar.jspf" %>
    <!--Main Content-->
    <div class="main-content">
        <%@ include file="components/navigation.jspf" %>
        <main>
            <p class="page-title">Courses</p>
            <p class="page-subtitle">See the list of all available courses.</p>
            <div class="mt-4 table">
                <div class="my-3">
                    <a href="new-course.jsp" class="btn btn-dark">
                        <span>
                            <i class="fa fa-plus btn-icon"></i>
                        </span>
                        Add New Course
                    </a>
                    <a href="modules.jsp" class="btn btn-success">
                        <span>
                            <i class="fa fa-list btn-icon"></i>
                        </span>
                        Modules
                    </a>
                </div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Course Code</th>
                        <th>Duration</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectallocationdb","root","CarlTech@_56");

                            Statement stmt = con.createStatement();
                            String sql = "select * from course";

                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getInt("CourseID")%></td>
                        <td><%=rs.getString("CourseName")%></td>
                        <td><%=rs.getString("CourseCode")%></td>
                        <td><%=rs.getString("Duration")%> (Years)</td>
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
