package com.app.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.RestaurantDao.Restaurant;
import com.app.RestaurantDao.RestaurantDAOImpl;

/**
 * Servlet implementation class EditRestaurantServlet
 */
@WebServlet("/EditRestaurantServlet")
public class EditRestaurantServlet extends HttpServlet  {

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDAOImpl  rDAOI = new RestaurantDAOImpl ();
		List<Restaurant> ListRestaurant = rDAOI.fetchAll();
		req.getSession().setAttribute("ListRestaurant", ListRestaurant);
		resp.sendRedirect("EditRestaurant.jsp");
		
		
		
	}

}
