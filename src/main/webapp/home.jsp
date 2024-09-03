<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Freelance Platform</title>
   
</head>
<style>

/* Resetting default margin and padding */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Basic styling for the header */
/* Basic styling for the header */
.site-header {
    background-color: #ffffff; /* Change to your desired background color */
    padding: 20px 0; /* Adjust padding as needed */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add a subtle shadow for depth */
}

.container {
    max-width: 1200px; /* Adjust max-width as needed */
    margin: 0 auto; /* Center align the content */
    padding: 0 20px; /* Add padding to the sides */
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header-logo img {
    max-height: 40px; /* Adjust logo size as needed */
}

.main-navigation ul {
    list-style-type: none;
}

.main-navigation ul li {
    display: inline-block;
    margin-left: 20px; /* Adjust spacing between navigation items */
    pos/* Basic styling for the header */
.site-header {
    background-color: #ffffff;
    padding: 20px 0;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
}
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header-logo img {
    max-height: 40px;
}

.main-navigation ul {
    list-style-type: none;
}

.main-navigation ul li {
    display: inline-block;
    margin-left: 20px;
    position: relative;
}

.main-navigation ul li:first-child {
    margin-left: 0;
}

.main-navigation ul li a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
    font-size: 16px;
    display: block;
    padding: 10px;
}

.main-navigation ul li a:hover {
    color: #007bff;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
    background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

/* Styles for the hero section */
/* Styles for the hero section */
.hero-section {
    background-image: url('hero-background.jpg'); /* Replace 'hero-background.jpg' with your image */
    background-size: cover;
    background-position: center;
    padding: 100px 0; /* Adjust padding as needed */
    text-align: center;
}

.hero-section .container {
    max-width: 800px;
    margin: 0 auto;
}

.hero-section h1,
.hero-section p {
    color: #000000; /* Text color on top of the background image */
}

.hero-section h1 {
    font-size: 36px; /* Adjust font size as needed */
    margin-bottom: 20px;
}

.hero-section p {
    font-size: 18px; /* Adjust font size as needed */
    margin-bottom: 30px;
}

.hero-section .btn {
    display: inline-block;
    background-color: #007bff; /* Button background color */
    color: #fff; /* Button text color */
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.hero-section .btn:hover {
    background-color: #0056b3; /* Button background color on hover */
}

/* Styles for the features section */
/* Styles for the How It Works section */
.how-it-works-section {
    background-color: #f9f9f9; /* Background color for the section */
    padding: 80px 0; /* Adjust padding as needed */
    text-align: center;
    color: #000000; /* Set text color to black */
}

.how-it-works-section .container {
    max-width: 800px; /* Adjust the maximum width */
    margin: 0 auto;
}

.how-it-works-section h2 {
    font-size: 36px; /* Adjust font size as needed */
    margin-bottom: 40px; /* Spacing between title and steps */
}

.steps-list {
    list-style: none; /* Remove default list styles */
    padding: 0;
}

.steps-list li {
    font-size: 18px; /* Adjust font size as needed */
    margin-bottom: 20px; /* Spacing between steps */
}

/* Styles for the featured projects section */
.featured-projects-section {
    background-color: #f9f9f9; /* Background color */
    padding: 80px 0; /* Adjust padding as needed */
    text-align: center;
    color: #000000; /* Text color */
}

.featured-projects-section .container {
    max-width: 800px; /* Adjust maximum width */
    margin: 0 auto;
}

.featured-projects-section h2 {
    font-size: 36px; /* Adjust font size */
    margin-bottom: 40px; /* Spacing */
}

.project {
    margin-bottom: 40px; /* Spacing between projects */
}

.project h3 {
    font-size: 24px; /* Adjust font size */
    margin-bottom: 10px; /* Spacing */
}

/* Styles for the call to action section */
.call-to-action-section {
    padding: 80px 0; /* Adjust padding as needed */
    text-align: center;
    color: #ffffff; /* Text color */
    background-color: #007bff; /* Background color */
}

.call-to-action-section .container {
    max-width: 800px; /* Adjust maximum width */
    margin: 0 auto;
}

.call-to-action-section h2 {
    font-size: 36px; /* Adjust font size */
    margin-bottom: 20px; /* Spacing */
}

.call-to-action-section p {
    font-size: 18px; /* Adjust font size */
    margin-bottom: 40px; /* Spacing */
}

.cta-buttons {
    margin-bottom: 40px; /* Spacing */
}

.btn {
    display: inline-block;
    background-color: #ffffff; /* Button background color */
    color: #007bff; /* Button text color */
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    margin-right: 10px; /* Spacing between buttons */
}

.btn:hover {
    background-color: #f0f0f0; /* Button background color on hover */
}

.btn-secondary {
    background-color: #007bff; /* Button background color */
    color: #ffffff; /* Button text color */
}

/* Styles for the footer section */
.footer-section {
    background-color: #333333; /* Background color */
    padding: 40px 0; /* Adjust padding as needed */
    color: #ffffff; /* Text color */
    text-align: center;
}

.footer-section .container {
    max-width: 1200px; /* Adjust maximum width */
    margin: 0 auto;
}

.footer-navigation ul {
    list-style: none; /* Remove default list styles */
    padding: 0;
}

.footer-navigation ul li {
    display: inline-block;
    margin-right: 20px; /* Spacing between navigation links */
}

.footer-navigation ul li a {
    color: #ffffff; /* Link color */
    text-decoration: none;
    transition: color 0.3s ease;
}

.footer-navigation ul li a:hover {
    color: #cccccc; /* Link color on hover */
}

.contact-info p {
    margin-bottom: 10px; /* Spacing between contact information */
}

.social-media-links a {
    display: inline-block;
    margin: 0 10px; /* Spacing between social media icons */
    color: #ffffff; /* Icon color */
    font-size: 24px; /* Adjust icon size */
    transition: color 0.3s ease;
}

.social-media-links a:hover {
    color: #cccccc; /* Icon color on hover */
}

</style>
<body>
<header class="site-header">
    <div class="container">
        <div class="header-logo">
            <a href="home.jsp"><img src="images/logo.jpg" alt="Freelance Platform"></a>
        </div>
        <nav class="main-navigation">
            <ul>
                <li><a href="browseProjects.jsp">Browse Projects</a></li>
                <li><a href="Payments.jsp">Orders</a></li>
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
    <%
        // Check for the username cookie
        String username = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                    break;
                }
            }
        }
    %>
    <% if (username != null) { %>
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
    <% } %>
</div>
                    
                </li>
            </ul>
        </nav>
    </div>
</header>


<section class="hero-section">
    <div class="container">
        <div class="hero-content">
            <h1>Welcome to Freelance Platform</h1>
            <p>Find talented freelancers or get hired for your next project</p>
            <a href="#" class="btn">Get Started</a>
        </div>
    </div>
</section>

<section class="features-section">
    <div class="container">
        <h2> Important Features </h2>
        <div class="feature-item">
            <img src="" alt="Secure Payment Icon">
            <h3>Secure Payment Processing</h3>
            <p>Rest assured, your transactions are safeguarded through our robust payment processing system...</p>
        </div>
        <div class="feature-item">
            <img src="" alt="Projects Icon">
            <h3>Wide Range of Projects</h3>
            <p>Explore a diverse array of projects catering to various industries and skill levels...</p>
        </div>
        <div class="feature-item">
            <img src="" alt="Freelancers Icon">
            <h3>Diverse Pool of Freelancers</h3>
            <p>Access a global talent pool comprising skilled professionals from diverse backgrounds...</p>
        </div>
        <div class="feature-item">
            <img src="" alt="Communication Icon">
            <h3>Easy Communication</h3>
            <p>Seamlessly communicate with clients or freelancers through our integrated messaging system...</p>
        </div>
    </div>
</section>

<section class="how-it-works-section">
    <div class="container">
        <h2>How It Works</h2>
        <ol class="steps-list">
            <li>Create an Account</li>
            <li>Post Your Project</li>
            <li>Receive Proposals</li>
            <li>Select a Freelancer</li>
            <li>Complete the Project</li>
        </ol>
    </div>
</section>
<section class="featured-projects-section">
    <div class="container">
        <h2>Featured Projects</h2>
        <div class="project">
            <h3>Project Title 1</h3>
            <p>Brief description of the project. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <p><strong>Budget:</strong> $500 | <strong>Deadline:</strong> June 30, 2024</p>
        </div>
        <div class="project">
            <h3>Project Title 2</h3>
            <p>Brief description of the project. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <p><strong>Budget:</strong> $800 | <strong>Deadline:</strong> July 15, 2024</p>
        </div>
        <div class="project">
            <h3>Project Title 3</h3>
            <p>Brief description of the project. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <p><strong>Budget:</strong> $300 | <strong>Deadline:</strong> August 5, 2024</p>
        </div>
    </div>
</section>

<section class="call-to-action-section">
    <div class="container">
        <h2>Take Action Now!</h2>
        <p>Join our platform today and explore endless opportunities!</p>
        <div class="cta-buttons">
            <a href="#" class="btn">Sign Up</a>
            <a href="#" class="btn btn-secondary">Browse Projects</a>
            <a href="#" class="btn btn-secondary">Post a Project</a>
        </div>
    </div>
</section>



<footer class="footer-section">
    <div class="container">
        <div class="footer-navigation">
            <ul>
                <li><a href="link1.html"></a></li>
                <li><a href="link2.html"></a></li>
                <li><a href="link3.html"></a></li>
            </ul>
        </div>
        <div class="contact-info">
            <p></p>
            <p></p>
        </div>
        <div class="social-media-links">
            <a href="https://facebook.com"></a>
            <a href="https://twitter.com"></a>
            <a href="cdcatalog.xml"></a>
        </div>
    </div>
</footer>


<%-- JavaScript code for logout functionality --%>

<!-- Main content of the homepage goes here -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "footer.xml", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var xmlDoc = xhr.responseXML;
            var footer = document.querySelector('.footer-section');

            // Extract and append navigation links
            var links = xmlDoc.getElementsByTagName('link');
            var navList = footer.querySelector('.footer-navigation ul');
            navList.innerHTML = ''; // Clear existing links
            for (var i = 0; i < links.length; i++) {
                var li = document.createElement('li');
                var a = document.createElement('a');
                a.href = '#'; // Set appropriate href attributes
                a.textContent = links[i].textContent;
                li.appendChild(a);
                navList.appendChild(li);
            }

            // Extract and append contact info
            var email = xmlDoc.getElementsByTagName('email')[0].textContent;
            var phone = xmlDoc.getElementsByTagName('phone')[0].textContent;
            var contactInfo = footer.querySelector('.contact-info');
            contactInfo.innerHTML = `<p>Contact Us: kthejas45@gmail.com${email}</p><p>Phone: 7558006798${phone}</p>`;

            // Extract and append social media links
            var socialLinks = xmlDoc.getElementsByTagName('social')[0].getElementsByTagName('link');
            var socialMediaLinks = footer.querySelector('.social-media-links');
            socialMediaLinks.innerHTML = ''; // Clear existing links
            for (var j = 0; j < socialLinks.length; j++) {
                var a = document.createElement('a');
                a.href = '#'; // Set appropriate href attributes
                a.textContent = socialLinks[j].textContent;
                socialMediaLinks.appendChild(a);
            }
        }
    };
    xhr.send();
});
</script>
</body>
</html>
