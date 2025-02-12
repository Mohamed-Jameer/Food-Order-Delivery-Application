<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.app.order.Order" %>
<%@ page import="com.app.UserDao.User" %>
<%@ page import="com.app.MenuDAO.Menu" %>
<%@ page import="com.app.MenuDAO.MenuDAOImpl" %>
<%@ page import="com.app.RestaurantDao.Restaurant" %>
<%@ page import="com.app.RestaurantDao.RestaurantDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.app.order.OrderDAOImpl" %>
<%@ page import="com.app.order.Order" %>
<%@ page import="com.app.orderHistory.OrderHistoryDAOImpl" %>
<%@ page import="com.app.orderHistory.OrderHistory" %>
<%@ page import="com.app.UserDao.UserDAOImpl" %>
<%@ page import="com.app.UserDao.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Your custom CSS file -->
<link href="styles.css" rel="stylesheet">
    
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
        
 body.blur > *:not(#messageBox) {
            filter: blur(5px);
            pointer-events: none; /* Disable interactions with the blurred content */
        }
  }
.btn-view {
    background-color: #ffc107; /* Consistent Yellow Theme */
    color: white;
    border: none;
    border-radius: 30px;
    padding: 10px 20px;
    font-size: 1rem;
    margin-bottom: 10px; /* Add spacing below each button */
    transition: background-color 0.3s ease;
}

.btn-view:hover {
    background-color: #e0a800; /* Darker Yellow on Hover */
}

.btn-view + .btn-view {
    margin-left: 10px; /* Add spacing between "View Details" and "Reorder" buttons */
}

button[type="submit"] {
    display: inline-block;
    width: 100%; /* Optional: Align width with other buttons */
    margin-top: 5px; /* Add spacing above Reorder button */
}
        .container {
            margin-top: 30px;
            max-width: 1200px; /* Center container and limit width */
        }
        .card {
            margin-bottom: 20px;
        }
        .modal-header, .modal-footer {
            background-color: #f1f1f1;
        }
        .modal-body {
            overflow-y: auto;
        }
        .btn {
            font-size: 14px;
        }
        .order-group-title {
            font-size: 18px;
            font-weight: bold;
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
        .table th, .table td {
    text-align: center; /* Center text in table cells */
    padding: 15px; /* Increase padding for better readability */
}

.modal-dialog {
    max-width: 90%; /* Increase modal width */
}

.modal-body {
    max-height: 400px; /* Add a max height to modal content */
    overflow-y: auto; /* Add scrolling if content overflows */
}

/* Custom header color for the order title */
.text-custom {
    color: #4CAF50; /* You can change this to your desired color */
    font-weight: bold;
}

/* Styling the card body */
.card-body {
    background-color: #f8f9fa;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Styling the order details section */
.order-details {
    margin-top: 15px;
}

.order-details div {
    font-size: 14px;
    margin-bottom: 10px;
    font-family: 'Arial', sans-serif;
}


/* Modal styling */
.modal-content {
    border-radius: 15px;
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
  
    <div class="container">
        <h1 class="text-center mb-4">Order History</h1>

        <% 
            // Fetch the order list from the session
           
        
        List<Order> orders =  new ArrayList<>();
	       OrderDAOImpl oDAOImpl = new OrderDAOImpl();
	      
	        
	       OrderHistoryDAOImpl oHD = new OrderHistoryDAOImpl();
	    
	         List<OrderHistory> orderHistoryList = oHD.fetchAll();
	         
	         for(OrderHistory oh : orderHistoryList ) {
	        	
	        	 orders.addAll(oDAOImpl.getOrders(oh.getUserId()));
	        
	         }
        
        
            MenuDAOImpl menuDAO = new MenuDAOImpl();
            RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
            
            // Group orders by orderSame value
            Map<Integer, List<Order>> groupedOrders = new TreeMap<>();  // Changed to Integer
            for (Order order : orders) {
                int orderSame = order.getOrderSame();  // Assuming orderSame is an int in Order class
                groupedOrders.computeIfAbsent(orderSame, k -> new ArrayList<>()).add(order);
            }
        %>

        <!-- Order Cards Section -->
        <% if (groupedOrders != null && !groupedOrders.isEmpty()) { %>
            <div class="row">
                <% 
                    // Iterate over each orderSame group
                    for (Map.Entry<Integer, List<Order>> entry : groupedOrders.entrySet()) {
                        int orderSame = entry.getKey();
                        
                        List<Order> groupedOrder = entry.getValue();
                       
                        Order firstOrder = groupedOrder.get(0); // Get the first order to display the restaurant details
                        Restaurant restaurant = restaurantDAO.fetchSpecificId(firstOrder.getRestaurantId());
                        Menu menu = menuDAO.fetchSpecificId(firstOrder.getMenuId());
                        
                        // Calculate total quantity and total amount for this group of orders
                        int totalQuantity = 0;
                        float totalAmount = 0;
                        for (Order order : groupedOrder) {
                            totalQuantity += order.getQuantity();
                            totalAmount += order.getTotalAmount();
                        }
                        
                        UserDAOImpl userDAOImpl = new UserDAOImpl();
                        String userName = userDAOImpl.getUserById(firstOrder.getUserId()).getUserName();
                         
                        
                        OrderHistoryDAOImpl findIdSameOrder = new OrderHistoryDAOImpl();
                        int orderGroupId = findIdSameOrder.fetchOrderHisOrderId(firstOrder.getOrderSame()).getOrderHistoryId();
                        
                        
                %>
<div class="col-md-4">
    <div class="card shadow-sm">
        <div class="card-body">
            <h5 class="order-group-title text-custom">Order Group: <%= orderGroupId %></h5>
            <div class="order-details">
            <div><strong>User Name:</strong> <%= userName%></div>
                <div><strong>Total Quantity:</strong> <%= totalQuantity %></div>
                <div><strong>Total Amount:</strong> ₹<%= totalAmount %></div>
                <div><strong>Status:</strong> <%= firstOrder.getStatus() %></div>
                <div><strong>Address:</strong> <%= firstOrder.getAddress() %></div>
                <div><strong>Payment:</strong> <%= firstOrder.getPayment() %></div>
            </div>
       <button type="button" class="btn-view btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#orderModal<%= orderSame %>">
    View Details
</button>

<a href="DeleteOrderServelt?oid=<%= orderGroupId %>" class="btn-view">Delete</a>


        </div>
    </div>
</div>


                <!-- Modal for Order Details -->
<div class="modal fade" id="orderModal<%= orderSame %>" tabindex="-1" aria-labelledby="orderModalLabel<%= orderSame %>" aria-hidden="true">
    <div class="modal-dialog modal-lg"> <!-- Updated to modal-lg for larger size -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderModalLabel<%= orderSame %>">Order Group Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Display a table of all orders in this group -->
                <table class="table table-striped table-hover table-sm"> <!-- Added table-sm for smaller text -->
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Restaurant Name</th>
                            <th>Menu Item</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Payment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Order order : groupedOrder) { 
                            Menu menuDetail = menuDAO.fetchSpecificId(order.getMenuId());
                            Restaurant restaurantDetail = restaurantDAO.fetchSpecificId(order.getRestaurantId());  // Fetch restaurant details
                        %>
                        <tr>
                            <td><%= order.getOrderId() %></td>
                            <td><%= restaurantDetail.getRestaurantName() %></td> <!-- Display the restaurant name -->
                            <td><%= menuDetail.getMenuName() %></td>
                            <td><%= order.getQuantity() %></td>
                            <td>₹<%= menuDetail.getPrice() %></td>
                            <td>₹<%= order.getTotalAmount() %></td>
                            <td><%= order.getStatus() %></td>
                            <td><%= order.getPayment() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

                <% 
                    } // End of orderSame group
                } // End of grouped orders
                %>
            </div>
       

       
    </div>
<footer>
        <p>&copy; 2024 QuickBite Food Order. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>
    
  <script>
    // Toggle Profile Box visibility
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
    
    
    document.querySelectorAll('tr').forEach(function(row) {
        row.addEventListener('mouseenter', function() {
            row.style.transition = "background-color 0.3s ease";
            row.style.backgroundColor = "#f1c40f"; // Highlight on hover
        });
        row.addEventListener('mouseleave', function() {
            row.style.backgroundColor = "";
        });
    });
</script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html> 