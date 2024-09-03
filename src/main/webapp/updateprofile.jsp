<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="data.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="stylesheet" href="styles/updateprofile.css">
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
     
    <div class="update-profile-section">
        <div class="container">
            <h2>Update Profile</h2>
            <%
                String username = (String) session.getAttribute("username");
                User user = null;

                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/freelance";
                String dbUser = "root";
                String dbPassword = "1234";

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Create a connection to the database
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    // Prepare the select statement to fetch existing user details
                    String selectSQL = "SELECT * FROM profile WHERE username = ?";
                    pstmt = conn.prepareStatement(selectSQL);
                    pstmt.setString(1, username);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        user = new User(
                            rs.getString("username"),
                            rs.getString("first_name"),
                            rs.getString("last_name"),
                            rs.getString("phone_number"),
                            rs.getString("role"),
                            rs.getString("description"),
                            rs.getInt("coins")
                        );
                    }

                    rs.close();
                    pstmt.close();

                    // Check if form has been submitted and update data
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String firstName = request.getParameter("firstName");
                        String lastName = request.getParameter("lastName");
                        String phoneNumber = request.getParameter("phoneNumber");
                        String role = request.getParameter("role");
                        String description = request.getParameter("description");
                        int coins = Integer.parseInt(request.getParameter("coins"));

                        String updateSQL = "UPDATE profile SET first_name = ?, last_name = ?, phone_number = ?, role = ?, description = ?, coins = ? WHERE username = ?";
                        pstmt = conn.prepareStatement(updateSQL);
                        pstmt.setString(1, firstName);
                        pstmt.setString(2, lastName);
                        pstmt.setString(3, phoneNumber);
                        pstmt.setString(4, role);
                        pstmt.setString(5, description);
                        pstmt.setInt(6, coins);
                        pstmt.setString(7, username);

                        int rowsUpdated = pstmt.executeUpdate();

                        if (rowsUpdated > 0) {
                            out.println("<p>Profile updated successfully.</p>");
                        } else {
                            out.println("<p>Error updating profile. Please try again.</p>");
                        }
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    // Close resources
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("<p>Error closing database connection: " + e.getMessage() + "</p>");
                    }
                }
            %>
            <form method="post">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" value="<%= user != null ? user.getFirstName() : "" %>" required><br>
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" value="<%= user != null ? user.getLastName() : "" %>" required><br>
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="<%= user != null ? user.getPhoneNumber() : "" %>"
                user.getPhoneNumber() : "" %>" required><br>
<label for="role">Role:</label>
<input type="text" id="role" name="role" value="<%= user != null ? user.getRoles() : "" %>" required><br>
<label for="description">Description:</label>
<textarea id="description" name="description" required><%= user != null ? user.getDescription() : "" %></textarea><br>
<label for="coins">Coins:</label>
<input type="number" id="coins" name="coins" value="<%= user != null ? user.getCoins() : 0 %>" required><br>
<button type="submit">Submit</button>
</form>
        </div>
    </div>

    <footer class="footer-section">
        <!-- Footer content here -->
    </footer>
</body>
</html>