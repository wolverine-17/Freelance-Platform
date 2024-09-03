<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="data.User" %>


<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/freelance";
    String dbUser = "root";
    String dbPassword = "1234";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    User userObject = null; // Renamed the variable to userObject

    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Create a connection to the database
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // Create a statement
        stmt = conn.createStatement();

        // Retrieve username from session
        String username = (String) session.getAttribute("username");

        // Query to fetch user details
        rs = stmt.executeQuery("SELECT * FROM freelance.profile WHERE username = '" + username + "'");
        if (rs.next()) {
            // Create a User object with fetched details
            userObject = new User(
                rs.getString("username"),
                rs.getString("first_name"),
                rs.getString("last_name"),
                rs.getString("phone_number"),
                rs.getString("role"),
                rs.getString("Description"),
                rs.getInt("Coins")
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    String sessionId = session.getId();

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="styles/profile.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="header-logo">
                <a href="index.html"><img src="logo.png" alt="Freelance Platform"></a>
            </div>
            <nav class="main-navigation">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropbtn">
                            <%-- Display username if logged in --%>
                            <% if (session.getAttribute("username")!= null) { %>
                                <%= session.getAttribute("username") %>
                            <% } else { %>
                                <span>Guest</span>
                            <% } %>
                        </a>
                        <div class="dropdown-content">
                            <%-- Show different options based on login status --%>
                            <% if (session.getAttribute("username")!= null) { %>  
                            <form action="logout" method="post" style="display: inline;">
        <button type="submit" style="background-color: #f44336; /* Red */
                                     border: none;
                                     color: white;
                                     padding: 8px 8px;
                                     text-align: center;
                                     text-decoration: none;
                                     display: inline-block;
                                     font-size: 14px;
                                     margin: 4px 2px;
                                     cursor: pointer;
                                     border-radius: 4px;">Logout</button>
    							</form>
                        <% } else { %>
                            <a href="index.jsp">Login</a>
                            <a href="index.jsp">Register</a>
                        <% } %>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
     
<div class="profile-section">
    <div class="container">
        <div class="profile-image">
            <!-- Profile Image Here -->
        </div>
        <div class="profile-details">
            <h2>Profile Details</h2>
            <% if (userObject != null) { %>
   				 <p>Username: <%= userObject.getUsername() %></p>
    			 <p>First Name: <%= userObject.getFirstName() %></p>
    			 <p>Last Name: <%= userObject.getLastName() %></p>
    			 <p>Coins: <%= userObject.getCoins() %></p>
    			 <p>Phone Number: <%= userObject.getPhoneNumber() %></p>
    					<%-- Display role if available --%>
    			 <% String role = userObject.getRoles(); %>
    			 <% if (role != null && !role.isEmpty()) { %>
        			<p>Role: <%= role %></p>
    				<% } %>
    			<p><%= userObject.getDescription() %></p>
					<% } else { %>
    				<p>No user data available.</p>
					<% } %>
					<p>Session ID: <%= session.getId() %></p>
					<br>
					<button class="edit-profile-button" onclick="editProfile()">Edit Profile</button>
					<%-- JavaScript function to redirect to the editprofile.jsp page --%>
				<%
   					out.println("<script>");
    				out.println("function editProfile() {");
    				out.println("    var username = '" + session.getAttribute("username") + "';"); // Get username from session
    				out.println("    window.location.href = 'updateprofile.jsp?username=' + encodeURIComponent(username);"); // Append username to URL
    				out.println("}");
    				out.println("</script>");
				%>        

			</div> 
        
    </div> 
 		
</div>
    <footer class="footer-section">
        <div class="container">
            <div class="footer-navigation">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Projects</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="contact-info">
                <p>Contact Us: info@example.com</p>
                <p>Phone: 123-456-7890</p>
            </div>
            <div class="social-media-links">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </footer>
</body>
</html>
