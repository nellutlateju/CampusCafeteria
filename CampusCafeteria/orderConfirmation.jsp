<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1 {
            color: green;
        }
        .logout-button {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
        }
        .logout-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

<h1>Thank you for your order!</h1>
<p>Your order has been successfully placed.</p>

<!-- Logout button -->
<a href="logout.jsp" class="logout-button">Logout</a>

</body>
</html>
