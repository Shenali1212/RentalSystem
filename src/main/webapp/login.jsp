<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Vehicle Rental</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

    <!-- Top Navigation Bar (with logo) -->
    <nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>

          <div class="top-right">
            <!-- Other Links (Optional) -->
            <a href="signupPage.jsp" class="btn">Register</a>
        </div> 
    </nav>

    <!-- Login Form Section -->
    <div class="login-container">
        <div class="login-box">
            <h2>Login</h2>
            <c:if test="${not empty errorMessage}">
        		<div class="error-message">
            		<p style="color: red;">${errorMessage}</p>
            		<br>
        		</div>
    		</c:if>
            <form action="log" method="post">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="uid" name="uid" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="pass" name="pass" required>
                </div>
                <div class="input-group">
                    <button type="submit" class="btn login-btn">Login</button>
                </div>
            </form>
            <p>Don't have an account? <a href="signupPage.jsp">Register here</a>.</p>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h3>Motorista Vehicle Rental</h3>
                <p>&copy; 2024 All rights reserved</p>
            </div>

            <div class="footer-center">
                <h3>Contact Us</h3>
                <p>Email: support@motorista.com</p>
                <p>Phone: +1 123 456 7890</p>
            </div>

            <div class="footer-right">
                <h3>Follow Us</h3>
                <div class="social-icons">
                    	<a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                        <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.linkedin.com/"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>