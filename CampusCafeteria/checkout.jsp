<%@ page import="com.cafeteria.models.CartItem" %>
<%@ page import="com.cafeteria.models.MenuItem" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<html>
<head>
    <title>Checkout</title>
</head>
<body>
    <h2>Your Order Summary</h2>
    <%
        // Retrieve the session and cart items from the session
        HttpSession currentSession = request.getSession(); // Renamed variable to avoid conflict
        List<CartItem> cart = (List<CartItem>) currentSession.getAttribute("cart");

        // If no cart exists or it's empty, display a message and redirect
        if (cart == null || cart.isEmpty()) {
            out.println("<p>Your cart is empty. Please add items to the cart first.</p>");
            response.sendRedirect("menu.jsp");  // Redirect to menu if cart is empty
            return; // Exit the JSP script
        }

        double totalPrice = 0.0;
        // Display the items in the cart
        out.println("<h3>Items in your cart:</h3>");
        out.println("<table border='1'>");
        out.println("<tr><th>Item Name</th><th>Price</th><th>Quantity</th><th>Total</th></tr>");
        
        for (CartItem item : cart) {
            MenuItem menuItem = item.getItem(); // Accessing MenuItem via the getter method
            double price = menuItem.getPrice(); // Get the price of the MenuItem
            int quantity = item.getQuantity(); // Get the quantity of the item
            double totalItemPrice = price * quantity; // Calculate total price for this item
            totalPrice += totalItemPrice; // Add item total price to overall total

            out.println("<tr>");
            out.println("<td>" + menuItem.getName() + "</td>");
            out.println("<td>" + price + "</td>");
            out.println("<td>" + quantity + "</td>");
            out.println("<td>" + totalItemPrice + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        out.println("<h3>Total Price: " + totalPrice + "</h3>");
    %>

    <form action="orderConfirmation.jsp" method="POST">
        <input type="submit" value="Place Order">
    </form>
</body>
</html>
