package com.app.order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class OrderDAOImpl implements OrderDAO  {

    private final String FETCH_ORDER_BY_ID_QUERY = "SELECT * FROM order_history WHERE orderId = ?";
    private final String INSERT_ORDER_HISTORY_QUERY = "INSERT INTO order_history(userId, restaurantId, menuId, quantity, totalAmount, payment, dateTime, status,address,OrderSame) VALUES(?, ?, ?, ?, ?, ?, ?, ?,?,?)";
    private final String UPDATE_ORDER_HISTORY_QUERY = "UPDATE order_history SET status = ? WHERE OrderSame = ?";
    private final String FETCH_ORDERS_BY_USER_ID = "SELECT * FROM order_history WHERE userId = ?";
    private final String MAX_USER_ID ="SELECT orderId FROM order_history ORDER BY orderId DESC LIMIT 1";
    private final String GET_USERS ="SELECT * FROM order_history WHERE OrderSame = ?";

    
    private String url = "jdbc:mysql://localhost:3306/db";
    private String user = "root";
    private String password = "root";
    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet resultSet;
    private int status;
    private Order order;
    List<Order> orderList = new ArrayList<>();
    
	private int lastOrderId  = -1;
    
    public OrderDAOImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Order fetchOrderId(int id) {
        try {
            pstmt = con.prepareStatement(FETCH_ORDER_BY_ID_QUERY);
            pstmt.setInt(1, id);
            resultSet = pstmt.executeQuery();
            orderList = extractStudentFromResultSet(resultSet);
            
            if (orderList.size()>0) {
                order = orderList.get(0);
               
            }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public void insertOrderHistory(Order o) {
        try {
            pstmt = con.prepareStatement(INSERT_ORDER_HISTORY_QUERY);
            pstmt.setInt(1, o.getUserId());
            pstmt.setInt(2, o.getRestaurantId());
            pstmt.setInt(3, o.getMenuId());
            pstmt.setInt(4, o.getQuantity());
            pstmt.setFloat(5, o.getTotalAmount());
            pstmt.setString(6, o.getPayment());
            pstmt.setTimestamp(7, o.getDateTime());
            pstmt.setString(8, o.getStatus());
            pstmt.setString(9, o.getAddress());
            pstmt.setInt(10, o.getOrderSame());
            status = pstmt.executeUpdate();
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int updateOrderHistory(int id, String status) {
        try {
            pstmt = con.prepareStatement(UPDATE_ORDER_HISTORY_QUERY);
            pstmt.setString(1, status);
            pstmt.setInt(2, id);

            this.status = pstmt.executeUpdate();
            
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.status;
    }
    
    @Override
    public List<Order> fetchOrdersByUserId(int userId) {
        try {
            pstmt = con.prepareStatement(FETCH_ORDERS_BY_USER_ID);
            pstmt.setInt(1, userId);
            resultSet = pstmt.executeQuery();
            orderList = extractStudentFromResultSet(resultSet);
            if (orderList.size()>0) {
                order = orderList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderList;
    }
    
    public List<Order> getOrders(int OrderSame) {
        try {
        	orderList.clear();
            pstmt = con.prepareStatement(GET_USERS);
            pstmt.setInt(1, OrderSame);
            resultSet = pstmt.executeQuery();
            orderList = extractStudentFromResultSet(resultSet);
            
            
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderList;
    }
    
    
    List<Order> extractStudentFromResultSet(ResultSet resultSet ) {
		  try {
			  while (resultSet.next()) {
				  orderList.add(new Order(
	                    resultSet.getInt("orderId"),
	                    resultSet.getInt("userId"),
	                    resultSet.getInt("restaurantId"),
	                    resultSet.getInt("menuId"),
	                    resultSet.getInt("quantity"),
	                    resultSet.getFloat("totalAmount"),
	                    resultSet.getString("payment"),
	                    resultSet.getTimestamp("dateTime"),
	                    resultSet.getString("status"),
	                    resultSet.getString("address"),
	                    resultSet.getInt("OrderSame")
	                ));
	               
			  }
			  
			  }catch(Exception e) {
			  e.printStackTrace();
		  }
		  
		  return orderList;
	  }
    
      public int fetchLastOrderId() {
    	  try {
    	  pstmt = con.prepareStatement(MAX_USER_ID);
    	  resultSet = pstmt.executeQuery();

         if (resultSet.next()) {
             lastOrderId = resultSet.getInt("orderId");
      }
    	  }
    	  catch(Exception e) {
    		  System.out.println(e);
    	  }
    	  
    	  return lastOrderId;
      }
      

     
}
    

