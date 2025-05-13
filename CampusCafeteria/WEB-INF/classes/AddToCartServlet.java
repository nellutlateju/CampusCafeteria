package com.cafeteria.servlets;

import com.cafeteria.models.CartItem;
import com.cafeteria.models.MenuItem;
import com.cafeteria.dao.MenuDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Fetch the MenuItem from the database using MenuDAO
        MenuItem item = MenuDAO.getMenuItemById(itemId);

        // If item is not found, return an error message or redirect
        if (item == null) {
            response.sendRedirect("menu?error=Item%20not%20found");
            return;
        }

        // Get or create the cart in the session
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Check if the item already exists in the cart and update quantity if found
        boolean itemFound = false;
        for (CartItem cartItem : cart) {
            if (cartItem.getItem().getId() == itemId) {
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                itemFound = true;
                break;
            }
        }

        // If item is not found in the cart, add new item
        if (!itemFound) {
            CartItem cartItem = new CartItem(item, quantity);
            cart.add(cartItem);
        }

        // Save the updated cart back into the session
        session.setAttribute("cart", cart);

        // Redirect back to the menu page with a success message
        response.sendRedirect("menu?message=Item%20added%20to%20cart");
    }
}
