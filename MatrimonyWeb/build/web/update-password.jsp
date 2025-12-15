<%-- 
    Document   : update-password
    Created on : Oct 24, 2024, 2:59:30 PM
    Author     : dsihle875@gmail.com
--%>

<%@page import="com.matrimony.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
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

        <!-- fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <!-- css -->
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/form.css">

        <title>Matrimony</title>
    </head>

    <body>
        <div class="login-card">
            <div class="login-card-content">
                <div class="header">
                    <div class="logo">
                        <div><img src="./assets/images/logo/logo-bg.png"  height="100px" alt="logo"></div>
                    </div>
                    <h2>Matri<span class="highlight">mony</span></h2>
                    <h3>Find you your perfect match</h3>
                </div>
                <form class="form" method="POST" action="update-password">

                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                    <div class="error-message">
                        <p><%= errorMessage%></p>
                    </div>
                    <% }%>
                    <div class="form-field email">
                        <input type="hidden" name="id" value="<%= user.getUser_id() %>">
                        <div class="icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <input type="password" id="old-password" name="old-password" placeholder="Old Password" required>
                    </div>

                    <div class="form-field password">
                        <div class="icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <input type="password" id="new-password" name="new-password" placeholder="New Password">
                    </div>

                    <button type="submit">
                        Update Password
                    </button>
                    <div>
                        Go back home? <a href="user">Home</a>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>