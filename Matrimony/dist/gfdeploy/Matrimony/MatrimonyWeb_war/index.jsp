<%-- 
    Document   : index
    Created on : Oct 3, 2024, 6:20:23 PM
    Author     : dsihle875@gmail.com
--%>

<%@page import="com.matrimony.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        // Get the current session user (if available)
        User user = (User) session.getAttribute("user");
    %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta name="description"
              content="Find your perfect match on  Matrimony - the leading matrimony site for genuine connections." />
        <meta name="author" content=" Projects" />
        <meta name="keywords"
              content=" Matrimony, marriage, life partner, matrimony site, find a match, wedding, matchmaking" />
        <meta name="theme-color" content="#ff4081" />

        <!-- Open Graph (for Facebook, LinkedIn) -->
        <meta property="og:title" content=" Matrimony - Find Your Perfect Match" />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="https://www.matrimony.com" />
        <meta property="og:image" content="https://www.matrimony.com/images/logo/Logo.png" />
        <meta property="og:description"
              content=" Matrimony is your trusted platform to connect with your ideal life partner. Join today to find your match." />
        <meta property="og:locale" content="en_US" />

        <!-- Twitter Cards -->
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content=" Matrimony - Your Trusted Matchmaking Platform" />
        <meta name="twitter:description"
              content="Find your life partner on  Matrimony - where real connections are made." />
        <meta name="twitter:image" content="https://www.matrimony.com/images/logo/Logo.png" />
        <meta name="twitter:site" content="@Matrimony" />

        <!-- css -->
        <link rel="stylesheet" href="./assets/css/style.css">
        <title>Matrinomy Site</title>
    </head>

    <body>
        <div class="wrapper">
            <header class="site-header">
                <nav>
                    <a href="javascript:void(0)" class="active-link"><strong>MATRIMONY</strong></a> |
                    <a href="search">Search</a>
                    <a href="about">About Us</a>
                    <a href="browse">Looking For</a>
                    <a href="services">Services</a>
                    <a href="contact">Contact Us</a>
                </nav>

                <div class="nav-btn">
                    <% if (user == null) { %>
                    <!-- If user is NOT logged in -->
                    <p><a href="login.jsp" class="login-btn">Have an account?</a></p>
                    <p><a href="register.jsp" class="signup-btn">Sign up</a></p>
                    <% } else { %>
                    <!-- If user is logged in -->
                    <p><a href="user.jsp" class="login-btn">View Profile?</a></p>
                    <p><a href="logout" class="signup-btn">Logout</a></p>
                    <% }%>
                </div>
                
                <div class="mobile-menu-icon" onclick="toggleMobileMenu()">☰</div>
            </header>

            <main>
                <!-- home section -->
                <section class="home-page">
                    <div class="block">
                        <% if (user == null) { %>
                        <!-- If user is NOT logged in -->
                        <h1>Welcome to Our Matrimony Site.</h1>
                        <p class="intro">We are dedicated to helping individuals find their perfect life partner. Our platform offers a user-friendly experience that prioritizes inclusivity and accessibility for all users.</p>
                        <p>Join us to explore profiles, connect with potential matches, and embark on your journey towards love and companionship.</p>
                        <a href="register.jsp" class="button">Get Started Now</a>
                        <% } else {%>
                        <!-- If user is logged in -->
                        <h1>Welcome back, <%= user.getFirstname()%> <%= user.getLastname()%></h1>
                        <p class="intro">Start searching for your match or edit your profile.</p>
                        <a href="search.jsp" class="button">Search for other users</a>
                        <% }%>
                    </div>
                    <div class="block">
                        <img src="./assets/images/banner.png" alt="A Heart">
                    </div>
                </section>
                


            </main>

            <footer>
                <small>All content &copy; Matrimony Site. All rights reserved.</small>
            </footer>
        </div>
    </body>

</html>
