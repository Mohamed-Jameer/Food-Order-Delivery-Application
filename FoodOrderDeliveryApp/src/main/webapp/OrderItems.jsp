<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.app.CartItems.CartItem"%>
<%@ page import="com.app.UserDao.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"  >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Summary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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

        header {
            background-color: #ffc107; /* Soft yellow */
            color: #333;
            padding: 10px 15px;
            text-align: center;
            font-size: 24px;
        }

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

        .profile-box-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .profile-box-buttons button {
            width: 48%;
        }

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

       .table thead th {
    background-color: #ffc107;
    color: #fff;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
}

.table tbody td {
    text-align: center;
    vertical-align: middle;
    font-size: 16px;
}

.table tbody tr:hover {
    background-color: #ffe8a1; /* Slight hover effect */
}

.table {
    margin-top: 30px;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}


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

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .text-right {
            text-align: right;
        }

        .btn-payment {
            margin: 10px 0;
        }

        .payment-methods img {
            width: 50px;
            margin-right: 10px;
        }

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
            z-index: 9999;
            animation: fadeIn 1s ease-in-out;
        }

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
    </style>
</head>
<body>

      <!-- Back Button -->
        <button class="back-btn" onclick="window.history.back()">
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
  
   
    <!-- Order Summary Section -->
    <div class="container mt-5">
        <!-- Updated Order Summary Section with Form -->
<form   action="OrderItemPlaced"  method="POST" >    <h1 class="text-center">Order Summary</h1>

    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th scope="col">Menu Name</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price (per item)</th>
                <th scope="col">Total Price</th>
            </tr>
        </thead>
        <tbody>
            <% 
            float grandTotal = 0;

            Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

            for (CartItem item : cart.values()) {
                  float totalPrice = item.getPrice() * item.getQuantity();
                  grandTotal += totalPrice;
            %>
            <tr>
                <td><%= item.getMenuName() %></td>
                <td><%= item.getQuantity() %></td>
                <td>₹<%= item.getPrice() %></td>
                <td>₹<%= totalPrice %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <div class="text-right">
        <h4><strong>Grand Total: ₹<%= grandTotal %></strong></h4>
    </div>

    <div class="mt-5">
        <h3>Select Payment Method</h3>
        <div>
            <input type="radio" id="cod" name="paymentMethod" value="COD" required>
            <label for="cod">Cash on Delivery</label>
        </div>
        <div>
            <input type="radio" id="googlepay" name="paymentMethod" value="GooglePay">
            <label for="googlepay">Google Pay</label>
        </div>
        <div>
            <input type="radio" id="phonepe" name="paymentMethod" value="PhonePe">
            <label for="phonepe">PhonePe</label>
        </div>
    </div>

    <div class="mt-5">
        <h3>Delivery Address</h3>
        <textarea name="DeliveryAddress" class="form-control" rows="3" placeholder="Enter your delivery address" required><%= user.getAddress() %></textarea>
    </div>

    <button type="submit" onclick="ConfirmMessage(event)" class="btn btn-success mt-4">Confirm Order</button>
</form>

    </div>

    <!-- Footer -->
    <footer>
        <p>© 2024 QuickBite. All Rights Reserved.</p>
    </footer>

    <!-- Modal for Address Update -->
    <div id="ConfirmMessage" class="message-box">
        <p>Your order has been confirmed!</p>
    </div>

    <script>
        function toggleProfileBox() {
            var profileBox = document.getElementById('profile-box');
            profileBox.style.display = profileBox.style.display === 'block' ? 'none' : 'block';
        }

        function navigateToPage() {
            window.location.href = "logout.jsp";
        }

        function navigateToEditPage(){
          	 window.location.href = 'UserEdit.jsp';
          }

        function navigateToPage() {
            
            // Show the message box with a fade-in effect
            document.getElementById("logoutMessage").style.display = "block";

            // Redirect to another page after a short delay
            setTimeout(function() {
                window.location.href = 'welcome.html';  // Replace with your target page
            }, 2000);  // 2 seconds delay before redirection
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
        
        function ConfirmMessage(event) {
            // Prevent the form from submitting immediately
            event.preventDefault();

            // Show the message box with a fade-in effect
            document.getElementById("ConfirmMessage").style.display = "block";

            // Wait for a few seconds before submitting the form
            setTimeout(function() {
                document.forms[0].submit();  // Submit the form
            }, 2000);  // 2 seconds delay before form submission
        }



    </script>
</body>
</html>