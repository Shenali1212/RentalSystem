<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Inquiries - Vehicle Rental</title>
	<link rel="stylesheet" type="text/css" href="../css/contactUs.css">
</head>
<body>
<!-- Header section -->
	<nav class="top-navbar">
        <div class="top-left">
            <div class="top-logo">
                <img src="photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>
        <div class="top-right">
            <a href="index.jsp" class="btn">Home</a>
            <a href="login.jsp" class="btn">Login</a>
            <a href="register.jsp" class="btn">Register</a>
        </div> 
    </nav>

<!-- error message -->
<h1>Something went wrong!</h1>

<!-- redirect to ContactUs.jsp -->
<a href = "ContactUs.jsp">
<input type = button name = "home" value = "Return Home">
</a>

</body>
</html>