package com.app.orderItems;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemsDAOImpl implements OrderItemsDAO {
    private final String INSERT_QUERY = "INSERT INTO order_items (orderId, menuId, quantity, itemTotalPrice,userId,address) VALUES (?, ?, ?, ?,?,?)";
    private final String FETCH_ALL_QUERY = "SELECT * FROM order_items";
    private final String FETCH_BY_ORDERID_QUERY = "SELECT * FROM order_items WHERE orderId = ?";
    private final String DELETE_BY_ORDERITEMID_QUERY = "DELETE FROM order_items WHERE orderItemId = ?";
    private final String UPDATE_QUANTITY_QUERY = "UPDATE order_items SET quantity = ? WHERE orderItemId = ?";
   
    private String url = "jdbc:mysql://localhost:3306/db" ;
    private String user = "root";
    private String password = "root";
    private Connection con;

    public OrderItemsDAOImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insert(OrderItems orderItems) {
        try {
            PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);
            pstmt.setInt(1, orderItems.getOrderId());
            pstmt.setInt(2, orderItems.getMenuId());
            pstmt.setInt(3, orderItems.getQuantity());
            pstmt.setFloat(4, orderItems.getItemTotalPrice());
            pstmt.setInt(5, orderItems.getUserId());
            pstmt.setString(6, orderItems.getAddress());

            int status = pstmt.executeUpdate();
            if (status != 0) {
                System.out.println("Successfully inserted order item.");
            } else {
                System.out.println("Failed to insert order item.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItems> fetchAll() {
        List<OrderItems> orderItemsList = new ArrayList<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(FETCH_ALL_QUERY);
            while (rs.next()) {
                orderItemsList.add(new OrderItems(
                        rs.getInt("orderItemId"),
                        rs.getInt("orderId"),
                        rs.getInt("menuId"),
                        rs.getInt("quantity"),
                        rs.getFloat("itemTotalPrice"),
                        rs.getInt("userId"),
                        rs.getString("address")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItemsList;
    }

    @Override
    public List<OrderItems> fetchByOrderId(int orderId) {
        List<OrderItems> orderItemsList = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement(FETCH_BY_ORDERID_QUERY);
            pstmt.setInt(1, orderId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                orderItemsList.add(new OrderItems(
                        rs.getInt("orderItemId"),
                        rs.getInt("orderId"),
                        rs.getInt("menuId"),
                        rs.getInt("quantity"),
                        rs.getFloat("itemTotalPrice"),
                        rs.getInt("userId"),
                        rs.getString("address")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItemsList;
    }

    @Override
    public int deleteByOrderItemId(int orderItemId) {
        int status = 0;
        try {
            PreparedStatement pstmt = con.prepareStatement(DELETE_BY_ORDERITEMID_QUERY);
            pstmt.setInt(1, orderItemId);
            status = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int updateQuantity(int orderItemId, int quantity) {
        int status = 0;
        try {
            PreparedStatement pstmt = con.prepareStatement(UPDATE_QUANTITY_QUERY);
            pstmt.setInt(1, quantity);
            pstmt.setInt(2, orderItemId);
            status = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}

