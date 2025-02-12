package com.app.orderItems;


import java.util.List;

public interface OrderItemsDAO {
    void insert(OrderItems orderItems);
    List<OrderItems> fetchAll();
    List<OrderItems> fetchByOrderId(int orderId);
    int deleteByOrderItemId(int orderItemId);
    int updateQuantity(int orderItemId, int quantity) ;
}
