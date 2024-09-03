<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Search</title>
    <link rel="stylesheet" href="styles/searchuser.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <header class="site-header">
    <div class="container">
        <div class="header-logo">
            <a href="home.jsp"><img src="/Freelance/images/logo.jpg" alt="Freelance Platform"></a>
        </div>
        <nav class="main-navigation">
            <ul>
                <li><a href="browseProjects.jsp">Browse Projects</a></li>
                <li><a href="#">Orders</a></li>
                <li><a href="#">Switch To Selling</a></li>
                <li><a href="searchuser.jsp">Search Users</a></li>
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
                            <a href="profile.jsp">Profile</a>
                            <form action="logout" method="post" style="display: inline;">
        <button type="submit" style="background-color: #f44336; /* Red */
                                     border: none;
                                     color: white;
                                     padding: 8px 16px;
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


    <div class="search-section">
        <div class="container">
            <input type="text" id="searchQuery" placeholder="Enter username">
            <button id="searchButton">Search</button>
        </div>
    </div>

    <div id="searchResults" class="container"></div>

    <script>
        $(document).ready(function() {
            $("#searchButton").click(function() {
                var searchQuery = $("#searchQuery").val().trim();
                if (searchQuery !== "") {
                    $.ajax({
                        url: "fetchUsers.jsp", // Server-side script URL
                        type: "GET",
                        data: { query: searchQuery },
                        success: function(response) {
                            $("#searchResults").html(response);
                        },
                        error: function(xhr, status, error) {
                            console.error("AJAX Error: " + status + " - " + error);
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
