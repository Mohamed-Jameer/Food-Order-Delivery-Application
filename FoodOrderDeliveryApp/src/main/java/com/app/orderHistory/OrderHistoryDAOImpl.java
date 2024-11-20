package com.app.orderHistory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderHistoryDAOImpl implements OrderHistoryDAO {
	    
    private final String INSERT_ORDER_HISTORY_QUERY = "INSERT INTO Order_ShowHis(userId,orderid,total,dateTime,status,address) VALUES(?, ?, ?, ?, ?, ?, ?, ?,?)";
    
	    private String url = "jdbc:mysql://localhost:3306/db";
	    private String user = "root";
	    private String password = "root";
	    private Connection con;
	    private PreparedStatement pstmt;
	    private ResultSet resultSet;
	    private int status;
	    
	    
	public OrderHistoryDAOImpl(){
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection(url, user, password);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	}
	
	@Override
	public void insert(OrderHistory o) {
		 try {
	            pstmt = con.prepareStatement(INSERT_ORDER_HISTORY_QUERY);
	            pstmt.setInt(1, o.getUserId());
	            pstmt.setInt(2, o.getOrderId());
	            pstmt.setFloat(3, o.getTotalAmount());
	            pstmt.setTimestamp(4, o.getDate());
	            pstmt.setString(5, o.getStatus());
	            pstmt.setString(6, o.getAddress());

	            status = pstmt.executeUpdate();
	            
	            if (status != 0) {
	                System.out.println("Order history inserted successfully.");
	            } else {
	                System.out.println("Insert failed.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}
	

}
