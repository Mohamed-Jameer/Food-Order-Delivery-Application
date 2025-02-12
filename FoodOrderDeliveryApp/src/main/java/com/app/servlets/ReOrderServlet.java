package com.app.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
import com.app.orderHistory.OrderHistory;
import com.app.orderHistory.OrderHistoryDAOImpl;
import com.app.orderItems.OrderItems;
import com.app.orderItems.OrderItemsDAOImpl;

/**
 * Servlet implementation class ReOrderServlet
 */
@WebServlet("/ReOrderServlet")
public class ReOrderServlet extends HttpServlet  {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int order_Same = Integer.parseInt(req.getParameter("orderSame"));
		
		HttpSession session = req.getSession();
	       User user = (User) session.getAttribute("user");
	       
	       List<Order> order =  new ArrayList<>();
	       OrderDAOImpl oDAOImpl = new OrderDAOImpl();
	       order = oDAOImpl.getOrders(order_Same);
	       
	       int OrderSame = new OrderDAOImpl().fetchLastOrderId();    
	       
	       Timestamp Timestamp=  new Timestamp(System.currentTimeMillis());
	       
	       for (Order o : order) {
               Order orders = new Order(user.getId(),o .getRestaurantId(),o .getMenuId(),o .getQuantity(),o.getTotalAmount(),o.getPayment(),Timestamp,o.getStatus(),o.getAddress(),OrderSame);
               oDAOImpl.insertOrderHistory(orders);

           }
	       
	       
           for (Order o : order) {
           OrderItems orderItems = new OrderItems(OrderSame,o.getMenuId(),o.getQuantity(),o.getTotalAmount(),user.getId(),o.getAddress());
           new OrderItemsDAOImpl().insert(orderItems);
           }
           

           OrderHistoryDAOImpl  orderHistoryDAOImpl = new OrderHistoryDAOImpl();
           
           OrderHistory orderHistory =  orderHistoryDAOImpl.fetchOrderHisOrderId(order_Same);
           
           OrderHistory oh = new OrderHistory(user.getId(),OrderSame,orderHistory.getTotalAmount(),Timestamp,orderHistory.getStatus(),orderHistory.getAddress());
           new OrderHistoryDAOImpl().insert(oh);
           
           
           resp.sendRedirect("ViewOrderHistoryServlet");
	}

}
