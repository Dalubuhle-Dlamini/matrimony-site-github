<%-- 
    Document   : services
    Created on : Oct 23, 2024, 10:58:49 AM
    Author     : dsihle875@gmail.com
--%>

<%@page import="java.util.Base64"%>
<%@page import="com.matrimony.models.UserAdd"%>
<%@page import="java.util.List"%>
<%@page import="com.matrimony.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the current session user (if available)
    User user = (User) session.getAttribute("user");
    List<UserAdd> adds = (List<UserAdd>) request.getAttribute("adds");
%>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="./assets/css/services.css">

        <style>
            .blog-author h3::before, .blog-author--no-cover h3::before {

                background-size: cover;
                border-radius: 50%;
                content: " ";
                display: inline-block;
                height: 32px;
                margin-right: 0.5rem;
                position: relative;
                top: 8px;
                width: 32px;
            }

            input
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

            textarea{
                border: 1px solid #000;
                width: 100%;
                border-radius: 16px;
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
        <title>Matrinomy Site</title>
    </head>
    <body>
        <div class="wrapper">
            <header class="site-header">
                <nav>
                    <a href="user"><strong>MATRIMONY</strong></a> |
                    <a href="search">Search</a>
                    <a href="about">About Us</a>
                    <a href="browse">Looking For</a>
                    <a href="javascript:void(0)" class="active-link">Services</a>
                    <a href="contact">Contact Us</a>
                    <% if (user != null) { %>
                    <p class="signup-btn cursor:pointer;" onclick="openModal1()">Add Blog</p> 
                    <div id="addModal" class="modal">
                                <!-- Modal content -->
                                <div class="modal-content">
                                    <span class="close" onclick="closeModal1()">&times;</span>
                                    <form action="insert-add" method="POST">
                                         <input type="hidden" value="<%= user.getUser_id()%>" name="id">
                                        <input type="text" name="title" placeholder="Title">
                                        <textarea name="body">
                                            
                                        </textarea>
                                        <button type="submit">Submit</button>
                                        <button type="reset">Reset</button>
                                    </form>
                                </div>
                            </div>
                    <% }%>
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

                <% for (UserAdd add : adds) { %>
                <% if (!add.equals(null)) {
                        byte[] photoByteUsers = add.getPhoto();
                        String base64ImageUser = Base64.getEncoder().encodeToString(photoByteUsers);
                        String backgroundImage = !base64ImageUser.isEmpty()
                                ? "data:image/png;base64," + base64ImageUser
                                : "./assets/images/profile.png";
                %>
                <head>
                    <script defer>
                        const style = document.createElement('style');
                        style.innerHTML = `
                        .blog-author h3::before, .blog-author--no-cover h3::before {
                            background: url("<%=backgroundImage%>");
                        }
                        `;
                        document.head.appendChild(style);
                    </script>
                </head>
                <div class="blog-container">

                    <div class="blog-header">
                        <div class="blog-author--no-cover">
                            <h3><%= add.getName()%></h3>
                        </div>
                    </div>

                    <div class="blog-body">
                        <div class="blog-title">
                            <h1><%= add.getTitle()%></h1>
                        </div>
                        <div class="blog-summary">
                            <p>
                                <%= add.getBody()%>
                            </p>
                        </div>
                    </div>

                    <div class="blog-footer">
                        <ul>
                            <% if (user != null) {%> 
                            <% if (add.getName().equals(user.getFirstname())) {%>
                            <li class="published-date"><p style="color:white; cursor:pointer;" onclick="openModal()">Edit</p></li>
                            <div id="editModal" class="modal">
                                <!-- Modal content -->
                                <div class="modal-content">
                                    <span class="close" onclick="closeModal()">&times;</span>
                                    <form action="edit-add" method="POST">
                                         <input type="hidden" value="<%= add.getUserId()%>" name="id">
                                        <input type="text" value="<%= add.getTitle()%>" name="title" placeholder="Title">
                                        <textarea name="body">
                                            <%= add.getBody()%>
                                        </textarea>
                                        <button type="submit">Submit</button>
                                        <button type="reset">Reset</button>
                                    </form>
                                </div>
                            </div>

                            <% } else { %>

                            <% } %> 
                            <% } %>
                        </ul>
                    </div> 

                </div>  
                <%} else { %>
                <div class="blog-container">
                    <h1>no adds to view</h1>
                </div>
                <% } %>
                <%}%>
            </main>
            <footer>
                <small>All content &copy; Matrimony Site. All rights reserved.</small>
            </footer>
        </div>


        <script>
            // Get the modal
            var modal = document.getElementById("editModal");
            var modal1 = document.getElementById("addModal");
            
            // Function to open the modal
            function openModal() {
                modal.style.display = "block";
            }
            
            function openModal1() {
                modal1.style.display = "block";
            }

            // Function to close the modal
            function closeModal() {
                modal.style.display = "none";
            }
            
            function closeModal1() {
                modal1.style.display = "none";
            }

            // Close the modal when the user clicks anywhere outside of it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
                
                if (event.target == modal1){
                    modal1.style.display = "none";
                }
            }
        </script>
    </body>
</html>
