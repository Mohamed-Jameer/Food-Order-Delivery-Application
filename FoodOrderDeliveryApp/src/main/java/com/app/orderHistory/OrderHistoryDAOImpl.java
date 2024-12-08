package com.app.orderHistory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.app.order.Order;

public class OrderHistoryDAOImpl implements OrderHistoryDAO {
	    
    private final String INSERT_ORDER_HISTORY_QUERY = "INSERT INTO Order_ShowHis(userid,orderid,total,dateTime,status,address) VALUES(?, ?, ?, ?, ?, ?)";
    private final String FETCH_ORDERHISTORY_BY_USER_ID = "SELECT * FROM Order_ShowHis WHERE userid = ?";
    private final String FETCH_ORDERHISTORY_BY_ORDER_ID = "SELECT * FROM Order_ShowHis WHERE orderid = ?";

	    private String url = "jdbc:mysql://localhost:3306/db";
	    private String user = "root";
	    private String password = "root";
	    private Connection con;
	    private PreparedStatement pstmt;
	    private ResultSet resultSet;
	    private int status;
	    
	    List<OrderHistory> orderHistoryList = new ArrayList<>();

		private OrderHistory orderHistory;
		private OrderHistory oh;
	    
	    
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
	                System.out.println("Update history inserted successfully.");
	            } else {
	                System.out.println("Insert failed.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
	}
	

    public List<OrderHistory> fetchOrderHisId(int UserId) {
        try {
            pstmt = con.prepareStatement(FETCH_ORDERHISTORY_BY_USER_ID);
            pstmt.setInt(1, UserId);
            resultSet = pstmt.executeQuery();
            orderHistoryList = extractOrderHistoryFromResultSet(resultSet);
            
            if (orderHistoryList.size()>0) {
            	System.out.println("View History");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderHistoryList;
    }

    
    List<OrderHistory> extractOrderHistoryFromResultSet(ResultSet resultSet ) {
		  try {
			  while (resultSet.next()) {
				  orderHistoryList.add(new OrderHistory(
	                    resultSet.getInt("orderId"),
	                    resultSet.getInt("userId"),
	                    resultSet.getFloat("total"),
	                    resultSet.getTimestamp("dateTime"),
	                    resultSet.getString("status"),
	                    resultSet.getString("address")
	                ));
	               
			  }
			  
			  }catch(Exception e) {
			  e.printStackTrace();
		  }
		  
		  return orderHistoryList;
	  }

	
    public OrderHistory fetchOrderHisOrderId(int orderSame) {
        try {
            pstmt = con.prepareStatement(FETCH_ORDERHISTORY_BY_ORDER_ID);
            pstmt.setInt(1, orderSame);
            resultSet = pstmt.executeQuery();
            orderHistoryList = extractOrderHistoryFromResultSet(resultSet);
            if (orderHistoryList.size()>0) {
            	System.out.println("View History");
            }
            else {
            	System.out.println("no View History");
            }
           oh = orderHistoryList.get(0);
            
 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  oh;
    }


	

}
