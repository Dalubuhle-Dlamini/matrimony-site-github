<%-- 
    Document   : search-result
    Created on : Oct 4, 2024, 1:27:34 PM
    Author     : dsihle875@gmail.com
--%>

<%@page import="com.matrimony.stateful.MatrimonySessionBeanLocal"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="com.matrimony.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<User> casteList = (List<User>) request.getAttribute("casteList");
    User loggedInUser = (User) session.getAttribute("user");
    MatrimonySessionBeanLocal bean = (MatrimonySessionBeanLocal) session.getAttribute("matrimonySessionBean");
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
        <link rel="stylesheet" href="./assets/css/search-result.css">
        <title>Matrinomy Site</title>
    </head>

    <body>
        <header class="site-header">
            <nav>
                <a href="user"><strong>MATRIMONY</strong></a> |
                <a href="search">Search</a>
                <a href="about">About Us</a>
                <a href="browse">Browse</a>
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
                <p><a href="logout" class="signup-btn">Logout</a></p>
                <% }%>
            </div>
        </header>
        <main>
            <section>
                <% if (casteList != null && !casteList.isEmpty()) {%>
                <p>Caste Search Succesful Find The Perfect One For Yourself</p>
                <% for (User user : casteList) {%>
                <% if (loggedInUser != null) {%>

                <%
                    boolean foundProfiles = false;
                    String oppositeGender = (user != null && "male".equalsIgnoreCase(loggedInUser.getGender())) ? "female" : "male";

                    if (oppositeGender.equalsIgnoreCase(user.getGender())) {
                        foundProfiles = true;

                %>
                <div class="search-result">
                    <div class="profile-photo">
                        <%                            byte[] photoBytes = user.getPhoto();
                            String base64Image = Base64.getEncoder().encodeToString(photoBytes);
                        %>

                        <% if (!base64Image.equals("")) {%>
                        <img src="data:image/png;base64,<%= base64Image%>" alt="Profile Photo">
                        <% } else { %>
                        <img src="./assets/images/profile.png" alt="user profile photo">
                        <% }%>
                    </div>
                    <div class="user-details">
                        <div class="member-id">
                            <%= user.getGender()%> #<%= user.getUser_id()%>
                        </div>
                        <div class="member-details">
                            <p>Name <span><%= user.getFirstname() + " " + user.getLastname()%></span></p>
                            <p>Age, Height <span><%
                                // Get the date of birth from the User object as java.sql.Date
                                java.sql.Date dob = user.getDate_of_birth();

                                if (dob != null) {
                                    java.time.LocalDate dobLocalDate = dob.toLocalDate();

                                    // Get today's date
                                    java.time.LocalDate today = java.time.LocalDate.now();

                                    // Calculate the age
                                    int age = java.time.Period.between(dobLocalDate, today).getYears();

                                    // Display the calculated age
                                    out.println(age);
                                }
                                    %> Yrs, <%= user.getHeight()%>cm</span></p>
                            <p>Religion, Caste <span><%= user.getReligion()%> : <%= user.getCaste()%></span></p>
                            <p>Mother Tongue <span><%= user.getMother_tongue()%></span></p>
                            <p>Phone Number: <a href="tel:+<%= user.getContact_number()%>"><%= user.getContact_number()%></a></p>
                            <p>Email: <a href="mailto:<%= user.getEmail()%>"><%= user.getEmail()%></a></p>
                        </div>
                    </div>
                    <div class="user-buttons">
                        <form action="like" method="POST" id="likeForm">

                            <input type="hidden" name="profileUserId" value="<%= user.getUser_id()%>">
                            <input type="hidden" name="likingUserId" value="<%= loggedInUser.getUser_id()%>">
                            <%
                                if (!bean.checkIfLiked(user.getUser_id(), loggedInUser.getUser_id())) {
                            %>
                            <button class="likeButton" id="likebtn" data-profile-id="<%= user.getUser_id()%>" data-liking-id="<%= loggedInUser.getUser_id()%>">
                                <i class="fas fa-heart"></i> Like
                            </button>
                            <%
                            } else {
                            %>

                            <button class="likeButton" type="disabled">
                                <i class="fas fa-heart"></i> Liked
                            </button>
                            <%}%>

                        </form>
                        <button onclick="window.location.href = 'viewprofile?id=<%= user.getUser_id()%>'"><i class="fas fa-user"></i> View Profile</button>

                    </div>
                </div>

                <%}%>


                <%
                } else { %>
                <div class="search-result">
                    <div class="profile-photo">    
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
                    <div class="user-details">
                        <div class="member-id">
                            <%= user.getGender()%> #<%= user.getUser_id()%>
                        </div>
                        <div class="member-details">
                            <p>Name <span><%= user.getFirstname() + " " + user.getLastname()%></span></p>
                            <p>Age, Height <span><%
                                // Get the date of birth from the User object as java.sql.Date
                                java.sql.Date dob = user.getDate_of_birth();

                                if (dob != null) {
                                    java.time.LocalDate dobLocalDate = dob.toLocalDate();

                                    // Get today's date
                                    java.time.LocalDate today = java.time.LocalDate.now();

                                    // Calculate the age
                                    int age = java.time.Period.between(dobLocalDate, today).getYears();

                                    // Display the calculated age
                                    out.println(age);
                                }
                                    %> Yrs, <%= user.getHeight()%>cm</span></p>
                            <p>Religion, Caste <span><%= user.getReligion()%> : <%= user.getCaste()%></span></p>
                            <p>Mother Tongue <span><%= user.getMother_tongue()%></span></p>
                            <p>Phone Number: <i class='fas fa-lock'></i> Sign up to view</p>
                            <p>Email: <i class='fas fa-lock'></i> Sign up to view</p>
                        </div>

                    </div>
                    <div class="user-buttons">
                        <button><i class='fas fa-lock'></i></button>
                        <button><i class='fas fa-lock'></i></button>
                    </div>
                </div>
                <% }
                    } %>
                <% } else { %>
                <p>No users found for the provided search criteria.</p>
                <% }%>
            </section>
        </main>
    </body>

    <script>
        document.querySelectorAll(".likeButton").forEach(button => {
            button.addEventListener("click", function (e) {
                e.preventDefault();

                const profileUserId = this.getAttribute("data-profile-id");
                const likingUserId = this.getAttribute("data-liking-id");
                const form = document.getElementById("likeForm");

                const xhr = new XMLHttpRequest();
                xhr.open("POST", "like", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xhr.onload = function () {
                    if (xhr.status === 200) {
                        const response = JSON.parse(xhr.responseText);
                        if (response.status === "success") {
                            alert("You liked the profile!");
                            button.innerHTML = '<i class="fas fa-heart"></i> Liked';
                            button.setAttribute("disabled", true);

                        } else {
                            alert("An error occurred while liking the profile.");
                        }
                    }
                };
                xhr.send("profileUserId=" + profileUserId + "&likingUserId=" + likingUserId);
            });
        });
    </script>

</html>
