<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.app.RestaurantDao.Restaurant" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.app.UserDao.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Restaurant</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
        
          .btn-view {
            background-color: #ffc107; /* Yellow for consistency with theme */
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        .btn-view:hover {
            background-color: #e0a800; /* Darker yellow on hover */
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
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-primary {
            background-color: #ffc107;
            border-color: #ffc107;
        }
        .btn-primary:hover {
            background-color: #e0a800;
            border-color: #e0a800;
        }
    </style>
</head>
<body>


      <!-- Back Button -->
        <button class="back-btn" onclick="history.back()">
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



<br>
    <div class="container">
        <h2>Edit Restaurant</h2>
        
        <form action="UpdateRestaurant" method="POST">
            <% 
            // Retrieve the Restaurant object from the session
            Restaurant restaurant = (Restaurant) session.getAttribute("RestaurantID");
            if (restaurant != null) {
                // Populate restaurant details
                String restaurantName = restaurant.getRestaurantName();
                String cuisineType = restaurant.getCuisineType();
                String address = restaurant.getAddress();
                int rating = restaurant.getRating();
                int deliveryTime = restaurant.getDeliveryTime();
                boolean isActive = restaurant.isActive();
            %>
            
            <div class="form-group">
                <label for="restaurantName">Restaurant Name</label>
                 <input type="number" class="form-control" id="restaurantName" name="restaurantID"value="<%= restaurant.getRestaurantId() %>"  readonly>
            </div>
           
            
            <!-- Restaurant Name -->
            <div class="form-group">
                <label for="restaurantName">Restaurant Name</label>
                <input type="text" class="form-control" id="restaurantName" name="restaurantName" value="<%= restaurantName %>" required>
            </div>

            <!-- Cuisine Type -->
            <div class="form-group">
                <label for="cuisineType">Cuisine Type</label>
                <input type="text" class="form-control" id="cuisineType" name="cuisineType" value="<%= cuisineType %>" required>
            </div>

            <!-- Address -->
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="<%= address %>" required>
            </div>

            <!-- Rating -->
            <div class="form-group">
                <label for="rating">Rating</label>
                <input type="number" class="form-control" id="rating" name="rating" value="<%= rating %>" min="1" max="5" required>
            </div>

            <!-- Delivery Time -->
            <div class="form-group">
                <label for="deliveryTime">Delivery Time (Minutes)</label>
                <input type="number" class="form-control" id="deliveryTime" name="deliveryTime" value="<%= deliveryTime %>" required>
            </div>

            <!-- Active Status -->
            <div class="form-group">
                <label for="isActive">Active</label>
                <select class="form-control" id="isActive" name="isActive">
                    <option value="true" <%= isActive ? "selected" : "" %>>Yes</option>
                    <option value="false" <%= !isActive ? "selected" : "" %>>No</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Update Restaurant</button>
            <% 
            } else {
                out.println("<p>Restaurant not found in session!</p>");
            }
            %>
        </form>
    </div>
    
    <br>
    
      <footer>
        <p>&copy; 2024 QuickBite Food Order. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>
    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js">   function toggleProfileBox() {
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
      	 window.location.href = 'welcome.html';
      }
    function navigateToPage() {
       
        // Show the message box with a fade-in effect
        document.getElementById("logoutMessage").style.display = "block";

        // Redirect to another page after a short delay
        setTimeout(function() {
            window.location.href = 'welcome.html';  // Replace with your target page
        }, 2000);  // 2 seconds delay before redirection
    }</script>
</body>
</html>
