<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
      body {
        font-family: "Poppins", sans-serif;
        background-color: #f0f4f8;
      }
      header {
        background-color: #343a40;
        color: white;
        padding: 15px;
        text-align: center;
        font-size: 32px;
      }
      footer {
        background: #f1f1f1;
        text-align: center;
        padding: 15px;
        margin-top: 30px;
        font-size: 14px;
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
    <!-- Admin Header -->
    <header>
      <h1>Admin Dashboard</h1>
    </header>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Admin Panel</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link active" href="#">Dashboard</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Manage Restaurants</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Manage Menus</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Manage Orders</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Manage Users</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Admin Content -->
    <div class="container mt-5">
      <div class="row">
        <!-- Dashboard Cards -->
        <div class="col-md-3">
          <div class="card text-center bg-primary text-white mb-4">
            <div class="card-body">
              <h3>Total Restaurants</h3>
              <h2>25</h2>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-center bg-success text-white mb-4">
            <div class="card-body">
              <h3>Total Menus</h3>
              <h2>120</h2>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-center bg-warning text-white mb-4">
            <div class="card-body">
              <h3>Total Orders</h3>
              <h2>150</h2>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-center bg-danger text-white mb-4">
            <div class="card-body">
              <h3>Total Users</h3>
              <h2>350</h2>
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
              <a href="addMenu.jsp" class="btn btn-success mb-2">Add Menu</a>
              <a href="viewMenus.jsp" class="btn btn-primary mb-2"
                >View Menus</a
              >
              <a href="editMenu.jsp" class="btn btn-warning mb-2">Edit Menu</a>
              <a href="deleteMenu.jsp" class="btn btn-danger mb-2"
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
              <a href="viewOrders.jsp" class="btn btn-primary mb-2"
                >View Orders</a
              >
              <a href="updateOrderStatus.jsp" class="btn btn-warning mb-2"
                >Update Order Status</a
              >
              <a href="deleteOrder.jsp" class="btn btn-danger mb-2"
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
              <a href="addUser.jsp" class="btn btn-success mb-2">Add User</a>
              <a href="viewUsers.jsp" class="btn btn-primary mb-2"
                >View Users</a
              >
              <a href="editUser.jsp" class="btn btn-warning mb-2">Edit User</a>
              <a href="deleteUser.jsp" class="btn btn-danger mb-2"
                >Delete User</a
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
  </body>
</html>
