<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.app.RestaurantDao.Restaurant" %>
<%@ page import="com.app.UserDao.User" %>
<%@ page import="com.app.RestaurantDao.RestaurantDAOImpl" %>
<%@ page import="com.app.RestaurantDao.Restaurant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.MenuDAO.MenuDAOImpl" %>
<%@ page import="com.app.MenuDAO.Menu" %>
<%@ page import="com.app.orderHistory.OrderHistoryDAOImpl" %>
<%@ page import="com.app.orderHistory.OrderHistory" %>
<%@ page import=" com.app.UserDao.UserDAOImpl" %>
<%@ page import=" com.app.UserDao.User" %>
<!DOCTYPE html>

<html lang="en" >
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
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
  a {
      text-decoration: none;
    }
    
    
     
      #map-container {
        display: none; /* Initially hide the map container */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
        z-index: 1000;
      }

      #map {
        height: 80%;
        width: 80%;
        margin: auto;
        position: absolute;
        top: 10%;
        left: 10%;
        background: white;
        border-radius: 8px;
        overflow: hidden;
      }

      #closeButton {
        position: absolute;
        top: 10%;
        right: 10%;
        background-color: red;
        color: white;
        border: none;
        padding: 10px 15px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        z-index: 1100;
      }

      #closeButton:hover {
        background-color: darkred;
      }

      #showLocationBtn {
        background-color: #ffc107; /* Green */
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border: none;
        cursor: pointer;
        width: 100px;
        heigth:100px;
          border: 2px solid ;
  border-radius: 12px;
  padding: 5px;
  
    position: absolute;
    top: 140px; /* Adjust the top distance as needed */
    right: 20px;
      }

      #showLocationBtn:hover {
        background-color: #45a049;
      }
      
 
      body {
        font-family: "Poppins", sans-serif;
        background-color: #f0f4f8;
      }
      #adminHeader {
        background-color: #343a40;
        color: white;
        padding: 15px;
        text-align: center;
        font-size: 32px;
      }

      .card {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: 0.3s;
      }
      .card:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
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
                <li><a href="ViewAllMenu">Menu</a></li>
                <li><a href="Offer.jsp">Offers</a></li>
                <li><a href="OrderNow.jsp">Order Now</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="ViewOrderHistoryServlet">Order History</a></li>
            </ul>
        </nav>
  
   <br>
  
  
  
  
    <!-- Admin Header -->
    <header id = "adminHeader">
      <h1>Admin Dashboard</h1>
    </header>
    
    
    <% 
    RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
     List<Restaurant> resturantTotal =  restaurantDAOImpl.fetchAll();
     
     MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
     List<Menu> menuTotal  = menuDAOImpl.fetchAll();
     
     OrderHistoryDAOImpl orderHistoryDAOImpl = new OrderHistoryDAOImpl();
     List<OrderHistory> orderTotal = orderHistoryDAOImpl.fetchAll();
     
     
     UserDAOImpl userDAOImpl1 = new UserDAOImpl();
     List<User> userTotal = userDAOImpl1.getAllUsers();
    %>
 

    <!-- Admin Content -->
    <div class="container mt-5">
      <div class="row">
        <!-- Dashboard Cards -->
        <div class="col-md-3">
          <div class="card text-center bg-primary text-white mb-4">
            <div class="card-body">
              <h3>Total Restaurants</h3>
              <h2><%= resturantTotal.size() %></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-center bg-success text-white mb-4">
            <div class="card-body">
              <h3>Total Menus</h3>
              <h2><%= menuTotal.size() %></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-center bg-warning text-white mb-4">
            <div class="card-body">
              <h3>Total Orders</h3>
              <h2><%= orderTotal.size() %></h2>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-center bg-danger text-white mb-4">
            <div class="card-body">
              <h3>Total Users</h3>
              <h2><%= userTotal.size() %></h2>
            </div>
          </div>
        </div>
      </div>

      <!-- Feature Management Sections -->
      <div class="row">
        <!-- Manage Restaurants Section -->
        <div class="col-md-6">
          <div class="card mb-4">
            <div class="card-header bg-dark text-white">Manage Restaurants</div>
            <div class="card-body">
              <a href="AddRestaurant.jsp" class="btn btn-success mb-2"
                >Add Restaurant</a
              >
              <a href="ShowRestaurantServlet" class="btn btn-primary mb-2"
                >View Restaurants</a
              >
              <a href="EditRestaurantServlet" class="btn btn-warning mb-2"
                >Edit Restaurant</a
              >
              <a href="DeleteRestaurantServlet" class="btn btn-danger mb-2"
                >Delete Restaurant</a
              >
            </div>
          </div>
        </div>

        <!-- Manage Menus Section -->
        <div class="col-md-6">
          <div class="card mb-4">
            <div class="card-header bg-dark text-white">Manage Menus</div>
            <div class="card-body">
              <a href="AddMenu.jsp" class="btn btn-success mb-2">Add Menu</a>
              <a href="ViewAllMenu.jsp" class="btn btn-primary mb-2"
                >View Menus</a
              >
              <a href="EditMenu.jsp" class="btn btn-warning mb-2">Edit Menu</a>
              <a href="DeleteMenu.jsp" class="btn btn-danger mb-2"
                >Delete Menu</a
              >
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <!-- Manage Orders Section -->
        <div class="col-md-6">
          <div class="card mb-4">
            <div class="card-header bg-dark text-white">Manage Orders</div>
            <div class="card-body">
              <a href="ViewAllOrders.jsp" class="btn btn-primary mb-2"
                >View Orders</a
              >
              <a href="UpdateOrderStatus.jsp" class="btn btn-warning mb-2"
                >Update Order Status</a
              >
              <a href="DeleteOrder.jsp" class="btn btn-danger mb-2"
                >Delete Order</a
              >
            </div>
          </div>
        </div>

        <!-- Manage Users Section -->
        <div class="col-md-6">
          <div class="card mb-4">
            <div class="card-header bg-dark text-white">Manage Users</div>
            <div class="card-body">
              <a href="ViewUsers.jsp" class="btn btn-primary mb-2">View Users</a>
              <a href="EditUser.jsp" class="btn btn-warning mb-2">Edit User</a>
              <a href="DeleteUser.jsp" class="btn btn-danger mb-2">Delete User</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer>
      <p>&copy; 2024 Admin Panel. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Leaflet.js library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.css"
    />

    <script>
      let map; // Declare map variable globally

      const showLocationBtn = document.getElementById("showLocationBtn");
      const closeButton = document.getElementById("closeButton");
      const mapContainer = document.getElementById("map-container");

      // Function to initialize the map
      function initializeMap(lat, lon) {
        if (!map) {
          // Initialize map if it hasn't been initialized
          map = L.map("map").setView([lat, lon], 13);

          // Add OpenStreetMap tiles
          L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
            attribution:
              '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
          }).addTo(map);

          // Add a marker at the user's location
          L.marker([lat, lon])
            .addTo(map)
            .bindPopup("<b>You are here</b>")
            .openPopup();
        } else {
          // If the map is already initialized, just update its position
          map.setView([lat, lon], 13);
          L.marker([lat, lon])
            .addTo(map)
            .bindPopup("<b>You are here</b>")
            .openPopup();
        }
      }

      // Show the map container and fetch user's location
      showLocationBtn.addEventListener("click", () => {
        mapContainer.style.display = "block";

        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(
            (position) => {
              const lat = position.coords.latitude;
              const lon = position.coords.longitude;
              initializeMap(lat, lon);
            },
            () => {
              alert("Unable to retrieve your location.");
            }
          );
        } else {
          alert("Geolocation is not supported by this browser.");
        }
      });

      // Close the map container when clicking the close button
      closeButton.addEventListener("click", () => {
        mapContainer.style.display = "none";
      });

      // Close the map container when clicking outside the map
      mapContainer.addEventListener("click", (event) => {
        if (event.target === mapContainer) {
          mapContainer.style.display = "none";
        }
      });
      
   
    </script>
    
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
      	 window.location.href = 'welcome.html';
      }
    function navigateToPage() {
       
        // Show the message box with a fade-in effect
        document.getElementById("logoutMessage").style.display = "block";

        // Redirect to another page after a short delay
        setTimeout(function() {
            window.location.href = 'welcome.html';  // Replace with your target page
        }, 2000);  // 2 seconds delay before redirection
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
