<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cafeteria.models.MenuItem" %>
<%@ page import="com.cafeteria.models.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .menu-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .menu-item {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 15px;
            width: 220px;
            text-align: center;
            box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
        }
        .menu-item img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .cart-buttons {
            text-align: center;
            margin: 20px;
        }
        .cart-buttons form {
            display: inline;
        }
    </style>
</head>
<body>

<h1 style="text-align: center;">Cafeteria Menu</h1>

<%
    // Retrieve the menu items from the request (they should be passed by the servlet)
    List<MenuItem> menuItems = (List<MenuItem>) request.getAttribute("menuItems");
    String message = request.getParameter("message"); // Get the success message if available
    if (message != null) {
%>
    <div style="text-align: center; color: green;">
        <strong><%= message %></strong>
    </div>
<%
    }

    if (menuItems == null || menuItems.isEmpty()) {
%>
    <p>No menu items available.</p>
<%
    } else {
%>
    <div class="menu-container">
        <% 
            // Loop through the menu items and display them
            for (MenuItem item : menuItems) {
        %>
            <div class="menu-item">
                <h3><%= item.getName() %></h3>
                <p><%= item.getDescription() %></p>
                <p><strong>Rs.<%= item.getPrice() %></strong></p>
                <form action="addtocart" method="post">
                    <input type="hidden" name="itemId" value="<%= item.getId() %>">
                    <input type="number" name="quantity" value="1" min="1" style="width: 50px;">
                    <br><br>
                    <input type="submit" value="Add to Cart">
                </form>
            </div>
        <% 
            }
        %>
    </div>
<%
    }
%>

<div class="cart-buttons">
    <form action="view-cart.jsp" method="get">
        <input type="submit" value="View Cart">
    </form>
</div>

</body>
</html>
