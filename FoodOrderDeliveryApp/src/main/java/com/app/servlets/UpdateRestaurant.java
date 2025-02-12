package com.app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.RestaurantDao.Restaurant;
import com.app.RestaurantDao.RestaurantDAOImpl;

/**
 * Servlet implementation class UpdateRestaurant
 */
@WebServlet("/UpdateRestaurant")
public class UpdateRestaurant extends HttpServlet  {

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		
		int restaurantId = Integer.parseInt(request.getParameter("restaurantID"));
		String restaurantName = request.getParameter("restaurantName");
        String cuisineType = request.getParameter("cuisineType");
        String address = request.getParameter("address");
        int rating = Integer.parseInt(request.getParameter("rating"));
        int deliveryTime = Integer.parseInt(request.getParameter("deliveryTime"));
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        
        Restaurant Restaurant = new Restaurant(restaurantId,restaurantName,cuisineType,address,rating,deliveryTime,isActive);
        RestaurantDAOImpl rDAOI = new RestaurantDAOImpl();
        rDAOI.updateRestaurant(Restaurant);
        resp.sendRedirect("EditRestaurantServlet");
        
        
        
		
	}

}
