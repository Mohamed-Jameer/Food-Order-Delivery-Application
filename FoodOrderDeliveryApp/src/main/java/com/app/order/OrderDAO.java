package com.app.order;


import java.util.List;

public interface OrderDAO {
    Order fetchOrderId(int id);
    void insertOrderHistory(Order o);
    int updateOrderHistory(int id, String status);
    Order fetchOrdersByUserId(int userId);

}
