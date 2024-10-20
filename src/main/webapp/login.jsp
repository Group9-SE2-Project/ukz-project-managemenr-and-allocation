<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user != null){
        response.sendRedirect("dashboard.jsp");
    }
%>
<html>
<head>
    <title>Login</title>
    <%@ include file="components/styles.jspf" %>
</head>
<body>
<div class="main__wrapper">
    <%@ include file="components/sidebar.jspf" %>
    <!--Main Content-->
    <div class="main-content">
        <%@ include file="components/navigation.jspf" %>
        <main>
            <p class="page-subtitle">Provide your credentials to login.</p>
            <div class="content-wrapper">
                <form action="login" method="post">
                    <div class="form-group">
                        <label for="identity" class="form-label">Student/Staff ID:</label>
                        <input type="text" autocomplete="off" name="identity" id="identity" maxlength="8" placeholder="Max. 8 Char(s)" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password" class="form-label">Password:</label>
                        <input type="password" autocomplete="off" name="password" id="password" placeholder="At Least 6 Char(s)" class="form-control">
                    </div>
                    <p class="my-3">Forgot Password? <a href="register.jsp">Reset Password</a></p>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-sign-in btn-icon"></i>
                        Login
                    </button>
                </form>
            </div>
        </main>
    </div>
</div>
<%@include file="components/scripts.jspf" %>
</body>
</html>
