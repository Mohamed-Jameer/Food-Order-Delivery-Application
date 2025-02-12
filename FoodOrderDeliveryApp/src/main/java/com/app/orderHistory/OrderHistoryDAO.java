package com.app.orderHistory;

import java.util.List;

import com.app.order.Order;

public interface OrderHistoryDAO  {
	void insert(OrderHistory orderHistory);
	List<OrderHistory> fetchOrderHisId(int Userid) ;
	OrderHistory fetchOrderHisOrderId(int orderSame);
	List<OrderHistory> fetchAll() ;
	void deleteHisOrder(int id);
	void updateStatusHisOrder(String status, int id);
}
