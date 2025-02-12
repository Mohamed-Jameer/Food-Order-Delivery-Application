package com.app.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.CartItems.CartItem;
import com.app.MenuDAO.Menu;
import com.app.MenuDAO.MenuDAOImpl;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet  {

	private RequestDispatcher d;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String priceStr = request.getParameter("price");

        // Use Float or Double to parse the price value
        float price = Float.parseFloat(priceStr);

        // Rest of your code...
        int menuId = Integer.parseInt(request.getParameter("menuId")); // Parsing menuId as integer
        
        String menuName = request.getParameter("menuName"); // You can also pass other details
        
        
        // Create a CartItem object (assuming it stores a float price)
        CartItem cartItem = new CartItem(menuId, menuName, price, 1);
       
        // Add cartItem to the cart (session logic here)
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new TreeMap<>();
        }

         if(cart.containsKey(menuId))   {
        	CartItem item = cart.get(menuId);
        	item.setQuantity(item.getQuantity() + 1);
        	session.setAttribute("cart", cart);
   		 response.sendRedirect("BackMenuServlet");
        	 
        
        }
         else {
        cart.put(menuId, cartItem);
        session.setAttribute("cart", cart);
        response.sendRedirect("BackMenuServlet");
        
         } 
       
    }
	}

