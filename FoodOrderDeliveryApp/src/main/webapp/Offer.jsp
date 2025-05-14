<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.app.RestaurantDao.Restaurant" %>
<%@ page import="com.app.UserDao.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"  >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Special Offers</title>
    <!-- Linking Bootstrap and FontAwesome for styling and icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
     .profile-box {
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
    transition: opacity 0.3s ease; /* Smooth fade in and out */
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
        
   
  a {
      text-decoration: none;
    }
    
   
        /* General body styling */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
        }


        /* Card styles for offers */
        .offer-card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 8px;
            transition: transform 0.3s ease-in-out;
        }

        /* Adding hover effect to offer cards */
        .offer-card:hover {
            transform: scale(1.05);
        }

        /* Ensuring images align with card design */
        .offer-card img {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        /* Styling for offer titles */
        .offer-title {
            color: #ff5722;
            font-weight: bold;
        }

        /* Styling claim button */
        .btn-claim {
            background: #ff5722;
            color: #fff;
        }

        /* Adding hover effect for claim button */
        .btn-claim:hover {
            background: #e64a19;
        }

       

      

        /* Carousel image styling */
        .carousel-item img {
           width:100%;
           height:450px;
            object-fit: cover;
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
<!-- Bootstrap carousel for featured offers -->
<div id="offerCarousel" class="carousel slide my-5" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <!-- Indicators for navigating slides -->
        <button type="button" data-bs-target="#offerCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#offerCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#offerCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <!-- First slide -->
        <div class="carousel-item active">
            <img src="https://th.bing.com/th/id/OIP.FGWoQmQqqkFiuke38FNDEAHaEK?w=280&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7" class="d-block w-100" alt="Offer 1" style="object-fit: cover; width:100%; height:450px;">
            <div class="carousel-caption d-none d-md-block">
                <h5>Buy 1 Get 1 Free</h5>
                <p>Enjoy this limited-time offer on all pizzas!</p>
            </div>
        </div>
        <!-- Second slide -->
        <div class="carousel-item">
            <img src="https://th.bing.com/th?id=OIP.FBeDYCEZqe8-pkmXL4UncwHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.1&pid=3.1&rm=2" class="d-block w-100" alt="Offer 2" style="object-fit: cover; width:100%; height:450px;">
            <div class="carousel-caption d-none d-md-block">
                <h5>20% Off on First Order</h5>
                <p>Register now and get an instant discount.</p>
            </div>
        </div>
        <!-- Third slide -->
        <div class="carousel-item">
            <img src="https://th.bing.com/th/id/OIP.KdQ0Jz0tDTKbs1zqTmRnzAHaD4?w=336&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7" class="d-block w-100" alt="Offer 3" style="object-fit: cover; width:100%; height:450px;">
            <div class="carousel-caption d-none d-md-block">
                <h5>Free Desserts</h5>
                <p>Get a free dessert with every meal combo!</p>
            </div>
        </div>
    </div>
</div>

    <!-- Carousel navigation controls -->
    <button class="carousel-control-prev" type="button" data-bs-target="#offerCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#offerCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<div class="container my-5">
    <div class="row">
        <!-- First offer card -->
        <div class="col-md-4 mb-4">
            <div class="card offer-card">
                <img src="https://via.placeholder.com/400x200?text=Special+Deal+1" class="card-img-top" alt="Special Deal 1">
                <div class="card-body">
                    <h5 class="card-title offer-title">Combo Offer</h5>
                    <p class="card-text">Get a meal combo at just $9.99!</p>
                    <!-- Button to claim offer -->
                    <button class="btn btn-claim w-100">Claim Offer</button>
                </div>
            </div>
        </div>
        <!-- Second offer card -->
        <div class="col-md-4 mb-4">
            <div class="card offer-card">
                <img src="https://via.placeholder.com/400x200?text=Special+Deal+2" class="card-img-top" alt="Special Deal 2">
                <div class="card-body">
                    <h5 class="card-title offer-title">Free Drinks</h5>
                    <p class="card-text">Order a burger and get a free drink.</p>
                    <!-- Button to claim offer -->
                    <button class="btn btn-claim w-100">Claim Offer</button>
                </div>
            </div>
        </div>
        <!-- Third offer card -->
        <div class="col-md-4 mb-4">
            <div class="card offer-card">
                <img src="https://via.placeholder.com/400x200?text=Special+Deal+3" class="card-img-top" alt="Special Deal 3">
                <div class="card-body">
                    <h5 class="card-title offer-title">Weekend Special</h5>
                    <p class="card-text">Flat 15% off on all orders this weekend!</p>
                    <!-- Button to claim offer -->
                    <button class="btn btn-claim w-100">Claim Offer</button>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 QuickBite Food Order. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

    <!-- Map container -->
    <div id="map-container">
      <button id="closeButton">Close</button>
      <div id="map"></div>
    </div>

    <!-- Leaflet.js library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.css"
    />

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
      let map; // Declare map variable globally

      const showLocationBtn = document.getElementById("showLocationBtn");
      const closeButton = document.getElementById("closeButton");
      const mapContainer = document.getElementById("map-container");
      function initializeMap(lat, lon) {
        if (!map) {
          map = L.map("map").setView([lat, lon], 13);
          L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
            attribution:
              '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
          }).addTo(map);
          L.marker([lat, lon])
            .addTo(map)
            .bindPopup("<b>You are here</b>")
            .openPopup();
        } else {
          map.setView([lat, lon], 13);
          L.marker([lat, lon])
            .addTo(map)
            .bindPopup("<b>You are here</b>")
            .openPopup();
        }
      }
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
      closeButton.addEventListener("click", () => {
        mapContainer.style.display = "none";
      });
      mapContainer.addEventListener("click", (event) => {
        if (event.target === mapContainer) {
          mapContainer.style.display = "none";
        }
      });
    
    function navigateToPage() {
        document.getElementById("logoutMessage").style.display = "block";
        setTimeout(function() {
            window.location.href = 'welcome.html'; 
        }, 2000); 
    }

    window.onclick = function(event) {
        var profileBox = document.getElementById("profile-box");
        var profileButton = document.querySelector(".profile-btn");

        if (event.target !== profileBox && !profileBox.contains(event.target) && event.target !== profileButton && !profileButton.contains(event.target)) {
            profileBox.style.display = "none"; 
    };
    window.onload = function() {
        document.getElementById("loader-wrapper").style.display = "none";
        document.getElementById("main-content").style.display = "block";
    };
    
    
    function toggleProfileBox() {
        var profileBox = document.getElementById("profile-box");
        if (profileBox.style.display === "none" || profileBox.style.display === "") {
            profileBox.style.display = "block";
        } else {
            profileBox.style.display = "none";
        }
    }
    
    
    document.addEventListener('DOMContentLoaded', () => {
        const images = document.querySelectorAll('.card-img-top');

        images.forEach((image) => {
            image.addEventListener('mouseover', () => {
                image.style.filter = 'brightness(1.1)';
            });

            image.addEventListener('mouseout', () => {
                image.style.filter = 'brightness(1)'; 
            });
        });
    });
    document.querySelectorAll('.btn-claim').forEach(button => {
        button.addEventListener('click', () => {
            alert('Offer claimed successfully!');
        });
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 // Toggle Profile Box
    function toggleProfileBox() {
        var profileBox = document.getElementById("profile-box");
        profileBox.style.display = (profileBox.style.display === "block") ? "none" : "block";
    }

    // Close Profile Box when clicking outside
    document.addEventListener("click", function(event) {
        var profileBox = document.getElementById("profile-box");
        var profileBtn = document.querySelector(".profile-btn");
        if (!profileBox.contains(event.target) && !profileBtn.contains(event.target)) {
            profileBox.style.display = "none";
        }
    });

    // Navigate to Edit Profile
    function navigateToEditPage() {
        window.location.href = "EditProfile.jsp"; // Change this to your actual Edit Profile page
    }

    // Logout Function
    function navigateToPage() {
        window.location.href = "LogoutServlet"; // Ensure this correctly handles session logout
    }

   

</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
