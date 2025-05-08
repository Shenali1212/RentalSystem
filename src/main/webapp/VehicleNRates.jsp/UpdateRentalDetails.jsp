<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String name = (String) session.getAttribute("name");
    	
    %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/UpdateTable.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <title>Update Details</title>

    <script>
        function calDays() {
            // Retrieve values
            var PD = document.getElementById("pdate").value;
            var RD = document.getElementById("rdate").value;
            var PDo = document.getElementById("pdateO").value;
            var RDo = document.getElementById("rdateO").value;
            var cPrice = parseFloat(document.getElementById("cPrice").value);

            // Check if all inputs are valid
            if (PDo && RDo && PD && RD && !isNaN(cPrice)) {
                const First = new Date(PD);
                const Second = new Date(RD);
                
                const oFirst = new Date(PDo);
                const oSecond = new Date(RDo);

                // Check if dates are valid
                if (First && Second) {
                    const time = Math.abs(Second - First);
                    const days = Math.ceil(time / (1000 * 60 * 60 * 24));  // Convert milliseconds to days
                    
                    const otime = Math.abs(oSecond - oFirst);
                    const odays = Math.ceil(otime / (1000 * 60 * 60 * 24));  // Convert milliseconds to days (old one)
					
                //    document.getElementById("out").innerHTML = "Updated Total Price: " + cPrice.toFixed(2);
                  //  document.getElementById("TotalPrice").value = cPrice.toFixed(2);

                    if (days > 0) {
                        var Price = cPrice / odays;
                        const total = days * Price;
                       
                        
                        document.getElementById("out").innerHTML = "Updated Total Price: " + total.toFixed(2);
                        document.getElementById("TotalPrice").value = total.toFixed(2);
                    } else {
                        document.getElementById("out").innerHTML = "Invalid date range.";
                    }
                } else {
                    document.getElementById("out").innerHTML = "Invalid date format.";
                }
            } else {
                document.getElementById("out").innerHTML = "Please select valid dates and ensure price is available.";
            }
        }
        
     // Phone number validation
        function validatePhone() {
            var phone = document.getElementById("phone").value;
            var phonePattern = /^[0-9]{10}$/;

            // Check if the phone number matches the pattern
            if (!phone.match(phonePattern)) {
                // Display error message and disable submit button
                document.getElementById("phoneError").innerText = "Please enter a valid 10-digit phone number.";
                document.getElementById("submitBtn").disabled = true;  // Disable submit button
                return false;
            } else {
                // Clear error message and enable submit button
                document.getElementById("phoneError").innerText = "";
                document.getElementById("submitBtn").disabled = false;  // Enable submit button
                return true;
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
                <img src="${pageContext.request.contextPath}/photos/attachment_1079822681.png" alt="Inspire Logo">
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
            <li><a href="Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="../UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
    

    <%
        String id = request.getParameter("id");
        String vID = request.getParameter("vID");
        String pDate = request.getParameter("pDate");
        String rDate = request.getParameter("rDate");
        String phone = request.getParameter("phone");
        String price = request.getParameter("price");

        double priceValue = Double.parseDouble(price);

        // Parse the dates
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date pickupDate = sdf.parse(pDate);
        Date returnDate = sdf.parse(rDate);

        // Calculate the difference in days
        long differenceInMillis = returnDate.getTime() - pickupDate.getTime();
        long differenceInDays = differenceInMillis / (1000 * 60 * 60 * 24); // Convert milliseconds to days

        // Calculate price per day
        double ppd = priceValue / differenceInDays;
    %>

    <h1>Update Rental Records</h1>
    <!-- Modified form with table -->
    <form action="update" method="post">
        <table class="update-table">
            <tr>
                <th>Reservation ID</th>
                <td><input type="text" name="ResID" value="<%= id %>" readonly></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type="text" name="ResNAME" value="<%= name %>" readonly></td>
            </tr>
            <tr>
                <th>Phone number</th>
                <td><input type="text" id="phone" name="ResPhone" value="<%= phone %>" oninput="validatePhone()"><br>
                <span id="phoneError" style="color: red;"></span></td>
            </tr>
            <tr>
                <th>Vehicle Type</th>
                <td><input type="text" name="ResVid" value="<%= vID %>" readonly></td>
            </tr>
            <tr>
                <th>Pickup Date</th>
                <td><input type="hidden" id="pdateO" name="pDATE" value="<%= pDate %>"><input type="date" id="pdate" name="RespDATE" value="<%= pDate %>" onchange="calDays()"></td>
            </tr>
            <tr>
                <th>Return Date</th>
                <td><input type="hidden" id="rdateO" name="rDATE" value="<%= rDate %>"><input type="date" id="rdate" name="ResrDATE" value="<%= rDate %>" onchange="calDays()"></td>
            </tr>
            <tr>
                <th>Total Price</th>
                <td><input type="text" id="cPrice" name="ResFee" value="<%= price %>" readonly> <input type="hidden" id="TotalPrice" name="ResPrice"></td>
               	<tr><td><p id="out"></p></td></tr>
           	</tr>
            <tr>
                <td colspan="2" class="submit-cell">
                    <input type="submit" name="submit" value="Update" id="submitBtn" disabled>
                </td>
            </tr>
        </table>
    </form>

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
