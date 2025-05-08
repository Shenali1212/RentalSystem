<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="regVehicle.Regvehicle" %>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/updateRentyourVehicle.css">
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
            <li><a href="OwnerHomePage.jsp">Home</a></li>
            <li><a href="displayVehicleDetails.jsp">Your Vehicles</a></li>
            <li><a href="rentyourvehicle.jsp">Rent Your Vehicle</a></li>
            <li><a href="ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="../Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
    
    <!-- Main Content -->
    <div class="main-container">
        <h1>RENT YOUR VEHICLE</h1>
        <h3>Fill in the details of your vehicle to list it for rental</h3>

        <!-- Vehicle Information Section -->
        
        <%
        
        String vehId = request.getParameter("vehId");
        String Vusername = request.getParameter("username");
		String makeModel = request.getParameter("makeModel");
		String year = request.getParameter("year");
		String vin = request.getParameter("vin");
		String license = request.getParameter("license");
		String mileage = request.getParameter("mileage");
		String transmission = request.getParameter("transmission");
		String fuel = request.getParameter("fuel");
		String color = request.getParameter("color");
		String condition = request.getParameter("condition");
		String vehiclePhoto = request.getParameter("vehiclePhoto");
		String vehicleReg = request.getParameter("vehicleReg");
		String insurance = request.getParameter("insurance");
		String ownership = request.getParameter("ownership");
		String usage = request.getParameter("usage");
		String rentalPricing= request.getParameter("rentalPricing");
		String respon = request.getParameter("respon");
		System.out.println(vehId);
		System.out.println(makeModel);
		%>
		
        <div class="form-container">
            <h2>Vehicle Information</h2>
            <form action="updateV" method="post" enctype="multipart/form-data">
                
                
                    <input type="hidden" name="username" id="username" value="<%=Vusername %>" >
                    
                <div class="form-row">
                    
                    <div class="form-group">
                        <label for="vehicleid">Vehicle ID *</label>
                        <input type="text" name="vehId" id="vehId" value="<%=vehId %>" readonly>
                    </div>
                    
                      
                    <div class="form-group">
                        <label for="makeModel">Make and Model *</label>
                        <input type="text" name="makeModel" id="makeModel" required value="<%=makeModel %>">
                    </div>

                  
                </div>

                <div class="form-row">
                
                    <div class="form-group">
                        <label for="yearManufacture">Year of Manufacture *</label>
                        <input type="text" name="year" id="yearManufacture" required value="<%=year %>">
                    </div>

                    <div class="form-group">
                        <label for="licensePlate">License Plate Number *</label>
                        <input type="text" name="license" id="licensePlate" required value="<%=license %>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="mileage">Mileage *</label>
                        <input type="text" name="mileage" id="mileage" required value="<%=mileage %>">
                    </div>

                    <div class="form-group">
                        <label for="transmission">Transmission Type *</label>
                        <select name="transmission" id="transmission" required>
                            <option value="manual" <%= "manual".equals(transmission) ? "selected" : "" %>>Manual</option>
        					<option value="automatic" <%= "automatic".equals(transmission) ? "selected" : "" %>>Automatic</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="fuelType">Fuel Type *</label>
                        <select name="fuel" id="fuelType" required>
                            <option value="petrol" <%= "petrol".equals(fuel) ? "selected" : "" %>>Petrol</option>
            				<option value="diesel" <%= "diesel".equals(fuel) ? "selected" : "" %>>Diesel</option>
            				<option value="electric" <%= "electric".equals(fuel) ? "selected" : "" %>>Electric</option>
            				<option value="hybrid" <%= "hybrid".equals(fuel) ? "selected" : "" %>>Hybrid</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="color">Color *</label>
                        <input type="text" name="color" id="color" required value="<%=color %>">
                    </div>
                </div>

                <div class="form-row">
                     <div class="form-group">
                        <label for="condition">Vehicle Condition *</label>
                        <textarea name="condition" id="condition" rows="3" required><%=condition %></textarea>
                    </div>
                      <div class="form-group">
                      <div class="file-input-container">	
    						<label for="vehiclePhoto">Vehicle Photo *</label>
    
    					<!-- Display the current image -->
    					<div class="current-image">
        					<p>Current Photo:</p>
       						<img src="../RegVehicles/VehiclePhotos/<%= vehiclePhoto %>" alt="Current Vehicle Photo" width="200" height="150">
    					</div>
    
    					<!-- File input for uploading a new image -->
    					<input type="file" name="vehiclePhoto" id="vehiclePhoto">
    
    					<p>If you want to update the photo, please select a new one.</p><br>
    					
    					<label for="retainvehiclePhoto">If you want to save current Image, tick here</label>
    					<input type="checkbox" id="retainvehiclePhoto" id="name" name="retainvehiclePhoto" value="retainvehiclePhoto">
					</div>
					</div>
                </div>
<hr><br>
                <!-- Ownership and Legal Documents Section -->
                <h2>Ownership and Legal Documents</h2>

                <div class="form-row">
                    <div class="form-group">
                    <div class="file-input-container">
    					<label for="vehicleRegistration">Vehicle Registration Certificate *</label>
    
    					<!-- Display the current Vehicle Registration Certificate -->
    					<div class="current-image">
       			 			<p>Current Registration Certificate:</p>
        					<img src="../RegVehicles/VehicleRegistrationPhoto/<%= vehicleReg %>" alt="Current Vehicle Registration" width="200" height="150">
    					</div>
    
    					<!-- File input for uploading a new certificate -->
    					<input type="file" name="vehicleReg" id="vehicleReg">
    
    					<p>If you want to update the certificate, please select a new file.</p><br>
    					<label for="retainvehicleReg">If you want to save current Image, tick here</label>
    					<input type="checkbox" id="retainvehicleReg" name="retainvehicleReg" value="retainvehicleReg">
					</div>
				</div>
                    <div class="form-group">
                        <label for="insuranceDetails">Insurance Details *</label>
                        <input type="text" name="insurance" id="insurance" required value="<%=insurance %>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                    <div class="file-input-container">
        				<label for="proofOwnership">Proof of Ownership *</label>
        
        				<!-- Display the current Proof of Ownership -->
        				<div class="current-image">
            				<p>Current Proof of Ownership:</p>
            				<img src="../RegVehicles/Ownership/<%= ownership %>" alt="Current Proof of Ownership" width="200" height="150">
        				</div>
        
        				<!-- File input for uploading a new proof of ownership -->
       				 	<input type="file" name="ownership" id="ownership">
        
        				<p>If you want to update the proof of ownership, please select a new file.</p><br>
        				
        				
    					<label for="retainownership">If you want to save current Image, tick here</label>
    					<input type="checkbox" id="retainownership" name="retainownership" value="retainownership">
    				</div>
    				</div>
                </div>
<hr><br>
                <!-- Rental Terms and Conditions Section -->
                <h2>Rental Terms and Conditions</h2>

                <div class="form-row">
                    <div class="form-group">
                        <label for="usage">Allowed Usage *</label>
                        <textarea name="usage" id="usage" rows="3" required><%=usage %></textarea>
                    </div>

                    <div class="form-group">
                        <label for="rentalPricing">Rental Pricing *</label>
                        <input type="text" name="rentalPricing" id="rentalPricing" required value="<%=rentalPricing %>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="damageResponsibility">Damage and Maintenance Responsibility *</label>
                        <textarea name="respon" id="respon" rows="3" required><%=respon %></textarea>
                    </div>
                </div>

                <div class="form-row">
                    <button type="submit" class="submit-btn">Update Vehicle</button>
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