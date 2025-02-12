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
 * Servlet implementation class ViewAllMenu
 */
@WebServlet("/ViewAllMenu")
public class ViewAllMenu extends HttpServlet  {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MenuDAOImpl mDAOI = new MenuDAOImpl();
		List<Menu> menuAll = mDAOI.fetchAll();
		req.getSession().setAttribute("menuAll", menuAll);
		resp.sendRedirect("ViewAllMenu.jsp");
	}

}
