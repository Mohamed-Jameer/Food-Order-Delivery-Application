package com.app.servlets;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Validation")
public class Validation extends HttpServlet  {

	private PrintWriter pw;
	private RequestDispatcher d;


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String name = req.getParameter("name");
		 String email = req.getParameter("email");
		 String passWord = req.getParameter("password");
		 String ConfirmpassWord = req.getParameter("confirm-password");
		 int mobileNo = Integer.parseInt(req.getParameter("phone"));
		 String address = req.getParameter("address");
		 
		  pw = resp.getWriter();
          
		 if(passWord.equals(ConfirmpassWord)) {	
			 
		   d = req.getRequestDispatcher("Register");
		   d.forward(req, resp);
		   
		    
		 }else {
			pw.println("Miss Match PassWord");
		 }
	}

}
