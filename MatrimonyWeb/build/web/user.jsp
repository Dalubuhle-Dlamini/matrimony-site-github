<%-- 
    Document   : user
    Created on : Oct 3, 2024, 10:25:23 AM
    Author     : dsihle875@gmail.com
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.matrimony.models.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

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

        <style>
            select
            {
                border: 1px solid #000;
                text-align: center;
                width: 100%;
                border-radius: 16px;
                height: 36px;
                background: rgba(255, 255, 255, 0.1);
                color: black;
                outline: none;
                transition: all 0.2s;
                font-family: "Nunito", system-ui;
            }

            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                overflow: auto; /* Enable scroll if needed */
            }

            /* Modal Content */
            .modal-content {
                background-color:#ffe4ec ;
                margin: 15% auto; /* 15% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 50%; /* Could be more or less, depending on screen size */
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
                position: relative;
            }

            /* The Close Button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
                position: absolute;
                top: 10px;
                right: 20px;
            }

            .close:hover, .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>

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
                    <a href="browse">Looking For</a>
                    <a href="services">Services</a>
                    <a href="contact">Contact Us</a>
                </nav>

                <div class="nav-btn">
                    <p><a href="logout" class="signup-btn">Logout</a></p>
                </div>
            </header>

            <main>

                <%
                    User user = (User) session.getAttribute("user");
                    List<User> users = (List<User>) session.getAttribute("users");
                    String oppositeGender = (user != null && "male".equalsIgnoreCase(user.getGender())) ? "female" : "male";
                    if (user == null || session.getAttribute("user") == null) {
                        response.sendRedirect("login.jsp");
                    }
                %>

                <section class="home-page">
                    <div class="block">
                        <!-- profile card start -->
                        <div class="layout">
                            <div class="profile">
                                <div class="profile__picture">
                                    <a href="updatephotoroute">

                                        <%
                                            byte[] photoBytes = user.getPhoto();
                                            String base64Image = Base64.getEncoder().encodeToString(photoBytes);
                                        %>

                                        <% if (!base64Image.equals("")) {%>
                                        <img src="data:image/png;base64,<%= base64Image%>" alt="Profile Photo">
                                        <% } else { %>
                                        <img src="./assets/images/profile.png" alt="user profile photo">
                                        <% }%>

                                    </a>
                                </div>
                                <div class="profile__header">
                                    <div class="profile__account">
                                        <h4 class="profile__username"><%= user.getFirstname()%></h4>
                                    </div>

                                    <div class="profile__edit">
                                        <a class="profile__button" href="editprofile?id=<%= user.getUser_id()%>">Edit Profile</a>
                                        <br>
                                        <a class="profile__button" href="editdetailsroute?id=<%= user.getUser_id()%>">Edit Details</a>
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
                                Your name is <%= user.getFirstname()%> your lastname is <%= user.getLastname()%>, you speak <%= user.getMother_tongue()%> 
                                your religion is <%= user.getReligion()%> that is <%= user.getCaste()%> born <%= user.getDate_of_birth().toString()%>
                            </p>
                            <div class="profile-details__info">
                                <div class="profile-details__item">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <strong>Location: </strong> <%= user.getCountry()%>
                                </div>
                                <div class="profile-details__item">
                                    <i class="fas fa-envelope"></i>
                                    <strong>Email: </strong> <%= user.getEmail()%>
                                </div>
                                <div class="profile-details__item">
                                    <i class="fas fa-calendar-alt"></i>
                                    <strong>Joined: </strong> <%= user.getCreatedAt().toString()%>
                                </div>
                                <div class="profile-details__item" style="cursor: pointer;" onclick="openModal()">
                                    <i class="fas fa-dollar-sign"></i>
                                    <strong>Payment: </strong> <%= session.getAttribute("timeLeft")%>
                                </div>
                                <div class="profile-details__item">
                                    <i class="fas fa-dollar-sign"></i>
                                    <strong>Update Password: </strong><p><a href="password" class="signup-btn">Update Password</a></p>
                                </div>

                                <div id="paymentModal" class="modal">
                                    <!-- Modal content -->
                                    <div class="modal-content">
                                        <span class="close" onclick="closeModal()">&times;</span>
                                        <form action="update-payment" method="POST">
                                            <input type="hidden" name="id" value="<%= user.getUser_id() %>">
                                            <div class="form-field payment">
                                                <div class="icon">
                                                    <i class="fas fa-credit-card"></i>
                                                </div>
                                                <select id="payment_method" name="payment_method">
                                                    <option value="" disabled selected>Select Payment Method</option>
                                                    <option value="Credit Card">Credit Card</option>
                                                    <option value="Debit Card">Debit Card</option>
                                                    <option value="PayPal">PayPal</option>
                                                    <option value="Bank Transfer">Bank Transfer</option>
                                                </select>
                                            </div>

                                            <div class="form-field payment_amount">
                                                <div class="icon">
                                                    <i class="fas fa-dollar-sign"></i>
                                                </div>
                                                <select id="payment_amount" name="payment_amount">
                                                    <option value="" disabled selected>Select Payment Amount</option>
                                                    <option value="50">Monthly - $50</option>
                                                    <option value="500">Yearly - $500</option>
                                                </select>
                                            </div>
                                            <button type="submit">Update Payment</button>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
                <h2 style="text-align: center;">Your Info</h2>
                <section class="home-page">

                    <div class="profile-details">
                        <% if (user.getAboutSelf() != null) {%>
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
                            <strong>Job: &nbsp; </strong> <%= user.getWorkingAt()%>
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
                            <strong>Designation: &nbsp; </strong> <%= user.getDesignation()%>
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
                            <strong>Favourite Genre: &nbsp; </strong> <%= user.getFavouriteGenre()%>
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
                            <strong>Favourite Movies: &nbsp; </strong> <%= user.getFavouriteMovies()%>
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
                            <strong>Favourite Books: &nbsp; </strong> <%= user.getFavouriteBooks()%>
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
                            <strong>Favourite Place: &nbsp; </strong> <%= user.getFavouritePlaces()%>
                        </div>
                        <%} else {%>
                        <div class="profile-details__item">
                            <i class="fas fa-globe"></i>
                            <strong>Favourite Place: &nbsp; </strong> No Favourite Place
                        </div>
                        <%}%>

                    </div>
                </section>

                <h2 style="text-align: center;">Similar users</h2>
                <!-- section 2 -->
                <section class="section2">

                    <% if (users != null && !users.isEmpty()) { %>
                    <%
                        boolean foundProfiles = false;
                        for (User userList : users) {
                            byte[] photoByteUsers = userList.getPhoto();
                            String base64ImageUsers = Base64.getEncoder().encodeToString(photoByteUsers);

                            // Show profiles of the opposite gender
                            if (oppositeGender.equalsIgnoreCase(userList.getGender())) {
                                foundProfiles = true;
                    %>
                    <div class="user-card-suggestion">
                        <div class="profile-photo">
                            <!-- Dynamically display user photo, fallback to default if no photo is available -->
                            <% if (!base64ImageUsers.isEmpty()) {%>
                            <img src="data:image/png;base64,<%= base64ImageUsers%>" alt="Profile Photo">
                            <% } else { %>
                            <img src="./assets/images/profile.png" alt="user profile photo">
                            <% } %>
                        </div>
                        <div class="profile-info">
                            <!-- Dynamically display user details -->
                            <p class="age" id="age">
                                <%
                                    // Get the date of birth from the User object as java.sql.Date
                                    java.sql.Date dob = userList.getDate_of_birth();

                                    if (dob != null) {
                                        java.time.LocalDate dobLocalDate = dob.toLocalDate();

                                        // Get today's date
                                        java.time.LocalDate today = java.time.LocalDate.now();

                                        // Calculate the age
                                        int age = java.time.Period.between(dobLocalDate, today).getYears();

                                        // Display the calculated age
                                        out.println("<p>Age: " + age + "</p>");
                                    }
                                %>
                            </p>
                            <p class="details"><%= userList.getFirstname()%> <%= userList.getLastname()%></p>
                            <p style="margin-top: 10px;"><a href="viewprofile?id=<%= userList.getUser_id()%>" class="view-profile">View profile</a></p>
                        </div>
                    </div>
                    <%
                            }
                        }
                        // If no profiles of opposite gender are found, show a message
                        if (!foundProfiles) {
                    %>
                    <p>No profiles available for your preferences at the moment.</p>
                    <% } %>
                    <% } else { %>
                    <p>No user suggestions available at the moment.</p>
                    <% }%>
                </section>
            </main>

            <footer>
                <small>All content &copy; Matrimony Site. All rights reserved.</small>
            </footer>
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById("paymentModal");

            // Function to open the modal
            function openModal() {
                modal.style.display = "block";
            }

            // Function to close the modal
            function closeModal() {
                modal.style.display = "none";
            }

            // Close the modal when the user clicks anywhere outside of it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }

            }
        </script>

    </body>

</html>
