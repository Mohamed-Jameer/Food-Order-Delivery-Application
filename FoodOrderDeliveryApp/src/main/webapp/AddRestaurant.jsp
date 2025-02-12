<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.app.UserDao.User" %>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Add New Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            display: flex;
            flex-direction: column;
            background-color: #f4f4f4;
            font-family: 'Open Sans', sans-serif;
        }
        header, footer {
            flex-shrink: 0;
        }
        main {
            flex-grow: 1;
        }

        /* Header */
        header {
            background-color: #ffc107; /* Soft yellow */
            color: #333;
            padding: 10px 15px;
            text-align: center;
            font-size: 24px;
        }

        /* Profile Button */
        .profile-btn {
            position: absolute;
            top: 15px;
            right: 20px;
            background-color: #ffc107;
            color: white;
            border: none;
            border-radius: 50%;
            padding: 15px;
            width: 60px;
            height: 60px;
            font-size: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .profile-btn:hover {
            background-color: #e0a800;
            transform: scale(1.1);
        }

        /* Profile Box Styling */
        #profile-box {
            display: none;
            position: absolute;
            top: 80px;
            right: 20px;
            background-color: white;
            border: 2px solid #ffc107;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 300px;
            z-index: 9999;
        }

        /* Profile Content */
        #profile-box h5 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 20px;
        }

        #profile-box div {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .profile-detail {
            font-weight: bold;
            color: #555;
        }

        /* Buttons inside Profile */
        .profile-box-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .profile-box-buttons button {
            width: 48%;
        }

        /* Navigation Bar */
        nav ul {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            justify-content: center;
            background-color: #fff;
            padding: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: #333;
            text-decoration: none;
            font-size: 18px;
            padding: 5px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #ffc107;
            color: #fff;
        }

    
        .table {
            margin-top: 30px;
        }
        
        /* Footer */
        footer {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        footer a {
            color: #ffc107;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
        
        .back-btn {
    position: absolute;
    top: 20px;
    left: 20px; /* Changed from right to left */
    background-color: #ffc107;
    color: white;
    border: none;
    border-radius: 50%;
    padding: 10px;
    font-size: 18px;
    transition: background-color 0.3s ease;
}

.back-btn:hover {
    background-color: #e0a800;
}
 .btn-view {
            background-color: #ffc107;
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        .btn-view:hover {
            background-color: #e0a800;
        }
        
 body.blur > *:not(#messageBox) {
            filter: blur(5px);
            pointer-events: none; /* Disable interactions with the blurred content */
        }

        /* Styling for the message box */
        .message-box {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 9999;  /* Ensure the box is on top */
            animation: fadeIn 1s ease-in-out; /* Fade-in animation */
        }

        /* Animation for fade-in effect */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translate(-50%, -45%);
            }
            100% {
                opacity: 1;
                transform: translate(-50%, -50%);
            }
        }
        /* Form Styling */
        
      
       
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ced4da;
        }

        .btn-primary, .btn-secondary {
            width: 48%; /* Equal width for buttons */
            border-radius: 30px;
            padding: 12px;
            font-size: 1.2rem;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #ffc107;
            border: none;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #e0a800;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>

<body>

      <!-- Back Button -->
        <button class="back-btn" onclick="navigateToBackPage()">
            <i class="fas fa-arrow-left"></i>
        </button>
           
        <!-- Profile Button -->
        <button class="profile-btn" onclick="toggleProfileBox()">
            <i class="fas fa-user"></i>
        </button>

        <!-- Profile Box (Hidden by default) -->
            <div id="profile-box" style="display:none;">
    <h5>User Profile</h5>
    <% 
                  User user = (User) session.getAttribute("user");
                    %>
    <div><span class="profile-detail">Name:</span> <%= user.getUserName() %></div>
    <div><span class="profile-detail">Email:</span> <%= user.getEmail() %></div>
    <div><span class="profile-detail">Phone:</span> <%= user.getMobile() %></div>
     <div><span class="profile-detail">Address:</span> <%= user.getAddress() %></div>

    <div class="profile-box-buttons content">
        <button class="btn btn-primary" onclick="navigateToEditPage()">Edit</button>
        <button onclick="navigateToPage()" class="btn btn-danger">Logout</button>
    </div>
</div>
        <div id="logoutMessage" class="message-box">
    <p>You have successfully logged out. We hope to see you again soon!</p>
</div>
     <header>
      <h1>Welcome to QuickBite Food Order</h1>
    </header>
        <!-- Navigation -->
        <nav>
            <ul>
                <li><a href="ShowRestaurant">Home</a></li>
                <li><a href="#">Menu</a></li>
                <li><a href="#">Offers</a></li>
                <li><a href="#">Order Now</a></li>
                <li><a href="#">Contact Us</a></li>
               <li><a href="ViewOrderHistoryServlet">Order History</a></li>
            </ul>
        </nav>

    <!-- Add Restaurant Form --><div class="form-container">
    <h2>Add New Restaurant</h2>
    <form action="AddRestaurantServlet" method="post">
        <div class="form-group row mb-3">
            <label for="restaurantName" class="col-sm-3 col-form-label text-end">Restaurant Name:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="restaurantName" name="restaurantName" placeholder="Enter the restaurant's name" required>
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="cuisineType" class="col-sm-3 col-form-label text-end">Cuisine Type:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="cuisineType" name="cuisineType" placeholder="Enter cuisine type (e.g., Italian, Indian)" required>
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="address" class="col-sm-3 col-form-label text-end">Restaurant Address:</label>
            <div class="col-sm-9">
                <textarea class="form-control" id="address" name="address" rows="4" placeholder="Enter the full address of the restaurant" required></textarea>
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="rating" class="col-sm-3 col-form-label text-end">Restaurant Rating:</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" id="rating" name="rating" placeholder="Enter a rating from 1 to 5" min="1" max="5" required>
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="deliveryTime" class="col-sm-3 col-form-label text-end">Delivery Time (Minutes):</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" id="deliveryTime" name="deliveryTime" placeholder="Enter delivery time in minutes (e.g., 30)" required>
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="isActive" class="col-sm-3 col-form-label text-end">Active Status:</label>
            <div class="col-sm-9">
                <select class="form-select" id="isActive" name="isActive" required>
                    <option value="true" selected>Active</option>
                    <option value="false">Inactive</option>
                </select>
            </div>
        </div>
        <div class="d-flex justify-content-between mt-4">
            <button type="submit" class="btn btn-primary" style="background-color: #ffc107; border-color: #ffc107;">Add Restaurant</button>
            <a href="Home.jsp" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Footer -->
    <footer>
        <p>&copy; 2024 QuickBite Food Order. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

    <!-- Bootstrap and Custom JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Smooth form submission
         document.querySelector('form').addEventListener('submit', (e) => {
            alert('Restaurant added successfully!');
        });
        

         function toggleProfileBox() {
             var profileBox = document.getElementById("profile-box");
             profileBox.style.display = (profileBox.style.display === "none" || profileBox.style.display === "") ? "block" : "none";
         }

         // Close the profile box if clicking outside of it
         window.onclick = function(event) {
             var profileBox = document.getElementById("profile-box");
             var profileButton = document.querySelector(".profile-btn");

             // Check if the click was outside the profile box and not on the profile button
             if (event.target !== profileBox && !profileBox.contains(event.target) && event.target !== profileButton && !profileButton.contains(event.target)) {
                 profileBox.style.display = "none"; // Close the profile box
             }
         };

         // Simulate page load delay to show the loader
         window.onload = function() {
             document.getElementById("loader-wrapper").style.display = "none";
             document.getElementById("main-content").style.display = "block";
         };
         function navigateToEditPage(){
        	 window.location.href = 'UserEdit.jsp';
        }
       
         function navigateToBackPage(){
           	 window.location.href = 'admin.jsp';
           }
         function navigateToPage() {
            
             // Show the message box with a fade-in effect
             document.getElementById("logoutMessage").style.display = "block";

             // Redirect to another page after a short delay
             setTimeout(function() {
                 window.location.href = 'welcome.html';  // Replace with your target page
             }, 2000);  // 2 seconds delay before redirection
         }
     
    </script>

</body>

</html>
