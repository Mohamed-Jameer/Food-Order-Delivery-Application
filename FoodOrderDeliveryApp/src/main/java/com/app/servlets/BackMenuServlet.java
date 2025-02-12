package com.app.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.MenuDAO.Menu;
import com.app.MenuDAO.MenuDAOImpl;

/**
 * Servlet implementation class BackMenuServlet
 */
@WebServlet("/BackMenuServlet")
public class BackMenuServlet extends HttpServlet  {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int x =(int) req.getSession().getAttribute("restaurantId");
        MenuDAOImpl menuDAOI = new MenuDAOImpl();
  		List<Menu> menuList = menuDAOI.fetchSpecificResturantId(x);
   		req.getSession().setAttribute("Menu", menuList);
   		resp.sendRedirect("ViewMenu.jsp");
	}

}
