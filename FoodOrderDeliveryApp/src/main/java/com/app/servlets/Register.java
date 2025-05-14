package com.app.servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.UserDao.User;
import com.app.UserDao.UserDAO;
import com.app.UserDao.UserDAOImpl;


@WebServlet("/Register")
public class Register extends HttpServlet  {

	

	private PrintWriter pw;
	private HttpSession session;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String name = req.getParameter("name");
		 String email = req.getParameter("email");
		 String passWord = req.getParameter("password");
		 int mobileNo = Integer.parseInt(req.getParameter("phone"));
		 String address = req.getParameter("address");
		 
		 pw = resp.getWriter();
		 
         User user = new User(name,email,passWord,mobileNo,address,"Customer");
		 UserDAO userDAOI = new UserDAOImpl();
		 userDAOI.addUser(user);
		 
		 
		 session = req.getSession();
         session.setAttribute("user", user);
		 resp.sendRedirect("ShowRestaurant");
		 
		 pw.println("Hello from servlet");
	}
	

}
