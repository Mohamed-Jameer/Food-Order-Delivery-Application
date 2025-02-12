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
 * Servlet implementation class DeleteRestaurantAction
 */
@WebServlet("/DeleteRestaurantAction")
public class DeleteRestaurantAction extends HttpServlet  {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rid = Integer.parseInt(req.getParameter("rid"));
		RestaurantDAOImpl  rDAOI = new RestaurantDAOImpl ();
		rDAOI.deleteByRestId(rid);
		resp.sendRedirect("DeleteRestaurantServlet");
	}

}
