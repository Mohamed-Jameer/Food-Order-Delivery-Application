<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.app.MenuDAO.Menu" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.MenuDAO.MenuDAOImpl" %>
<%@ page import="com.app.UserDao.User" %>
<%@ page import="com.app.RestaurantDao.Restaurant" %>
<%@ page import="com.app.RestaurantDao.RestaurantDAOImpl" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Order Application - View Menu</title>
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
        .btn-cart {
            background-color: #28a745; /* Green for the cart button */
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        .btn-cart:hover {
            background-color: #218838; /* Darker green on hover */
        }
       
        /* Additional Styles */
        .btn-view-cart {
            background-color: #ffc107; /* Yellow like Add to Cart */
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-view-cart:hover {
            background-color: #e0a800; /* Darker yellow on hover */
            transform: scale(1.05); /* Slightly grow on hover */
        }

        .btn-view-cart i {
            margin-left: 10px; /* Space between text and icon */
            font-size: 1.2rem; /* Slightly larger icon */
        }

        .btn-view-cart:active {
            transform: scale(0.98); /* Button shrinks slightly when clicked */
        } .floating-cart-button {
        position: fixed;
        bottom: 30px;
        right: 30px;
        z-index: 1000;
    }
    
    /* Button Style */
    .btn-view-cart {
        background-color: #ffc107; /* Yellow color */
        color: white;
        border: none;
        border-radius: 30px;
        padding: 10px 20px;
        font-size: 1rem;
        display: flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    /* Hover Effect */
    .btn-view-cart:hover {
        background-color: #e0a800; /* Darker yellow on hover */
        transform: scale(1.05); /* Slightly grow on hover */
    }

    /* Active state when clicked */
    .btn-view-cart:active {
        transform: scale(0.98); /* Button shrinks slightly when clicked */
    }

    /* Cart icon styling */
    .btn-view-cart i {
        margin-left: 10px; /* Space between text and icon */
        font-size: 1.2rem; /* Slightly larger icon */
    }

      .floating-cart-button {
        position: fixed;
        bottom: 150px;
        right: 30px;
        z-index: 1000;
        background-color: transparent;
    }
    
    /* Button Style */
    .floating-cart-button a {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 15px 20px;
        background-color: #ffc107; /* Update with your website's primary color */
        border-radius: 50%;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        color: white;
        font-size: 16px;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    /* Hover Effect */
    .floating-cart-button a:hover {
        background-color: #e0a800; /* Darker shade for hover */
        transform: scale(1.05);
    }

    /* Text beside the cart icon */
    .floating-cart-button .cart-text {
        margin-left: 10px;
    }

    /* Cart item count */
    .floating-cart-button .cart-count {
        position: absolute;
        top: -5px;
        right: -5px;
        background-color: #e74c3c; /* Red color for the count badge */
        color: white;
        padding: 5px 10px;
        border-radius: 50%;
        font-size: 12px;
    }
    
.card-img-top {
    height: 200px; /* Adjust height as needed */
    object-fit: cover; /* Ensures the image fills the space without distortion */
    border-top-left-radius: calc(0.25rem - 1px); /* Matches Bootstrap's card border radius */
    border-top-right-radius: calc(0.25rem - 1px);
    padding: 5px; /* Add padding inside the image container */
    border: 3px solid transparent; /* Default transparent border */
    transition: transform 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
}

.card-img-top:hover {
    transform: scale(1.05); /* Slight zoom effect on hover */
    border-color: #ffc107; /* Highlight border on hover */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Subtle shadow effect */
    border-radius: 10px; /* Extra rounding on hover for a modern look */
}
.card-img-top::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: 3px dashed #ffc107; /* Decorative dashed border */
    border-radius: 10px;
    opacity: 0; /* Hidden by default */
    transition: opacity 0.3s ease;
    pointer-events: none;
}

.card-img-top:hover::after {
    opacity: 1; /* Show on hover */
}

    </style>
</head>

<body>

      <!-- Back Button -->
        <button class="back-btn" onclick="history.back()" >
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
                <li><a href="ViewAllMenu">Menu</a></li>
                <li><a href="Offer.jsp">Offers</a></li>
                <li><a href="OrderNow.jsp">Order Now</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="ViewOrderHistoryServlet">Order History</a></li>
            </ul>
        </nav>
  
   <center><h1>Menu for Restaurant</h1></center> 

    <div class="container">
        <div class="row">
            <% 
            
            List<Menu> menuList = new MenuDAOImpl().fetchAll();
                if (menuList != null && !menuList.isEmpty()) {
                    for (Menu menu : menuList) {
                    	
                    	RestaurantDAOImpl r = new RestaurantDAOImpl();
                    	Restaurant restaurant = r.fetchSpecificId(menu.getRestaurantId());
            %>
            <!-- Menu Item Card -->
           <div class="col-md-4">
    <div class="card">
            <img src="<%= menu.getImageUrl() %>"  class="card-img-top img-fluid rounded shadow"  alt="<%= menu.getMenuName() %>">
    
        <div class="card-body">
            <h5 class="card-title"><%= menu.getMenuName() %></h5>
             <p class="card-text">Restaurant Name: <%= restaurant.getRestaurantName() %></p>
            <p class="card-text">Description: <%= menu.getDescription() %></p>
            <p class="card-text">Price: ₹<%= menu.getPrice() %></p>
            <p class="card-text">Rating: <%= menu.getRating() %> /5</p>
          
            <% if(menu.isAvailable()) { %>
            <form method="post" action="AddToCartServlet">
                <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
                <input type="hidden" name="menuName" value="<%= menu.getMenuName() %>">
                <input type="hidden" name="price" value="<%= menu.getPrice() %>">
               
            </form>
            <% } else { %>
            <button class="btn btn-secondary" disabled>Out of Stock</button>
            <% } %>
        </div>
    </div>
</div>

            <% 
                    }
                } else {
            %>
            <div style="text-align: center;">No menu items found for this restaurant</div>
            <% } %>
        </div>
    </div>

    
    <br><br>

   
    <!-- Footer -->
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
  

    function navigateToPage() {
       
        // Show the message box with a fade-in effect
        document.getElementById("logoutMessage").style.display = "block";

        // Redirect to another page after a short delay
        setTimeout(function() {
            window.location.href = 'welcome.html';  // Replace with your target page
        }, 2000);  // 2 seconds delay before redirection
    }
    
    function navigateToBackPage() {
        window.history.back();
    }
    
    document.addEventListener('DOMContentLoaded', () => {
        const images = document.querySelectorAll('.card-img-top');

        images.forEach((image) => {
            image.addEventListener('mouseover', () => {
                image.style.filter = 'brightness(1.1)'; // Brighten the image slightly
            });

            image.addEventListener('mouseout', () => {
                image.style.filter = 'brightness(1)'; // Reset brightness
            });
        });
    });
</script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
