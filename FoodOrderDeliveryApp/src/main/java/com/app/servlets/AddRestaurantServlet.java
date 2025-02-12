package com.app.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.RestaurantDao.Restaurant;
import com.app.RestaurantDao.RestaurantDAO;
import com.app.RestaurantDao.RestaurantDAOImpl;

/**
 * Servlet implementation class AddRestaurantServlet
 */
@WebServlet("/AddRestaurantServlet")
public class AddRestaurantServlet extends HttpServlet  {

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	System.out.println("AddRestaurantServlet");
	        String restaurantName = request.getParameter("restaurantName");
	        String cuisineType = request.getParameter("cuisineType");
	        String address = request.getParameter("address");
	        int rating = Integer.parseInt(request.getParameter("rating"));
	        int deliveryTime = Integer.parseInt(request.getParameter("deliveryTime"));
	        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

	        Restaurant restaurant = new Restaurant();
	        restaurant.setRestaurantName(restaurantName);
	        restaurant.setCuisineType(cuisineType);
	        restaurant.setAddress(address);
	        restaurant.setRating(rating);
	        restaurant.setDeliveryTime(deliveryTime);
	        restaurant.setActive(isActive);

	        // Insert the restaurant into the database
	        RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
	        restaurantDAO.insert(restaurant);

	        // Redirect to the restaurant list page or home
	        response.sendRedirect("admin.jsp");
	    }
	}
