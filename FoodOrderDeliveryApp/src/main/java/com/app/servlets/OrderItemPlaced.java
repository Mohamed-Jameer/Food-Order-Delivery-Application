package com.app.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.CartItems.CartItem;
import com.app.MenuDAO.Menu;
import com.app.MenuDAO.MenuDAOImpl;
import com.app.UserDao.User;
import com.app.order.Order;
import com.app.order.OrderDAOImpl;
import com.app.orderItems.OrderItems;
import com.app.orderItems.OrderItemsDAOImpl;

/**
 * Servlet implementation class OrderItemPlaced
 */
@WebServlet("/OrderItemPlaced")
public class OrderItemPlaced extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get session and user info
		System.out.println("Hello");
		
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        String paymentMethod = request.getParameter("paymentMethod");
        String deliveryAddress = request.getParameter("DeliveryAddress");
        float totalAmount = 0;
        String status = paymentMethod.equals("COD")?  "Pending": "Order Placed" ;
        
        Timestamp Timestamp=  new Timestamp(System.currentTimeMillis());
        OrderDAOImpl orderDAOI = new OrderDAOImpl();
        
        // Calculate total amount of the order
        for (CartItem item : cart.values()) {
            totalAmount += item.getPrice() * item.getQuantity();
        }

            for (CartItem item : cart.values()) {
            	Menu menu =  new MenuDAOImpl().fetchSpecificId(item.getMenuId());
                Order orders = new Order(user.getId(),menu.getRestaurantId(),item.getMenuId(),item.getQuantity(),item.getPrice(),paymentMethod,Timestamp,status,deliveryAddress);
                orderDAOI.insertOrderHistory(orders);
                
               Order order = orderDAOI.fetchOrdersByUserId(user.getId());
                OrderItems orderItems = new OrderItems(order.getOrderId(),item.getMenuId(),item.getQuantity(),item.getPrice(),user.getId(),deliveryAddress);
                new OrderItemsDAOImpl().insert(orderItems);
      
            }
            
            response.sendRedirect("ShowRestaurant");

	}


}
