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
      <script src="dobValidation.js"></script>     
      <script>
      document.addEventListener("DOMContentLoaded", function () {
    	    // Form validation logic
    	    const form = document.querySelector('form');
    	    const emailInput = document.getElementById('email');
    	    console.log(emailInput.value);
    	    const mobileInput = document.getElementById('mobile');
    	    const usernameInput = document.getElementById('username');
    	    console.log(usernameInput.value);
    	    const passwordInput = document.getElementById('password');

    	    // Validation messages
    	    const emailError = document.createElement('small');
    	    const mobileError = document.createElement('small');
    	    const usernameError = document.createElement('small');
    	    const passwordError = document.createElement('small');

    	    emailError.className = "error-message";
    	    mobileError.className = "error-message";
    	    usernameError.className = "error-message";
    	    passwordError.className = "error-message";

    	    // Append error messages below respective inputs 
    	    emailInput.parentElement.appendChild(emailError);
    	    mobileInput.parentElement.appendChild(mobileError);
    	    usernameInput.parentElement.appendChild(usernameError);
    	    passwordInput.parentElement.appendChild(passwordError);

    	    // Function to validate email (simulated server check)
    		async function validateEmail() {
    		        const email = emailInput.value;
    		        const response = await fetch(`CheckEmailExists?email=${email}`);
    		        const result = await response.text();
    		        if (result.exists == "true") {
    		            emailError.textContent = "Email already exists.";
    		            return false;
    		        } else {
    		            emailError.textContent = "";
    		            return true;
    		        }
    		    }

    	    // Function to validate mobile number (exactly 10 digits)
    	    function validateMobile() {
    	        const mobile = mobileInput.value;
    	        if (!/^\d{10}$/.test(mobile)) {
    	            mobileError.textContent = "Mobile number must be exactly 10 digits.";
    	            return false;
    	        } else {
    	            mobileError.textContent = "";
    	            return true;
    	        }
    	    }

    	    // Function to validate username (simulated server check)
    		async function validateUsername() {
    		    const username = usernameInput.value;
    		    const response = await fetch(`CheckUsernameExists?username=${username}`);
    		    const result = await response.text(); // Handle plain text response
    		    if (result === "true") {  // Compare result to "true"
    		        usernameError.textContent = "Username already exists.";
    		        return false;
    		    } else {
    		        usernameError.textContent = "";
    		        return true;
    		    }
    		}

    	    // Function to validate password strength
    	    function validatePassword() {
    	        const password = passwordInput.value;
    	        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    	        if (!passwordRegex.test(password)) {
    	            passwordError.textContent = "Password must be at least 8 characters long and include a mix of uppercase, lowercase, numbers, and special characters.";
    	            return false;
    	        } else {
    	            passwordError.textContent = "";
    	            return true;
    	        }
    	    }

    	    // Form submit event listener
    	    form.addEventListener('submit', async function (event) {
    	        event.preventDefault(); // Prevent form submission to handle validation

    	        const emailValid = await validateEmail();
    	        const mobileValid = validateMobile();
    	        const usernameValid = await validateUsername();
    	        const passwordValid = validatePassword();

    	        if (emailValid && mobileValid && usernameValid && passwordValid) {
    	            form.submit(); // If all validations pass, submit the form
    	        }
    	    });
    	});

      	
      </script>
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
        <h1>CREATE YOUR ACCOUNT</h1>
        <h3>Sign up to manage your vehicle rentals</h3>

        <!-- User Registration Form -->
        <div class="form-container">
            <h2>Sign Up Form</h2>
            <form action="signup" method="post">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="name">Name *</label>
                        <input type="text" name="name" id="name" required placeholder="Full Name">
                    </div>

                    <div class="form-group">
                        <label for="dob">Date of Birth (DOB)</label>
                        <input type="date" name="dob" id="dob" placeholder="Date of Birth">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" name="email" id="email" required placeholder="Email">
                    </div>

                    <div class="form-group">
                        <label for="mobile">Mobile *</label>
                        <input type="text" name="mobile" id="mobile" required placeholder="Mobile Number">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" name="address" id="address" placeholder="Address">
                    </div>
                </div>
                
                <input type="hidden" name="role" id="role" value="User">

                <div class="form-row">
                    <div class="form-group">
                        <label for="username">Username *</label>
                        <input type="text" name="uid" id="username" required placeholder="Username">
                        <small id="username-error" class="error-message"></small>
                    </div>

                    <div class="form-group">
                        <label for="password">Password *</label>
                        <input type="password" name="psw" id="password" required placeholder="Password">
                    </div>
                </div>

                <div class="form-row">
                    <button type="submit" class="submit-btn">Sign Up</button>
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