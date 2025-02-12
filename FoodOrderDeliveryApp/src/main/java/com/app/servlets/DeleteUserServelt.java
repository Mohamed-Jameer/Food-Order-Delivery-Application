package com.app.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.UserDao.UserDAOImpl;

/**
 * Servlet implementation class DeleteUserServelt
 */
@WebServlet("/DeleteUserServelt")
public class DeleteUserServelt extends HttpServlet  {

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("uid"));
		UserDAOImpl  userDAOImpl= new UserDAOImpl();
		userDAOImpl.deleteUser(userId);
		resp.sendRedirect("DeleteUser.jsp");
	}
  
}
