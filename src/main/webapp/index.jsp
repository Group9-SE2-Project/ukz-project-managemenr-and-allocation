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
    <title>Home Page</title>
    <%@ include file="components/styles.jspf" %>
</head>
<body>
<div class="main__wrapper">
    <%@ include file="components/sidebar.jspf" %>
    <!--Main Content-->
    <div class="main-content">
        <%@ include file="components/navigation.jspf" %>
        <main>
            <p class="page-title">Welcome !</p>
            <p class="page-subtitle">A multi-tenant system managing organization’s employees’ allocations,
                track allocation history, billability and
                generate various reports regarding the allocation of resources.</p>
            <div class="content-wrapper">
                <p>Visit your dashboard <%= (user !=null) ? user.getFirstName() + " " + user.getLastName() : "" %></p>
                <form action="logout" method="post">
                    <button class="btn btn-primary" type="submit">
                        <i class="fa fa-sign-out-alt btn-icon"></i>
                        Logout
                    </button>
                </form>
            </div>
        </main>
    </div>
</div>
<%@include file="components/scripts.jspf" %>
</body>
</html>
