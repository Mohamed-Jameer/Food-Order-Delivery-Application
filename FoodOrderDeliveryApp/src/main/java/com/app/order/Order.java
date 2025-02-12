package com.app.order;


import java.sql.Timestamp;

public class Order  {
    private int orderId;
    private int userId;
    private int restaurantId;
    private int menuId;
    private int quantity;
    private float totalAmount;
    private String payment;
    private Timestamp dateTime;
    private String status;
    private String address;
    private int OrderSame;

 

	public Order(int orderId, int userId, int restaurantId, int menuId, int quantity, float totalAmount, String payment,
			Timestamp dateTime, String status, String address, int orderSame) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.totalAmount = totalAmount;
		this.payment = payment;
		this.dateTime = dateTime;
		this.status = status;
		this.address = address;
		this.OrderSame = orderSame;
	}
  
	public Order(int userId, int restaurantId, int menuId, int quantity, float totalAmount, String payment,
			Timestamp dateTime, String status, String address, int orderSame) {
		super();
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.totalAmount = totalAmount;
		this.payment = payment;
		this.dateTime = dateTime;
		this.status = status;
		this.address = address;
		this.OrderSame = orderSame;
	}

	public int getOrderSame() {
		return OrderSame;
	}

	public void setOrderSame(int orderSame) {
		OrderSame = orderSame;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	// Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
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

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
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

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", restaurantId=" + restaurantId + ", menuId="
				+ menuId + ", quantity=" + quantity + ", totalAmount=" + totalAmount + ", payment=" + payment
				+ ", dateTime=" + dateTime + ", status=" + status + ", address=" + address + ", OrderSame=" + OrderSame
				+ "]";
	}

	

   
}
