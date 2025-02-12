package com.app.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.CartItems.CartItem;

/**
 * Servlet implementation class ClearCart
 */
@WebServlet("/ClearCart")
public class ClearCart extends HttpServlet  {
 
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        cart.clear();

        session.setAttribute("cart", cart);

        resp.sendRedirect("ViewAddToCart.jsp");
        
	}


}
