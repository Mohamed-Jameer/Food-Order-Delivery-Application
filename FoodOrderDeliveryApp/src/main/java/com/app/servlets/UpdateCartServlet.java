package com.app.servlets;

import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.CartItems.CartItem;


@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet  {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int menuId = Integer.parseInt(request.getParameter("menuId"));
        String action = request.getParameter("action");
        
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new TreeMap<>(); 
        }

        if ("remove".equals(action)) {
            cart.remove(menuId);
        }
        else if ("clear".equals(action)) {
            cart.clear();
        }else {
            CartItem item = cart.get(menuId);
            if (item == null) {
                String menuName = request.getParameter("menuName"); 
                int price = Integer.parseInt(request.getParameter("price")); 
                item = new CartItem(menuId, menuName, price, 1);
                cart.put(menuId, item);
            } else {
              
                if ("increase".equals(action)) {
                    item.setQuantity(item.getQuantity() + 1);
                } else if ("decrease".equals(action) && item.getQuantity() > 1) {
                    item.setQuantity(item.getQuantity() - 1);
                }
            }
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("ViewAddToCart.jsp");
    }
}
