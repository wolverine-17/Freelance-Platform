<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String searchQuery = request.getParameter("query");
    if (searchQuery != null && !searchQuery.isEmpty()) {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "1234");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM profile WHERE username LIKE ?");
            pstmt.setString(1, "%" + searchQuery + "%");
            ResultSet rs = pstmt.executeQuery();

            // Display search results as cards
            while (rs.next()) {
                String username = rs.getString("username");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String phoneNumber = rs.getString("phone_number");
                String role = rs.getString("role");
                String description = rs.getString("description");
                int coins = rs.getInt("coins");

                out.println("<div class='user-card'>");
                out.println("<h2>" + username + "</h2>");
                out.println("<p>Name: " + firstName + " " + lastName + "</p>");
                out.println("<p>Phone Number: " + phoneNumber + "</p>");
                out.println("<p>Role: " + role + "</p>");
                out.println("<p>Description: " + description + "</p>");
                out.println("<p>Coins: " + coins + "</p>");
                out.println("</div>");
            }

            // Close resources
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        out.println("No search query provided.");
    }
%>
