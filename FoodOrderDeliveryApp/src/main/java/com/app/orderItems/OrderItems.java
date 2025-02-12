package com.app.orderItems;


public class OrderItems {
    private int orderItemId;
    private int orderId;
    private int menuId;
    private int quantity;
    private float itemTotalPrice;
    private int userId;
    private String address ;

  
    
    public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public OrderItems() {
		super();
		// TODO Auto-generated constructor stub
	}



	public OrderItems(int orderId, int menuId, int quantity, float itemTotalPrice, int userId, String address) {
		super();
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotalPrice = itemTotalPrice;
		this.userId = userId;
		this.address = address;
	}


	public OrderItems(int orderItemId, int orderId, int menuId, int quantity, float itemTotalPrice, int userId,
			String address) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotalPrice = itemTotalPrice;
		this.userId = userId;
		this.address = address;
	}

	// Getters and Setters
    
	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getItemTotalPrice() {
		return itemTotalPrice;
	}

	public void setItemTotalPrice(float itemTotalPrice) {
		this.itemTotalPrice = itemTotalPrice;
	}


}

