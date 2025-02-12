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
 * Servlet implementation class EditRestaurantAction
 */
@WebServlet("/EditRestaurantAction")
public class EditRestaurantAction extends HttpServlet  {
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int rid = Integer.parseInt(req.getParameter("id"));
		RestaurantDAOImpl  rDAOI = new RestaurantDAOImpl ();
		Restaurant RestaurantID = rDAOI.fetchSpecificId(rid);
		req.getSession().setAttribute("RestaurantID", RestaurantID);
		resp.sendRedirect("EditRestaurantAction.jsp");
		
		}
	

}
