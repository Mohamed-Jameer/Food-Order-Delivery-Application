package com.app.orderHistory;

import java.sql.Timestamp;

public class OrderHistory  {
	private int orderHistoryId;
	private int userId;
	private int orderId;
	private float totalAmount;
	private Timestamp date;
	private String status;
	private String address;
	
	
	public int getOrderHistoryId() {
		return orderHistoryId;
	}
	public void setOrderHistoryId(int orderHistoryId) {
		this.orderHistoryId = orderHistoryId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public OrderHistory(int orderHistoryId, int userId, int orderId, float totalAmount, Timestamp date, String status,String address) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.userId = userId;
		this.orderId = orderId;
		this.totalAmount = totalAmount;
		this.date = date;
		this.status = status;
		this.address = address;
	}
	public OrderHistory(int userId, int orderId, float totalAmount, Timestamp date, String status, String address) {
		super();
		this.userId = userId;
		this.orderId = orderId;
		this.totalAmount = totalAmount;
		this.date = date;
		this.status = status;
		this.address = address;
	}
	public OrderHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "OrderHistory [orderHistoryId=" + orderHistoryId + ", userId=" + userId + ", orderId=" + orderId
				+ ", totalAmount=" + totalAmount + ", date=" + date + ", status=" + status + ", address=" + address
				+ "]";
	}

	
	
	
	

	
	

}
