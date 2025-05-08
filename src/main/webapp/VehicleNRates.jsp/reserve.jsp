<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String name = (String) session.getAttribute("name");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/rentForm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<title>Reserve Vehicle</title>

<script>
    // Function to get a URL parameter by name
    function getUrlParameter(name) {
        let params = new URLSearchParams(window.location.search);
        return params.get(name);
    }

    // Fill the hidden vehicleId and price inputs when the page loads
    window.onload = function() {
        const vehicleId = getUrlParameter('vehicleId');
        const price = getUrlParameter('price');
        
        console.log("Vehicle ID:", vehicleId);
        console.log("Price:", price);  // Debugging line


        // Set the hidden input fields with the values from the URL
        if (vehicleId) {
            document.getElementById('vehicleIdInput').value = vehicleId;
        }
        if (price) {
            document.getElementById('priceInput').value = price;
        }
    };

    // Phone number validation
    function validatePhone() {
        var phone = document.getElementById("phone").value;
        var phonePattern = /^[0-9]{10}$/;
        if (!phone.match(phonePattern)) {
            document.getElementById("phoneError").innerText = "Please enter a valid 10-digit phone number.";
            return false;
        } else {
            document.getElementById("phoneError").innerText = "";
            return true;
        }
    }

    // Real-time price calculation
    function calDays() {
    var PD = document.getElementById("pdate").value;
    var RD = document.getElementById("rdate").value;
    var Price = parseFloat(document.getElementById("priceInput").value);

    console.log("Pickup Date:", PD);
    console.log("Return Date:", RD);
    console.log("Price per Day:", Price);

    const First = new Date(PD);
    const Second = new Date(RD);

    if (First && Second && Price) {
        const time = Math.abs(Second - First);
        const days = Math.ceil(time / (1000 * 60 * 60 * 24));

        console.log("Number of Days:", days);  // Debugging line

        if (days > 0) {
            const total = days * Price;
            console.log("Total Price:", total);  // Debugging line
            document.getElementById("out").innerHTML = "Total Price: " + total.toFixed(2);
            document.getElementById("TotalPrice").value =  total.toFixed(2);
        } else {
            document.getElementById("out").innerHTML = "Invalid date range.";
        }
    } else {
        document.getElementById("out").innerHTML = "Please select dates and ensure price is available.";
    }
    }
</script>

</head>
<body>

  <!-- Top Navigation Bar (with logo and Login/Register) -->
   <nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="../photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>
        
         <div class="top-right">
            <!-- Other Links (Optional) -->
            <h3><%=username %></h3>
        </div> 
        
    </nav>
    
   

    <!-- Main Navigation Bar (with Home, Vehicles & Rates, etc.) -->
    <nav class="navbar">
        <!-- Navigation Links on the right -->
        <ul class="nav-links">
            <li><a href="../UserHomePage.jsp">Home</a></li>
            <li><a href="../availbleVehicleServlet">Vehicles & Rates</a></li>
            <li><a href="../DispalyReservationServlet?name=<%= java.net.URLEncoder.encode(name, "UTF-8") %>">Your Rentals</a></li>
            <li><a href="../ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="../Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="../UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
	      
   
    <!--  form -->
    <div class = "rent">
    
	<form action="reserve" method = "post" onsubmit="return validatePhone()">
	<fieldset name ="form">
	<legend> Fill Your preferences </legend>
	<br>
		
		Vehicle
		<input type="text" id="vehicleIdInput" name="vehicleId" readonly>
		Price Per Day
		<input type="text" id="priceInput" name="price" readonly>
		Name 
		<input type="text" name="name" value="<%=name%>" readonly><br>
		Phone Number 
		<input type="text" id="phone" name="phone" oninput="validatePhone()"><br>
		<span id="phoneError" style="color: red;"></span><br>
		Pickup Date
		<input type="date" id="pdate" name="pdate" onchange="calDays()"><br>
		Return Date
		<input type="date" id="rdate" name="rdate" onchange="calDays()"><br><br>
		<input type="hidden" id="TotalPrice" name="total" >
		<p id="out" ></p>
		
		<input type="submit" name="submit" value="RESERVE">
	</fieldset>	
	</form>
	</div>
	 </div>
	 <!-- Footer Section -->
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
