<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/signup.css">
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
    
    <!-- Main Content -->
    <div class="main-container">
        <h1>EDIT YOUR ACCOUNT</h1>
        <h3>Edit Your Information</h3>

		<%
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String dob = request.getParameter("dob");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String role = request.getParameter("role");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
		%>

        <!-- User Registration Form -->
        <div class="form-container">
            <h2>Edit Form</h2>
            <form action="updateU" method="post">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="name">User ID *</label>
                        <input type="text" name="id" id="id"  value=<%=id %> readonly>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="name">Name *</label>
                        <input type="text" name="name" id="name"  value=<%=name %> >
                    </div>

                    <div class="form-group">
                        <label for="dob">Date of Birth (DOB)</label>
                        <input type="date" name="dob" id="dob"  value=<%=dob %>>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" name="email" id="email"  value=<%=email %>>
                    </div>

                    <div class="form-group">
                        <label for="mobile">Mobile *</label>
                        <input type="text" name="mobile" id="mobile"  value=<%=mobile %>>
                    </div>
                </div>
                
				<input type="hidden" name="role" id="role"  value=<%=role %>>
				
                <div class="form-row">
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" name="address" id="address"  value=<%=address %>>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="username">Username *</label>
                        <input type="text" name="uid" id="username"  value=<%=username %>>
                    </div>

                    <div class="form-group">
                        <label for="password">Password *</label>
                        <input type="password" name="psw" id="password"  value=<%=password %>>
                    </div>
                </div>

                <div class="form-row">
                    <button type="submit" class="submit-btn">Edit</button>
                </div>
            </form>
        </div>
    </div>
    
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