package com.freelance.register;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.sql.ResultSet;

/**
 * Servlet implementation class Registerervlet
 */

import jakarta.servlet.http.Cookie;

@WebServlet("/register")
public class register extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieving form parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/freelance";
        String user = "root";
        String dbPassword = "1234";

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("registrationSuccess", false);
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, user, dbPassword);

                // Check if the username already exists
                PreparedStatement checkStmt = conn.prepareStatement("SELECT COUNT(*) FROM freelance.users WHERE username = ?");
                checkStmt.setString(1, username);
                ResultSet resultSet = checkStmt.executeQuery();
                resultSet.next();
                int count = resultSet.getInt(1);
                checkStmt.close();

                if (count > 0) {
                    // Username already exists, send response false
                    request.setAttribute("registrationSuccess", false);
                } else {
                    // Username doesn't exist, proceed with registration
                    PreparedStatement stmt = conn.prepareStatement("INSERT INTO freelance.users (username, email, password) VALUES (?, ?, ?)");
                    stmt.setString(1, username);
                    stmt.setString(2, email);
                    stmt.setString(3, password);

                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        // Registration successful, now insert default profile values
                        PreparedStatement profileStmt = conn.prepareStatement("INSERT INTO profile (username, first_name, last_name, phone_number, description, coins, role) VALUES (?, ?, ?, ?, ?, ?, ?)");
                        profileStmt.setString(1, username);
                        profileStmt.setString(2, "NotEntered");
                        profileStmt.setString(3, "NotEntered");
                        profileStmt.setString(4, "NotEntered");
                        profileStmt.setString(5, "Default Description"); // Assuming a default description value
                        profileStmt.setInt(6, 100); // Assuming a default value of 100 for coins
                        profileStmt.setString(7, "NotEntered");

                        int profileRowsAffected = profileStmt.executeUpdate();
                        if (profileRowsAffected > 0) {
                            request.setAttribute("registrationSuccess", true);
                            
                            // Create cookies for email, username, password, and login date
                            Cookie emailCookie = new Cookie("email", email);
                            Cookie usernameCookie = new Cookie("username", username);
                            Cookie passwordCookie = new Cookie("password", password);
                            Cookie loginDateCookie = new Cookie("loginDate", LocalDate.now().toString());

                            // Set cookie expiration time (in seconds), e.g., 30 days
                            int cookieExpirationTime = 30 * 24 * 60 * 60;
                            emailCookie.setMaxAge(cookieExpirationTime);
                            usernameCookie.setMaxAge(cookieExpirationTime);
                            passwordCookie.setMaxAge(cookieExpirationTime);
                            loginDateCookie.setMaxAge(cookieExpirationTime);

                            // Add cookies to the response
                            response.addCookie(emailCookie);
                            response.addCookie(usernameCookie);
                            response.addCookie(passwordCookie);
                            response.addCookie(loginDateCookie);
                        } else {
                            request.setAttribute("registrationSuccess", false);
                        }

                        profileStmt.close();
                    } else {
                        request.setAttribute("registrationSuccess", false);
                    }
                    stmt.close();
                }

                conn.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("registrationSuccess", false);
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
