package com.app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.orderHistory.OrderHistoryDAOImpl;

/**
 * Servlet implementation class DeleteOrderServelt
 */
@WebServlet("/DeleteOrderServelt")
public class DeleteOrderServelt extends HttpServlet  {
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt( req.getParameter("oid"));
		  
		  OrderHistoryDAOImpl orderHistoryDAOImpl = new OrderHistoryDAOImpl();
		  orderHistoryDAOImpl.deleteHisOrder(id);
		  resp.sendRedirect("DeleteOrder.jsp");
		  
	}

}
