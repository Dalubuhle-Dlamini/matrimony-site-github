<%-- 
    Document   : view-user
    Created on : Oct 9, 2024, 11:32:20 AM
    Author     : dsihle875@gmail.com
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.matrimony.models.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
User loggedInUser = (User) session.getAttribute("user");
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
        <link rel="stylesheet" href="./assets/css/user.css">

        <!-- test -->
        <script src="assets/js/calculateAge.js"></script>
        <title>Matrinomy Site</title>
    </head>

    <body>
        <div class="wrapper">
            <header class="site-header">
                <nav>
                    <a href="user" class="active-link"><strong>MATRIMONY</strong></a> |
                    <a href="search">Search</a>
                    <a href="about">About Us</a>
                    <a href="browse">Looking for</a>
                    <a href="services">Services</a>
                    <a href="contact">Contact Us</a>
                </nav>

                <div class="nav-btn">
                    <% if (loggedInUser == null) { %>
                    <!-- If user is NOT logged in -->
                    <p><a href="login.jsp" class="login-btn">Have an account?</a></p>
                    <p><a href="register.jsp" class="signup-btn">Sign up</a></p>
                    <% } else { %>
                    <!-- If user is logged in -->
                    <p><a href="user.jsp" class="login-btn">View Profile?</a></p>
                    <p><a href="logout.jsp" class="signup-btn">Logout</a></p>
                    <% }%>
                </div>
            </header>

            <main>

                <%
                    User user = (User) request.getAttribute("user");
                    if (user != null) {
                %>

                <section class="home-page" style="height: 70vh">
                    <div class="block">
                        <!-- profile card start -->
                        <div class="layout">
                            <div class="profile">
                                <div class="profile__picture">

                                    <%
                                        byte[] photoBytes = user.getPhoto();
                                        String base64Image = Base64.getEncoder().encodeToString(photoBytes);
                                    %>

                                    <% if (!base64Image.equals("")) {%>
                                    <img src="data:image/png;base64,<%= base64Image%>" alt="Profile Photo">
                                    <% } else { %>
                                    <img src="./assets/images/profile.png" alt="user profile photo">
                                    <% }%>

                                </div>
                                <div class="profile__header">
                                    <div class="profile__account">
                                        <h4 class="profile__username"><%= user.getFirstname()%></h4>
                                    </div>

                                    <div class="profile__edit">
                                    </div>
                                </div>
                                <div class="profile__stats">

                                    <div class="profile__stat">
                                        <div class="profile__icon profile__icon--gold">
                                            <i class="fas fa-eye"></i>
                                        </div>

                                        <div class="profile__value"><%= user.getViews()%></div>
                                        <div class="profile__key">Views</div>
                                    </div>

                                    <div class="profile__stat">
                                        <div class="profile__icon profile__icon--blue">
                                            <i class="fas fa-signal"></i>
                                        </div>

                                        <div class="profile__value">1</div>
                                        <div class="profile__key">Ranking</div>
                                    </div>

                                    <div class="profile__stat">
                                        <div class="profile__icon profile__icon--pink">
                                            <i class="fas fa-heart"></i>
                                        </div>

                                        <div class="profile__value"><%= user.getLikes()%></div>
                                        <div class="profile__key">Likes</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- profile card end -->
                    </div>
                    <div class="block">
                        <div class="profile-details">
                            <h5 class="profile-details__heading">Profile Details</h5>
                            <p class="profile-details__bio">
                                My name is <%= user.getFirstname()%> my lastname is <%= user.getLastname()%>, I speak <%= user.getMother_tongue()%> 
                                my religion is <%= user.getReligion()%> that is <%= user.getCaste()%> born <%= user.getDate_of_birth().toString()%>
                            </p>
                            <div class="profile-details__info">
                                <div class="profile-details__item">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <strong>Location: </strong> <%= user.getCountry()%>
                                </div>
                                <div class="profile-details__item">
                                    <i class="fas fa-envelope"></i>
                                    <strong>Email: </strong> <a href="mailto:<%= user.getEmail()%>"><%= user.getEmail()%></a>
                                </div>
                                <div class="profile-details__item">
                                    <i class="fas fa-phone"></i>
                                    <strong>Phone Numbers: </strong> <a href="tel:+<%= user.getContact_number()%>"><%= user.getContact_number()%></a>
                                </div>
                                <div class="profile-details__item">
                                    <i class="fas fa-calendar-alt"></i>
                                        <strong>Joined: </strong> <%= user.getCreatedAt().toString()%>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </section>
                                <section class="home-page" style="margin-top: -200px">

                    <div class="profile-details">
                        <% if (user.getAboutSelf() != null || user.getAboutSelf() == "") {%>
                        <div class="profile-details__item">
                            <i class="fas fa-user"></i>
                            <strong>Details: &nbsp; </strong> <%= user.getAboutSelf()%>
                        </div>
                        <%} else {%> 
                        <div class="profile-details__item">
                            <i class="fas fa-user"></i>
                            <strong>Details: &nbsp; </strong> No Details
                        </div>
                        <% }%>

                        <% if (user.getFamilyDetails() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-user"></i>
                            <strong>Family Details: &nbsp; </strong> <%= user.getFamilyDetails()%>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-user"></i>
                            <strong>Family Details: &nbsp; </strong> No Details
                        </div>
                        <%}%>
                        
                        <% if (user.getQualification() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-graduation-cap"></i>
                            <strong>Qualification: &nbsp; </strong> <%= user.getQualification()%>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-user"></i>
                            <strong>Qualification: &nbsp; </strong> No Details
                        </div>
                        <%}%>

                        <% if (user.getWorkingAt() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-building"></i>
                            <strong>Job: &nbsp; </strong> <%= user.getWorkingAt() %>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-building"></i>
                            <strong>Job: &nbsp; </strong> Not Working yet
                        </div>
                        <%}%>
                        

                        <% if (user.getDesignation() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-user-tie"></i>
                            <strong>Designation: &nbsp; </strong> <%= user.getDesignation() %>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-user-tie"></i>
                            <strong>Designation: &nbsp; </strong> No designations
                        </div>
                        <%}%>
                        
                        <% if (user.getHobbies() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-palette"></i>
                            <strong>Hobbies: &nbsp; </strong> <%= user.getHobbies()%>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-palette"></i>
                            <strong>Hobbies: &nbsp; </strong> No hobbies
                        </div>
                        <%}%>
                        
                        <% if (user.getFavouriteGenre() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-music"></i>
                            <strong>Favourite Genre: &nbsp; </strong> <%= user.getFavouriteGenre() %>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-music"></i>
                            <strong>Favourite Genre: &nbsp; </strong> No Favourite Genre
                        </div>
                        <%}%>
                        
                        <% if (user.getFavouriteMovies() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-film"></i>
                            <strong>Favourite Movies: &nbsp; </strong> <%= user.getFavouriteMovies() %>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-film"></i>
                            <strong>Favourite Movie: &nbsp; </strong> No Favourite Movies
                        </div>
                        <%}%>
                        
                        <% if (user.getFavouriteCuisine() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-utensils"></i>
                            <strong>Favourite Cuisine: &nbsp; </strong> <%= user.getFavouriteCuisine()%>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-utensils"></i>
                            <strong>Favourite Cuisine: &nbsp; </strong> No Favourite Cuisines
                        </div>
                        <%}%>
                        
                        <% if (user.getFavouriteBooks() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-book"></i>
                            <strong>Favourite Books: &nbsp; </strong> <%= user.getFavouriteBooks() %>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-book"></i>
                            <strong>Favourite Books: &nbsp; </strong> No Favourite Books
                        </div>
                        <%}%>
                        
                        <% if (user.getFavouritePlaces() != null) {%>
                        <div class="profile-details__item">
                            <i class="fas fa-globe"></i>
                            <strong>Favourite Place: &nbsp; </strong> <%= user.getFavouritePlaces() %>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-globe"></i>
                            <strong>Favourite Place: &nbsp; </strong> No Favourite Place
                        </div>
                        <%}%>
                        
                    </div>
                </section>
                <% } else {%>
                <section class="home-page" style="height: 70vh">
                    <p>
                        No user with id
                    </p>
                </section>
                <% }%>
                
                
            </main>
            <footer>
                <small>All content &copy; Matrimony Site. All rights reserved.</small>
            </footer>
    </body>
</html>
