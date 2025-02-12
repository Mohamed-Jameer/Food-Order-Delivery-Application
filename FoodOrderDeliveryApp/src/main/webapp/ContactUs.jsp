<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.app.RestaurantDao.Restaurant" %>
<%@ page import="com.app.UserDao.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - QuickBite</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Your custom styles here */

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
            left: 20px;
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

    <header>
        <h1>Welcome to QuickBite Food Order</h1>
    </header>

    <!-- Navigation -->
    <nav>
         <ul>
                <li><a href="ShowRestaurant">Home</a></li>
                <li><a href="ViewAllMenu">Menu</a></li>
                <li><a href="Offer.jsp">Offers</a></li>
                <li><a href="OrderNow.jsp">Order Now</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="ViewOrderHistoryServlet">Order History</a></li>
            </ul>
    </nav>

    <center><h1>Contact Us</h1></center>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>Get In Touch</h3>
                <form action="submitContactForm" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Your Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Your Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Your Message</label>
                        <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <div class="col-md-6">
                <h3>Our Address</h3>
                <p>QuickBite Food Inc.</p>
                <p>123 Food Street, New York, NY 10001</p>
                <p><i class="fas fa-phone"></i> +1 800-123-4567</p>
                <p><i class="fas fa-envelope"></i> contact@quickbite.com</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>QuickBite &copy; 2024 | All Rights Reserved</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Function to toggle profile box
        function toggleProfileBox() {
            const profileBox = document.getElementById("profile-box");
            profileBox.style.display = (profileBox.style.display === "none") ? "block" : "none";
        }

        // Function to navigate to another page
        function navigateToBackPage() {
            window.history.back();
        }

        function navigateToEditPage() {
            window.location.href = "EditProfile.jsp"; // Example page for editing profile
        }

        function navigateToPage() {
            window.location.href = "Logout.jsp"; // Example logout page
        }
    </script>
</body>
</html>
