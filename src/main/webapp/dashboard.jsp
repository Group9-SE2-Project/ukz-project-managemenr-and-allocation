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
    <title>Dashboard</title>
    <%@include file="components/styles.jspf"%>
</head>
<body>
<div class="main__wrapper">
    <%@ include file="components/sidebar.jspf" %>
    <!--Main Content-->
    <div class="main-content">
        <%@ include file="components/navigation.jspf" %>
        <main>
            <p class="page-title">Dashboard</p>
            <p class="page-subtitle">Welcome to your dashboard.</p>
            <div class="content-wrapper">
                <p class="text-tagline">Logged In as : <%= (user !=null) ? user.getFirstName() + " " + user.getLastName() : "" %> (<%=(user !=null) ? user.getAuthID() : ""%>)</p>
            </div>
            <hr>
            <%
                if(user.getRole() == "admin" || user.getRole() == "lecturer"){
            %>
            <div class="d-flex gap-3">
                <div class="custom-card">
                    <div class="custom-card-header">
                        <p class="custom-card-title">Modules</p>
                    </div>
                    <div class="custom-card-body">
                        <p class="m-0">See all uploaded modules.</p>
                        <h1>0</h1>
                        <a href="#" class="btn btn-primary mt-2">
                            <i class="fas fa-eye btn-icon"></i>
                            View Details
                        </a>
                    </div>
                </div>
                <div class="custom-card">
                    <div class="custom-card-header">
                        <p class="custom-card-title">Allocations</p>
                    </div>
                    <div class="custom-card-body">
                        <p class="m-0">Collections of student allocation.</p>
                        <h1>0</h1>
                        <a href="#" class="btn btn-primary mt-2">
                            <i class="fas fa-eye btn-icon"></i>
                            View Details
                        </a>
                    </div>
                </div>
                <div class="custom-card">
                    <div class="custom-card-header">
                        <p class="custom-card-title">Projects</p>
                    </div>
                    <div class="custom-card-body">
                        <p class="m-0">Recently added projects.</p>
                        <h1>0</h1>
                        <a href="#" class="btn btn-primary mt-2">
                            <i class="fas fa-eye btn-icon"></i>
                            View Details
                        </a>
                    </div>
                </div>
            </div>
            <%}else{%>
            <div class="d-flex gap-3">
                <div class="custom-card">
                    <div class="custom-card-header">
                        <p class="custom-card-title">Modules</p>
                    </div>
                    <div class="custom-card-body">
                        <p class="m-0">See all your modules.</p>
                        <a href="#" class="btn btn-primary mt-2">
                            <i class="fas fa-eye btn-icon"></i>
                            View Details
                        </a>
                    </div>
                </div>
                <div class="custom-card">
                    <div class="custom-card-header">
                        <p class="custom-card-title">Allocations</p>
                    </div>
                    <div class="custom-card-body">
                        <p class="m-0">See projects allocated to you.</p>
                        <a href="#" class="btn btn-primary mt-2">
                            <i class="fas fa-eye btn-icon"></i>
                            View Details
                        </a>
                    </div>
                </div>
                <div class="custom-card">
                    <div class="custom-card-header">
                        <p class="custom-card-title">Profile</p>
                    </div>
                    <div class="custom-card-body">
                        <p class="m-0">Manage your profile.</p>
                        <a href="#" class="btn btn-primary mt-2">
                            <i class="fas fa-user btn-icon"></i>
                            Manage Profile
                        </a>
                    </div>
                </div>
            </div>
            <%}%>
        </main>
    </div>
</div>
<%@include file="components/scripts.jspf"%>
</body>
</html>
