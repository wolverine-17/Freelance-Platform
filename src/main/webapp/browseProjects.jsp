<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="styles/browseproject.css">
</head>
<body>
<header class="site-header">
        <div class="container">
            <div class="header-logo">
                
            </div>
            <nav class="main-navigation">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="#">Switch To Selling</a></li>
                    <li><a href="#">How It Works</a></li>
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
    
 <div class="container">
    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search...">
        <button onclick="search()">Search</button>
    </div>
    <!-- Trigger/Open The Modal -->
<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Filter</button>

<!-- The Modal -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Filter Projects</h2>
        <form id="filterForm">
            <label for="category">Category:</label>
            <select id="category" name="category">
                <option value="All">All</option>
                <option value="Web">Web</option>
                <option value="Software">Software</option>
            </select>
            <br>
            <label for="sort">Sort by:</label>
            <select id="sort" name="sort">
                <option value="A-Z">A-Z</option>
                <option value="Date">Date</option>
            </select>
            <br>
            <button type="button" onclick="applyFilter()">Apply Filter</button>
        </form>
    </div>
</div>
    <div class="card-container">
        <%-- JDBC Connection and Data Retrieval --%>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "1234");
                String sql = "SELECT * FROM project";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                int count = 0; // Counter for tracking cards
                while(rs.next()) {
                    // Open a new row container for every two cards
                    if (count % 2 == 0) { %>
                        <div class="row">
                    <% }
        %>
            <div class="card">
                <h2><%= rs.getString("Title") %></h2>
                <p><strong>Username:</strong> <%= rs.getString("username") %></p>
                <p><strong>Email:</strong> <%= rs.getString("email") %></p>
                <p><strong>Description:</strong> <%= rs.getString("description") %></p>
                <p><strong>Coins:</strong> <%= rs.getInt("coins") %></p>
                <p><strong>Date:</strong> <%= rs.getDate("date") %></p>
                <button class="buy-btn">BUY</button>
            </div>
        <% 
                    // Close the row container for every two cards
                    if ((count + 1) % 2 == 0) { %>
                        </div>
                    <% }
                    count++;
                }
                // If the last row only contains one card, close the row container
                if (count % 2 != 0) { %>
                    </div>
                <% }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if(rs != null) rs.close();
                    if(pstmt != null) pstmt.close();
                    if(conn != null) conn.close();
                } catch(SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>
    </div>

<script>
    // Add JavaScript functionality here
    function search() {
        var input, filter, cards, card, title, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        cards = document.getElementsByClassName("card");
        for (i = 0; i < cards.length; i++) {
            card = cards[i];
            title = card.getElementsByTagName("h2")[0];
            txtValue = title.textContent || title.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                card.style.display = "";
            } else {
                card.style.display = "none";
            }
        }
    }
    
    function applyFilter() {
        var category = document.getElementById("category").value;
        var sort = document.getElementById("sort").value;
        var cards = document.getElementsByClassName("card");
        var cardContainer = document.getElementsByClassName("card-container")[0];

        // Filter cards by category
        Array.from(cards).forEach(function(card) {
            var cardCategory = card.getAttribute("data-category");
            if (category === "All" || cardCategory === category) {
                card.style.display = "";
            } else {
                card.style.display = "none";
            }
        });

        // Sort visible cards
        var visibleCards = Array.from(cards).filter(function(card) {
            return card.style.display !== "none";
        });

        if (sort === "A-Z") {
            visibleCards.sort(function(a, b) {
                var titleA = a.getElementsByTagName("h2")[0].textContent.toUpperCase();
                var titleB = b.getElementsByTagName("h2")[0].textContent.toUpperCase();
                return titleA.localeCompare(titleB);
            });
        } else if (sort === "Date") {
            visibleCards.sort(function(a, b) {
                var dateA = new Date(a.getAttribute("data-date"));
                var dateB = new Date(b.getAttribute("data-date"));
                return dateA - dateB;
            });
        }

        // Re-append sorted cards to the container
        visibleCards.forEach(function(card) {
            cardContainer.appendChild(card);
        });

        // Close the modal
        document.getElementById("myModal").style.display = "none";
    }
    
    
    
 // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>    