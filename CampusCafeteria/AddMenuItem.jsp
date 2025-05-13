<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Menu Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        form {
            width: 300px;
            margin: auto;
        }
        input, textarea {
            width: 100%;
            margin: 8px 0;
            padding: 8px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Add New Menu Item</h2>
    <form action="AddMenuItemServlet" method="post">
        <label for="name">Item Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="3" required></textarea>

        <label for="price">Price (₹):</label>
        <input type="number" step="0.01" id="price" name="price" required>

        <label for="imagePath">Image Path (optional):</label>
        <input type="text" id="imagePath" name="imagePath" placeholder="images/item.jpg">

        <input type="submit" value="Add Item">
    </form>
</body>
</html>
