package com.app.MenuDAO;


import java.util.List;

public interface MenuDAO  {
    void insert(Menu m);
    List<Menu> fetchAll();
    Menu fetchSpecificId(int id);
    int deleteByMenuId(int id);
    int updateAvailability(boolean isAvailable, int id);
}
