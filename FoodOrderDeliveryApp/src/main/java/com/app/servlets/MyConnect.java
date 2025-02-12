package com.app.servlets;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnect {
	private static  String url = "jdbc:mysql://localhost:3306/db";
    private static String user = "root";
    private static String password = "root";
	private static Connection con;
	
  public static Connection connect() {
		 try {
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        con = DriverManager.getConnection(url, user, password);
		        System.out.println("Success");
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		 
		 return con;
	}

}
