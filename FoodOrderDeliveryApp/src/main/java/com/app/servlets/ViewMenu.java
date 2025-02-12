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
 * Servlet implementation class ViewMenu
 */
@WebServlet("/ViewMenu")
public class ViewMenu extends HttpServlet  {

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	     System.out.println("View Menu");
		int id = Integer.parseInt(req.getParameter("id"));
		
		MenuDAOImpl menuDAOI = new MenuDAOImpl();
		
		
		List<Menu> menuList = menuDAOI.fetchSpecificResturantId(id);
		   System.out.println(menuList.size());
		
		for(Menu menu : menuList) {
			System.out.println(menu.toString());
		}
		req.getSession().setAttribute("restaurantId", id);
		req.getSession().setAttribute("Menu", menuList);
		resp.sendRedirect("ViewMenu.jsp");
		
		
	}

}
