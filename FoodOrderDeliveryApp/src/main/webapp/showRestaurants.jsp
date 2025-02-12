<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.app.RestaurantDao.Restaurant" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Order Application - Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f4f4f4; /* Light background */
            font-family: 'Open Sans', sans-serif; /* Using Open Sans for cleaner text */
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #2c3e50; /* Darker text color for headings */
            margin-bottom: 40px;
            font-weight: bold;
            font-size: 36px;
        }
        .card {
            margin: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Softer shadow */
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px); /* Card hover effect */
        }
        .card-body h5 {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }
        .card-body p {
            color: #555;
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
        header {
            background-color: #ffc107; /* Yellow for the header */
            color: white;
            padding: 20px 0;
            text-align: center;
            font-size: 30px;
            letter-spacing: 1px;
            font-weight: bold;
        }
        nav {
            background-color: #fff; /* Light background for navigation */
            padding: 10px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        nav ul {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            justify-content: center;
        }
        nav ul li {
            margin: 0 15px;
        }
        nav ul li a {
            color: #2c3e50; /* Dark text color for links */
            text-decoration: none;
            font-size: 18px;
            padding: 8px 15px;
            border-radius: 20px;
            transition: background-color 0.3s ease;
        }
        nav ul li a:hover {
            background-color: #ffc107; /* Yellow hover */
            color: #fff;
        }
        footer {
            background-color: #2c3e50; /* Dark gray for footer */
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 14px;
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
    </style>
</head>

<body>
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

    <h1>Restaurant Listings</h1>

    <div class="container">
        <div class="row">
            <% 
                // Assuming 'restaurantList' is passed from the session
                List<Restaurant> restaurantList = (List<Restaurant>) session.getAttribute("Restaurant");
                if (restaurantList != null) {
                    for (Restaurant restaurant : restaurantList) {
            %>
            <!-- Restaurant Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= restaurant.getRestaurantName() %></h5>
                        <p class="card-text">Cuisine Type: <%= restaurant.getCuisineType() %></p>
                        <p class="card-text">Rating: <%= restaurant.getRating() %> /5 </p>
                        <p class="card-text">Active: <%= restaurant.isActive() ? "Yes" : "No" %></p>
                        <p class="card-text">Delivery Time: <%= restaurant.getDeliveryTime() %> min</p>
                    </div>
                </div>
            </div>
            <% 
                    }
                } else {
            %>
            <div style="text-align: center;">No restaurants found</div>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 QuickBite Food Order. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
