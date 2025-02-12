package com.app.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.UserDao.User;



@WebServlet("/Login")
public class Login extends HttpServlet  {
	
	private Connection con;
	private PreparedStatement pstmt;
    private Statement stmt;
    private ResultSet resultSet;
    private int status;
    private PrintWriter pw;
   
    
    private final String FETCH_QUERY = "select * from UserApp where email = ?";
	private ResultSet rs;
	private HttpSession session;
	
	@Override
	public void init() throws ServletException {
		
		con = MyConnect.connect();	 
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello");
		
		 String email = req.getParameter("email");
		 String passWord = req.getParameter("password");
		 pw = resp.getWriter();
		 
		try {
			pstmt = con.prepareStatement(FETCH_QUERY);
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			
			 if (rs.next()) { 
		            if (rs.getString("email").equals(email)) {
		                if (rs.getString("password").equals(passWord)) {
		                int id = rs.getInt("id");
		               	 String name = rs.getString("UserName");
		               	String Email = rs.getString("email");
		        		 int  mobileno = Integer.parseInt(rs.getString("mobileno"));
		        		 String address = rs.getString("address");
		        		 String roleUser = rs.getString("roleUser");
		        		
		        		 
		        		 User user = new User(id,name,Email,passWord,mobileno,address,roleUser);
		        		 
		                     session = req.getSession();
		                     session.setAttribute("user", user);
		                    
		                     
		                     
		                     if(user.getRoleUser().equals("Customer")) {
		                    resp.sendRedirect("ShowRestaurant");
		                     }
		                     else {
		                    	 resp.sendRedirect("admin.jsp"); 
		                     }
		            
		                } else {
		                    pw.println("Password Mismatch");
		                }
		            } else {
		                pw.println("Email Mismatch");
		            }
		        } else {
		            pw.println("No user found with the given email");
		        }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	}
		
	
   
