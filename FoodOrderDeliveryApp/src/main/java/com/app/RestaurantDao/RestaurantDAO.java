package com.app.RestaurantDao;


import java.util.List;


public interface RestaurantDAO  {
    void insert(Restaurant r);
    List<Restaurant> fetchAll();
    Restaurant fetchSpecificId(int id);
    int deleteByRestId(int id);
    int updateActiveStatus(boolean isActive, int id);
    void updateRestaurant(Restaurant r);
}
