<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        a {
            text-decoration: none;
            color: #007BFF;
            font-size: 18px;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Welcome Admin!</h1>
    <p>This is the admin dashboard where you can manage various aspects of the cafeteria system.</p>

    <!-- Example Admin Functionalities -->
    <ul>
        <li><a href="AddMenuItem.jsp">Add Menu Item</a></li>
    </ul>
    <a href="logout.jsp" class="logout-button">Logout</a>

</body>
</html>
