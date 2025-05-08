<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String role = (String) session.getAttribute("role");
    	System.out.println(role);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/rentyourvehicle.css">
</head>
<body>
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
            <li><a href="../OwnerHomePage.jsp">Home</a></li>
            <li><a href="displayVehicleDetails.jsp">Your Vehicles</a></li>
            <li><a href="rentyourvehicle.jsp">Rent Your Vehicle</a></li>
            <li><a href="../ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="../Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="../UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
    
    <!-- Main Content -->
    <div class="main-container">
        <h1>RENT YOUR VEHICLE</h1>
        <h3>Fill in the details of your vehicle to list it for rental</h3>

        <!-- Vehicle Information Section -->
        <div class="form-container">
            <h2>Vehicle Information</h2>
            <form action="addVehicle" method="post" enctype="multipart/form-data">
                
                <input type="hidden" name="username" id="username" value=<%=username%>>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="makeModel">Make and Model *</label>
                        <input type="text" name="makeModel" id="makeModel" required placeholder="e.g., Toyota Corolla">
                    </div>

                    <div class="form-group">
                        <label for="yearManufacture">Year of Manufacture *</label>
                        <input type="text" name="year" id="yearManufacture" required placeholder="e.g., 2019">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="licensePlate">License Plate Number *</label>
                        <input type="text" name="license" id="licensePlate" required placeholder="License Plate">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="mileage">Mileage *</label>
                        <input type="text" name="mileage" id="mileage" required placeholder="Current Mileage">
                    </div>

                    <div class="form-group">
                        <label for="transmission">Transmission Type *</label>
                        <select name="transmission" id="transmission" required>
                            <option value="manual">Manual</option>
                            <option value="automatic">Automatic</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="fuelType">Fuel Type *</label>
                        <select name="fuel" id="fuelType" required>
                            <option value="petrol">Petrol</option>
                            <option value="diesel">Diesel</option>
                            <option value="electric">Electric</option>
                            <option value="hybrid">Hybrid</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="color">Color *</label>
                        <input type="text" name="color" id="color" required placeholder="Vehicle Color">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="condition">Vehicle Condition *</label>
                        <textarea name="condition" id="condition" rows="3" placeholder="Describe the physical and mechanical state of the vehicle" required></textarea>
                    </div>

                      <div class="form-group">
                        <label for="vehiclePhoto">Vehicle Photo *</label>
                        <input type="file" name="vehiclePhoto" id="vehiclePhoto" required>
                    </div>
                </div>

                <!-- Ownership and Legal Documents Section -->
                <h2>Ownership and Legal Documents</h2>

                <div class="form-row">
                    <div class="form-group">
                        <label for="vehicleRegistration">Vehicle Registration Certificate *</label>
                        <input type="file" name="vehicleReg" id="vehicleReg" required>
                    </div>

                    <div class="form-group">
                        <label for="insuranceDetails">Insurance Details *</label>
                        <input type="text" name="insurance" id="insurance" required placeholder="Insurer's Name, Policy Number">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="proofOwnership">Proof of Ownership *</label>
                        <input type="file" name="ownership" id="ownership" required>
                    </div>
                </div>

                <!-- Rental Terms and Conditions Section -->
                <h2>Rental Terms and Conditions</h2>

                <div class="form-row">
                    <div class="form-group">
                        <label for="usage">Allowed Usage *</label>
                        <textarea name="usage" id="usage" rows="3" placeholder="Describe allowed uses, restrictions, etc." required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="rentalPricing">Rental Pricing *</label>
                        <input type="text" name="rentalPricing" id="rentalPricing" required placeholder="Rate per day, week, month">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="damageResponsibility">Damage and Maintenance Responsibility *</label>
                        <textarea name="respon" id="respon" rows="3" placeholder="Describe who is responsible for damage or maintenance" required></textarea>
                    </div>
                </div>

                <div class="form-row">
                    <button type="submit" class="submit-btn">Submit Vehicle for Rental</button>
                </div>
            </form>
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