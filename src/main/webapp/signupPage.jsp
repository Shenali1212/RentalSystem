<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css"> 
<link rel="stylesheet" type="text/css" href="css/signupPage.css"> 
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
    </nav>
    
    <div class="account-selection">
        <h2>Select an Account Type to Get Started</h2>
        <p>Please choose your role to proceed with the vehicle rental system.</p>

        <div class="account-options">
            <!-- Vehicle Owner option -->
            <div class="account-card">
                <h3>Vehicle Owner</h3>
                <img src="photos/man-stands-next-to-new-car-holds-key-his-hand-happy-vehicle-owner-white-background-buying-automobile-vector-illustration-149991998.webp" width="170" height="120">
                <p><i class="fa fa-check" aria-hidden="true"></i>Register your vehicle
                <br><i class="fa fa-check" aria-hidden="true"></i>Set rental prices
                <br><i class="fa fa-check" aria-hidden="true"></i>Manage bookings.</p>
                <button onclick="window.location.href='ownersignup.jsp'">Sign Up</button>
            </div>

            <!-- Customer option -->
            <div class="account-card">
                <h3>Customer</h3>
                <img src="photos/amazing-icon-voter-avatar-editable-design-style_142112-3583.avif" width="150" height="120">
                <p><i class="fa fa-check" aria-hidden="true"></i>Browse available vehicles <br>
                <i class="fa fa-check" aria-hidden="true"></i>Make reservations<br>
                <i class="fa fa-check" aria-hidden="true"></i>rental experience.</p>
                <button onclick="window.location.href='usersignup.jsp'">Sign Up</button>
            </div>
        </div>
    </div>
    
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h3>Inspire Vehicle Rental</h3>
                <p>&copy; 2024 All rights reserved</p>
            </div>

            <div class="footer-center">
                <h3>Contact Us</h3>
                <p>Email: support@inspire.com</p>
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