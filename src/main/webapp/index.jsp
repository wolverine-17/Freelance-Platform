<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
 <%
    if(session.getAttribute("name") != null) {
        response.sendRedirect("home.jsp");
    }
%>   
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.http.Cookie" %>


<%
    // Check if the user is already logged in
    if(session.getAttribute("username") != null) {
        // Redirect to home.jsp if user is already logged in
        response.sendRedirect("home.jsp");
    } else {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/freelance";
        String user = "root";
        String dbPassword = "1234";

        // Check if email and password are provided
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create a connection to the MySQL database
                Connection connection = DriverManager.getConnection(url, user, dbPassword);

                // SQL query to check if the email and password exist in the database
                String sql = "SELECT * FROM freelance.users WHERE username = ? AND password = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, password);

                // Execute the query
                ResultSet result = statement.executeQuery();

                // If a matching user is found, create a session and redirect to home.jsp
                if (result.next()) {
                    // Set session attribute for logged-in user
                    session.setAttribute("username", result.getString("username"));
                    		
                    Cookie userCookie = new Cookie("username", result.getString("username"));
                    userCookie.setMaxAge(60 * 60 * 24 * 7); // Set cookie to expire in 7 days
                    response.addCookie(userCookie);
		
                    // Redirect to home.jsp
                    response.sendRedirect("home.jsp");
                    return; // Stop further processing
                } else {
                    // Display login failed message
                    out.println("<p style='color: red;'>Login failed. Please check your credentials.</p>");
                }

                // Close the database connection
                connection.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Display error message
                out.println("<p style='color: red;'>An error occurred. Please try again later.</p>");
            }
        }
    }
%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login and Registration Form</title>
  <!---Custom CSS File--->
  <link rel="stylesheet" type="text/css" href="styles/login.css">
</head>
<body>
	
   <div class="container">
   <h1 class="title">Freelance Platform</h1>
   <input type="checkbox" id="check">
    <div class="login form">
    <header>Login</header>
    <form action="#" method="post"> <!-- Update the action to "#" -->
        <input type="text" placeholder="Enter your username" name="username" value="${requestScope.username}"> <!-- Add name attribute -->
        <input type="password" placeholder="Enter your password" name="password" value="${requestScope.password}"> <!-- Add name attribute -->
        <input type="submit" class="button" value="Login">
        <% 
            // Embedded Java code for displaying login status
            Boolean loginSuccess = (Boolean)request.getAttribute("loginSuccess");
            if (loginSuccess != null) {
                if (loginSuccess) {
                    out.println("<p style='color: green;'>Login successful!</p>");
                } else {
                    out.println("<p style='color: red;'>Login failed.</p>");
                }
            }
        %>
        
    </form>
    <div class="signup">
        <span class="signup">Don't have an account?
        <label for="check">Sign up</label>
        </span>
    </div>
</div>

    <div class="registration form">
      <header>Sign up</header>
      <form action="register" method="POST">
        <input type="text" placeholder="Enter your name" name=username required>  
        <input type="email" placeholder="Enter your email" name=email required>
        <input type="password" placeholder="Create a password" name=password required>
        <input type="submit" class="button" value="Signup" name=signup>
        <% 
            Boolean registrationSuccess = (Boolean)request.getAttribute("registrationSuccess");
            if (registrationSuccess != null) {
                if (registrationSuccess) {
                    out.println("<p style='color: green;'>Registration successful!</p>");
                } else {
                    out.println("<p style='color: red;'>Registration failed.</p>");
                }
            }
        %>
      </form>
      
      <div class="signup">
        <span class="signup">Already have an account?
         <label for="check">Login</label>
        </span>
      </div>
    </div>
  </div>
</body>
</html>