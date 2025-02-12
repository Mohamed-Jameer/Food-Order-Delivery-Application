package com.app.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.UserDao.User;
import com.app.UserDao.UserDAOImpl;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet  {
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   int id = Integer.parseInt(req.getParameter("id"));
	   String name = req.getParameter("name");
	   String email = req.getParameter("email");
	   String password = req.getParameter("password");
	   int mobileno = Integer.parseInt(req.getParameter("mobileno"));
	   String address = req.getParameter("address");
	   
	   User user = new User(id,name,email,password,mobileno,address);
	   UserDAOImpl uDAOI = new UserDAOImpl();
	   uDAOI.updateUser(user);
	   
	   req.setAttribute("updateSuccess", "Successfully updated your details.");
	   req.getRequestDispatcher("UserEdit.jsp").forward(req, resp);
	   
	}
}
