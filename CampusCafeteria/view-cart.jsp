<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cafeteria.models.CartItem" %>
<%@ page import="com.cafeteria.models.MenuItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .cart-container {
            margin: 20px;
        }
        .cart-item {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
        }
        .cart-item div {
            margin: 5px 0;
        }
        .cart-item strong {
            font-size: 1.2em;
        }
    </style>
</head>
<body>

<h1>Your Cart</h1>

<%
    // Retrieve the cart from session
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>
        <p>Your cart is empty.</p>
<%
    } else {
        double total = 0.0;
%>
        <div class="cart-container">
            <% 
                for (CartItem cartItem : cart) {
                    MenuItem item = cartItem.getItem();
                    double itemTotal = cartItem.getQuantity() * item.getPrice();
                    total += itemTotal;
            %>
            <div class="cart-item">
                <div><%= item.getName() %></div>
                <div>₹<%= item.getPrice() %> x <%= cartItem.getQuantity() %></div>
                <div><strong>₹<%= itemTotal %></strong></div>
            </div>
            <% 
                }
            %>

            <div style="padding-top: 20px; text-align: center;">
                <h3>Total: Rs.<%= total %></h3>
            </div>
        </div>
<%
    }
%>

<br>
<form action="menu">
    <input type="submit" value="Back to Menu">
</form>
</div>
<div style="text-align: center;">
    <form action="checkout.jsp" method="get">
        <input type="submit" value="Proceed to Checkout">
    </form>
</div>
</body>
</html>
