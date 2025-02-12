package com.app.MenuDAO;

public class Menu  {
    private int menuId;
    private int restaurantId;
    private String menuName;
    private String description;
    private float price;
    private int rating;
    private boolean isAvailable;
    private String imageUrl;
    

    public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	

	public Menu(int restaurantId, String menuName, String description, float price, int rating, boolean isAvailable,
			String imageUrl) {
		super();
		this.restaurantId = restaurantId;
		this.menuName = menuName;
		this.description = description;
		this.price = price;
		this.rating = rating;
		this.isAvailable = isAvailable;
		this.imageUrl = imageUrl;
	}

	public Menu(int menuId, int restaurantId, String menuName, String description, float price, int rating,
			boolean isAvailable, String imageUrl) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.menuName = menuName;
		this.description = description;
		this.price = price;
		this.rating = rating;
		this.isAvailable = isAvailable;
		this.imageUrl = imageUrl;
	}

	// Constructors
    public Menu() {
        super();
    }

    public Menu(int menuId, int restaurantId, String menuName, String description, float price, int rating, boolean isAvailable) {
        super();
        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.menuName = menuName;
        this.description = description;
        this.price = price;
        this.rating = rating;
        this.isAvailable = isAvailable;
    }

    public Menu(int restaurantId, String menuName, String description, float price, int rating, boolean isAvailable) {
        super();
        this.restaurantId = restaurantId;
        this.menuName = menuName;
        this.description = description;
        this.price = price;
        this.rating = rating;
        this.isAvailable = isAvailable;
    }

    // Getters and Setters
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    @Override
    public String toString() {
        return "Menu [menuId=" + menuId + ", restaurantId=" + restaurantId + ", menuName=" + menuName + ", description=" + description
                + ", price=" + price + ", rating=" + rating + ", isAvailable=" + isAvailable + "]";
    }
}

