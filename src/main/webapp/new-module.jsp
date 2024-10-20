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
    <title>Modules | New</title>
    <%@include file="components/styles.jspf"%>
</head>
<body>
<div class="main__wrapper">
    <%@ include file="components/sidebar.jspf" %>
    <!--Main Content-->
    <div class="main-content">
        <%@ include file="components/navigation.jspf" %>
        <main>
            <p class="page-title">Module</p>
            <p class="page-subtitle">Add new module.</p>
            <div class="content-wrapper">
                <form action="new-module" method="post">
                    <div class="form-group">
                        <label for="moduleName" class="form-label">Module Name:</label>
                        <input type="text" autocomplete="off" name="moduleName" id="moduleName" placeholder="Information System"  class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="moduleCode" class="form-label">Module Code:</label>
                        <input type="text" autocomplete="off" name="moduleCode" id="moduleCode" placeholder="ISNN" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="courseId" class="form-label">Course:</label>
                        <select name="courseId" id="courseId" class="form-select">
                            <%
                                try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectallocationdb","root","CarlTech@_56");

                                    Statement stmt = con.createStatement();
                                    String sql = "select * from course";

                                    ResultSet rs = stmt.executeQuery(sql);
                                    while (rs.next()){
                                        %>
                                        <option value="<%=rs.getInt("CourseID")%>"><%=rs.getString("CourseName")%></option>
                                        <%
                                    }
                                }
                                catch (Exception e){
                                    e.printStackTrace();
                                }
                            %>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">
                        <i class="fas fa-plus btn-icon"></i>
                        Save New Module
                    </button>
                </form>
            </div>
        </main>
    </div>
</div>
<%@include file="components/scripts.jspf"%>
</body>
</html>
