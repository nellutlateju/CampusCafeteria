<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Campus Cafeteria</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header>
        <h1>Login</h1>
    </header>
    <div class="container">
        <form action="LoginServlet" method="post">
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br><br>
            
            <label for="role">Role:</label><br>
            <select id="role" name="role">
                <option value="customer">Customer</option>
                <option value="admin">Admin</option>
            </select><br><br>
            
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Register here</a>.</p>
    </div>
</body>
</html>
