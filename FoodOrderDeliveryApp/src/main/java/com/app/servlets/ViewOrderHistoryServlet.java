package com.app.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.UserDao.User;
import com.app.order.Order;
import com.app.order.OrderDAOImpl;
import com.app.orderHistory.OrderHistory;
import com.app.orderHistory.OrderHistoryDAOImpl;

/**
 * Servlet implementation class ViewOrderHistoryServlet
 */
@WebServlet("/ViewOrderHistoryServlet")
public class ViewOrderHistoryServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
		   HttpSession session = req.getSession();
	       User user = (User) session.getAttribute("user");
	       
	       List<Order> order =  new ArrayList<>();
	       OrderDAOImpl oDAOImpl = new OrderDAOImpl();
	      
	        System.out.println(user.getId());
	       OrderHistoryDAOImpl oHD = new OrderHistoryDAOImpl();
	       System.out.println(user.getId());
	       
	       
	         List<OrderHistory> orderHistoryList = oHD.fetchOrderHisId(user.getId());
	         
	         for(OrderHistory oh : orderHistoryList ) {
	        	 System.out.println(oh);
	        	 //order.addAll(oDAOImpl.getOrders(oh.getOrderId()));
	        	 order.addAll(oDAOImpl.getOrders(oh.getUserId()));
	        	 System.out.println("View History Updates");
	         }
	         
	         for(Order or : order) {
	        	 System.out.println("----"+or);
	         }
	         
	         req.getSession().setAttribute("order", order);
	         resp.sendRedirect("VieworderHistory.jsp");
            
		
	}
}