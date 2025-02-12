package com.app.orderHistory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.app.order.Order;

public class OrderHistoryDAOImpl implements OrderHistoryDAO  {
	    
    private final String INSERT_ORDER_HISTORY_QUERY = "INSERT INTO Order_ShowHis(userid,orderid,total,dateTime,status,address) VALUES(?, ?, ?, ?, ?, ?)";
    private final String FETCH_ORDERHISTORY_BY_USER_ID = "SELECT * FROM Order_ShowHis WHERE userid = ?";
    private final String FETCH_ORDERHISTORY_BY_ORDER_ID = "SELECT * FROM Order_ShowHis WHERE orderid = ?";
    private final String FETCH_ALL_ORDERHISTORY = "SELECT * FROM Order_ShowHis";
    private final String DELETE_ORDERHISTORY_BY_ORDERHIS_ID = "DELETE FROM Order_ShowHis WHERE  oHif= ?";
    private final String UPDATE_STATUS_ORDERHISTORY_BY_ORDERHIS_ID = "UPDATE Order_ShowHis SET status = ?  WHERE  oHif= ?";
    private final String FETCH_ORDERHISTORY_BY_ORDERHIS_ID = "SELECT * FROM Order_ShowHis WHERE oHif = ?";
    
    

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
		private Statement stmt;
		
	    
	    
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
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderHistoryList;
    }

    
    List<OrderHistory> extractOrderHistoryFromResultSet(ResultSet resultSet ) {
		  try {
			  while (resultSet.next()) {
				  orderHistoryList.add(new OrderHistory(
						  resultSet.getInt("oHif"),
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
           
           oh = orderHistoryList.get(0);
            
 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  oh;
    }
    
    public OrderHistory fetchOrderHisOrderOnlyId(int hisOrderId) {
        try {
            pstmt = con.prepareStatement(FETCH_ORDERHISTORY_BY_ORDERHIS_ID);
            pstmt.setInt(1, hisOrderId);
            resultSet = pstmt.executeQuery();
            orderHistoryList = extractOrderHistoryFromResultSet(resultSet);
           
           oh = orderHistoryList.get(0);
            
 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  oh;
    }




	@Override
	public List<OrderHistory> fetchAll() {
		
		List<OrderHistory> orderHistoryAll = new ArrayList<>();
		
		   try {
	             stmt = con.createStatement();
	            resultSet = stmt.executeQuery(FETCH_ALL_ORDERHISTORY);
	            orderHistoryAll = extractOrderHistoryFromResultSet(resultSet);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

		return orderHistoryAll;
		
	}



	@Override
	public void deleteHisOrder(int id) {
		 try {
	            pstmt = con.prepareStatement(DELETE_ORDERHISTORY_BY_ORDERHIS_ID);
	            pstmt.setInt(1, id);
	            pstmt.executeUpdate();
	           
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
	}






	@Override
	public void updateStatusHisOrder(String status, int id) {
		try {
            pstmt = con.prepareStatement(UPDATE_STATUS_ORDERHISTORY_BY_ORDERHIS_ID);
            pstmt.setString(1, status);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
            
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}


	

}
