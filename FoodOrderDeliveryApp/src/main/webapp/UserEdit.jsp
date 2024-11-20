<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.app.UserDao.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit User</h2>

        <%
            // Retrieve user details from session
            User user = (User) session.getAttribute("user");
            
            // Check if there is a success message to display
            String successMessage = (String) request.getAttribute("updateSuccess");
            if (successMessage != null) {
        %>
            <div class="alert alert-success">
                <%= successMessage %>
            </div>
            <script>
                setTimeout(function() {
                    window.history.back();  // Redirect the user back after 3 seconds
                }, 2000);
            </script>
        <%
            }
        %>

        <!-- User Edit Form -->
        <form action="UpdateUserServlet" method="POST">
            <div class="mb-3">
                <label for="userId" class="form-label">User ID</label>
                <!-- User ID (Disabled) -->
                <input type="text" class="form-control" id="userId" name="id" value="<%= user.getId() %>" readonly>
            </div>

            <div class="mb-3">
                <label for="userName" class="form-label">User Name</label>
                <input type="text" class="form-control" id="userName" name="name" value="<%= user.getUserName() %>" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= user.getPassword() %>" required>
            </div>
            
            <div class="mb-3">
                <label for="mobileno" class="form-label">Mobile No </label>
                <input type="text" class="form-control" id="mobileno" name="mobileno" value="<%= user.getMobile() %>" required>
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="<%= user.getAddress() %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Update User</button>
            <a href="javascript:history.back()" class="btn btn-secondary">Cancel</a>
        </form>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
