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
		
		