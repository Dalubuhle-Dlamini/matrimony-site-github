<%-- 
    Document   : update-photo
    Created on : Oct 5, 2024, 10:43:46 AM
    Author     : dsihle875@gmail.com
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
                        <div><img src="./assets/images/logo/logo-bg.png" height="100px" alt="logo"></div>
                    </div>
                    <h2>Matri<span class="highlight">mony</span></h2>
                    <h3>Add Profile Photo</h3>
                </div>
                <form class="form" action="updatephoto" method="POST" enctype="multipart/form-data">
                    <div class="form-field photo">
                        <div class="icon">
                            <i class="far fa-user"></i>
                        </div>
                        <input type="file" id="photo" name="photo">
                    </div>


                    <button type="submit">
                        Update Profile Photo
                    </button>
                </form>
            </div>
        </div>
    </body>

</html>
