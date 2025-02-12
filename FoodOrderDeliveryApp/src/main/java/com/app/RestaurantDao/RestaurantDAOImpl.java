package com.app.RestaurantDao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class RestaurantDAOImpl implements RestaurantDAO  {

    List<Restaurant> restaurantList = new ArrayList<>();
    
    private final String INSERT_QUERY = "INSERT INTO restaurant(restaurantName, cuisineType, address, rating, deliveryTime, isActive,imageUrl) VALUES(?, ?, ?, ?, ?, ?,?)";
    private final String FETCH_ALL_QUERY = "SELECT * FROM restaurant";
    private final String FETCH_SPECIFIC_ID_QUERY = "SELECT * FROM restaurant WHERE restaurantId = ?";
    private final String DELETE_BY_ID_QUERY = "DELETE FROM restaurant WHERE restaurantId = ?";
    private final String UPDATE_ACTIVE_STATUS_QUERY = "UPDATE restaurant SET isActive = ? WHERE restaurantId = ?";
    private final String UPDATE_RESTAURANT = "UPDATE restaurant SET restaurantName = ?, cuisineType = ?, address = ?, rating = ?, deliveryTime = ?, isActive = ? , imageUrl = ? WHERE restaurantId = ?";

    
    private String url = "jdbc:mysql://localhost:3306/db";
    private String user = "root";
    private String password = "root";
    private Connection con;
    private PreparedStatement pstmt;
    private Statement stmt;
    private ResultSet resultSet;
    private Restaurant r;
    private int status;

    public RestaurantDAOImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insert(Restaurant r) {
        try {
            pstmt = con.prepareStatement(INSERT_QUERY);
            pstmt.setString(1, r.getRestaurantName());
            pstmt.setString(2, r.getCuisineType());
            pstmt.setString(3, r.getAddress());
            pstmt.setInt(4, r.getRating());
            pstmt.setInt(5, r.getDeliveryTime());
            pstmt.setBoolean(6, r.isActive());
            pstmt.setString(7, r.getImageUrl());
            
            status = pstmt.executeUpdate();
            
            if (status != 0) {
                System.out.println("Successfully Inserted");
            } else {
                System.out.println("Insert Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Restaurant> fetchAll() {
        try {
            stmt = con.createStatement();
            resultSet = stmt.executeQuery(FETCH_ALL_QUERY);
            restaurantList = extractRestaurantFromResultSet(resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return restaurantList;
    }

    private List<Restaurant> extractRestaurantFromResultSet(ResultSet resultSet) {
        List<Restaurant> restaurantList = new ArrayList<>();
        try {
            while (resultSet.next()) {
                restaurantList.add(new Restaurant(
                        resultSet.getInt("restaurantId"),
                        resultSet.getString("restaurantName"),
                        resultSet.getString("cuisineType"),
                        resultSet.getString("address"),
                        resultSet.getInt("rating"),
                        resultSet.getInt("deliveryTime"),
                        resultSet.getBoolean("isActive"),
                        resultSet.getString("imageUrl")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return restaurantList;
    }

    @Override
    public Restaurant fetchSpecificId(int id) {
        try {
            pstmt = con.prepareStatement(FETCH_SPECIFIC_ID_QUERY);
            pstmt.setInt(1, id);
            resultSet = pstmt.executeQuery();
            restaurantList = extractRestaurantFromResultSet(resultSet);
            
            if (!restaurantList.isEmpty()) {
                r = restaurantList.get(0);
            } else {
                System.out.println("No Record Found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public int deleteByRestId(int id) {
        try {
            pstmt = con.prepareStatement(DELETE_BY_ID_QUERY);
            pstmt.setInt(1, id);
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int updateActiveStatus(boolean isActive, int id) {
        try {
            pstmt = con.prepareStatement(UPDATE_ACTIVE_STATUS_QUERY);
            pstmt.setBoolean(1, isActive);
            pstmt.setInt(2, id);
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
        
        public void  updateRestaurant(Restaurant r) {
            try {
                pstmt = con.prepareStatement(UPDATE_RESTAURANT);
                pstmt.setString(1, r.getRestaurantName());
                pstmt.setString(2, r.getCuisineType());
                pstmt.setString(3, r.getAddress());
                pstmt.setInt(4, r.getRating());
                pstmt.setInt(5, r.getDeliveryTime());
                pstmt.setBoolean(6, r.isActive());
                pstmt.setString(7, r.getImageUrl());
                
                pstmt.setInt(8, r.getRestaurantId());
                 pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
          
        }

		
    
}

