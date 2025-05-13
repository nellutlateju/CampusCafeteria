<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Invalidate the session to log the user out
    session.invalidate();
    
    // Redirect to the home or login page
    response.sendRedirect("index.jsp");  // Change this to your desired page
%>
