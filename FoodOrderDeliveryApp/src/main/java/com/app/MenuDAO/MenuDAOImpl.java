package com.app.MenuDAO;



import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAOImpl implements MenuDAO  {

    List<Menu> menuList = new ArrayList<>();
    
    private final String INSERT_QUERY = "INSERT INTO menu(restaurantId, menuName, description, price, rating, isAvailable,imageUrl) VALUES(?, ?, ?, ?, ?, ?,?)";
    private final String FETCH_ALL_QUERY = "SELECT * FROM menu";
    private final String FETCH_SPECIFIC_ID_QUERY = "SELECT * FROM menu WHERE menuId = ?";
    private final String DELETE_BY_ID_QUERY = "DELETE FROM menu WHERE menuId = ?";
    private final String UPDATE_AVAILABILITY_QUERY = "UPDATE menu SET isAvailable = ? WHERE menuId = ?";
    private final String UPDATE_MENU_QUERY = "UPDATE menu SET restaurantId = ? , menuName = ?, description = ?, price = ?, rating = ?, isAvailable= ?,imageUrl= ? WHERE menuId = ?";
    private final String FETCH_SPECIFIC_RESTAURANT_ID_QUERY = "SELECT * FROM menu WHERE restaurantId = ?";

    
    private String url = "jdbc:mysql://localhost:3306/db";
    private String user = "root";
    private String password = "root";
    private Connection con;
    private PreparedStatement pstmt;
    private Statement stmt;
    private ResultSet resultSet;
    private Menu m;
    private int status;

    public MenuDAOImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insert(Menu m) {
        try {
            pstmt = con.prepareStatement(INSERT_QUERY);
            pstmt.setInt(1, m.getRestaurantId());
            pstmt.setString(2, m.getMenuName());
            pstmt.setString(3, m.getDescription());
            pstmt.setFloat(4, m.getPrice());
            pstmt.setInt(5, m.getRating());
            pstmt.setBoolean(6, m.isAvailable());
            pstmt.setString(7, m.getImageUrl());
            
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
    public List<Menu> fetchAll() {
        try {
            stmt = con.createStatement();
            resultSet = stmt.executeQuery(FETCH_ALL_QUERY);
            menuList = extractMenuFromResultSet(resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return menuList;
    }

    private List<Menu> extractMenuFromResultSet(ResultSet resultSet) {
        List<Menu> menuList = new ArrayList<>();
        try {
            while (resultSet.next()) {
                menuList.add(new Menu(
                        resultSet.getInt("menuId"),
                        resultSet.getInt("restaurantId"),
                        resultSet.getString("menuName"),
                        resultSet.getString("description"),
                        resultSet.getFloat("price"),
                        resultSet.getInt("rating"),
                        resultSet.getBoolean("isAvailable"),
                        resultSet.getString("imageUrl")
                        
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return menuList;
    }

    @Override
    public Menu fetchSpecificId(int id) {
        try {
            pstmt = con.prepareStatement(FETCH_SPECIFIC_ID_QUERY);
            pstmt.setInt(1, id);
            resultSet = pstmt.executeQuery();
            menuList = extractMenuFromResultSet(resultSet);
            
            if (!menuList.isEmpty()) {
                m = menuList.get(0);
            } else {
                System.out.println("No Record Found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }
    
    public List<Menu> fetchSpecificResturantId(int id) {
        try {
            pstmt = con.prepareStatement(FETCH_SPECIFIC_RESTAURANT_ID_QUERY);
            pstmt.setInt(1, id);
            resultSet = pstmt.executeQuery();
            menuList = extractMenuFromResultSet(resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return menuList;
    }

    @Override
    public int deleteByMenuId(int id) {
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
    public int updateAvailability(boolean isAvailable, int id) {
        try {
            pstmt = con.prepareStatement(UPDATE_AVAILABILITY_QUERY);
            pstmt.setBoolean(1, isAvailable);
            pstmt.setInt(2, id);
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
   
    public int updateMenu(Menu m) {
    	System.out.println("2");
    	System.out.println(m.getMenuId());
        try {
            pstmt = con.prepareStatement(UPDATE_MENU_QUERY);
            pstmt.setInt(1, m.getRestaurantId());
            pstmt.setString(2, m.getMenuName());
            pstmt.setString(3, m.getDescription());
            pstmt.setFloat(4, m.getPrice());
            pstmt.setInt(5, m.getRating());
            pstmt.setBoolean(6, m.isAvailable());
            pstmt.setString(7, m.getImageUrl());
            pstmt.setInt(8, m.getMenuId());
            status = pstmt.executeUpdate();
        	System.out.println(status);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }


}
