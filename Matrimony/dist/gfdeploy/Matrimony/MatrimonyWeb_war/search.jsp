<%-- 
    Document   : search
    Created on : Oct 4, 2024, 1:07:55 PM
    Author     : dsihl
--%>

<%@page import="com.matrimony.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the current session user (if available)
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
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

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <!-- css -->
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/search.css">
        <title>Matrinomy Site</title>
    </head>
    <body>
        <header class="site-header">
            <nav>
                <a href="user"><strong>MATRIMONY</strong></a> |
                <a href="javascript:void(0)" class="active-link">Search</a>
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
        </header>
        <main>
            <div class="search-box">
                <h2 style="text-align:center;">Search by Caste</h2>
                <form action="searchresult" method="post"  class="search-caste">
                    <div class="form-field caste">
                        <div class="icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <select id="caste" name="caste" required>
                            <option value="" disabled selected>Select your caste/ethnic group</option>
                            <option value="Zulu">Zulu</option>
                            <option value="Xhosa">Xhosa</option>
                            <option value="Sotho">Sotho</option>
                            <option value="Tswana">Tswana</option>
                            <option value="Ndebele">Ndebele</option>
                            <option value="Venda">Venda</option>
                            <option value="Shona">Shona</option>
                            <option value="Swazi">Swazi</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <button type="submit">
                        Search Caste <i class="fas fa-search"></i>
                    </button>
                </form>
                <h2 style="text-align:center;">Search by Member ID</h2>
                <form action="searchresultid" method="post" class="search-caste">
                    <div class="form-field caste">
                        <div class="icon">
                            <i class="fas fa-id-card"></i>
                        </div>
                        <input type="number" name="member_id" id="member_id" placeholder="Member ID"/>
                    </div>
                    <button type="submit">
                        Search ID <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>
        </main>
    </body>
</html>
