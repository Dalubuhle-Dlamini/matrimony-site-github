<%-- 
    Document   : edit-profile
    Created on : Oct 9, 2024, 7:08:16 PM
    Author     : dsihle875@gmail.com
--%>

<%@page import="java.util.Base64"%>
<%@page import="com.matrimony.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the current session user (if available)
    User user = (User) request.getAttribute("user");
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
                    <div class="logo" >
                        <%
                            byte[] photoBytes = user.getPhoto();
                            String base64Image = Base64.getEncoder().encodeToString(photoBytes);
                        %>

                        <% if (!base64Image.equals("")) {%>
                        <img style="border-radius: 50%; border: solid 1px #fff;" src="data:image/png;base64,<%= base64Image%>" height="100px" alt="Profile Photo">
                        <% } else { %>
                        <img style="border-radius: 50%; border: solid 1px #fff;" src="./assets/images/profile.png" height="100px" alt="user profile photo">
                        <% }%>
                    </div>
                    <h2>Matri<span class="highlight">mony</span></h2>
                    <h3>Find you your perfect match</h3>
                </div>
                <form class="form" action="edit" method="POST">

                    <input type="hidden" id="userId" name="userId" value="<%= user.getUser_id()%>">
                    <input type="hidden" id="userType" name="userType" value="<%= user.getUser_type()%>">

                    <div class="form-field firstname">
                        <div class="icon">
                            <i class="far fa-user"></i>
                        </div>
                        <input type="text" id="firstname" name="firstname" placeholder="First Name" value="<%= user.getFirstname()%>" required>
                    </div>

                    <div class="form-field lastname">
                        <div class="icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <input type="text" id="lastname" name="lastname" placeholder="Last Name" value="<%= user.getLastname()%>" required>
                    </div>

                    <div class="form-field email">
                        <div class="icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <input type="email" id="email" name="email" placeholder="Email" value="<%= user.getEmail()%>" required>
                    </div>

                    <div class="form-field gender">
                        <div class="icon">
                            <i class="fas fa-venus-mars"></i>
                        </div>
                        <select id="gender" name="gender" required>
                            <option value="<%= user.getGender()%>" selected><%= user.getGender()%></option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="form-field date_of_birth">
                        <div class="icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <input type="date" id="date_of_birth" name="date_of_birth" value="<%= user.getDate_of_birth()%>"required>
                    </div>

                    <div class="form-field height">
                        <div class="icon">
                            <i class="fas fa-arrows-alt-v"></i>
                        </div>
                        <input type="number" id="height" name="height" placeholder="Height (in cm)" value="<%= user.getHeight()%>" required>
                    </div>

                    <div class="form-field marital_status">
                        <div class="icon">
                            <i class="fas fa-heart"></i>
                        </div>
                        <select id="marital_status" name="marital_status" required>
                            <option value="<%= user.getMarital_status()%>"selected><%= user.getMarital_status()%></option>
                            <option value="Never Married">Never Married</option>
                            <option value="Divorced">Divorced</option>
                            <option value="Widowed">Widowed</option>
                        </select>
                    </div>

                    <div class="form-field country">
                        <div class="icon">
                            <i class="fas fa-globe"></i>
                        </div>
                        <input type="text" id="country" name="country" placeholder="Country" value="<%= user.getCountry()%>" required>
                    </div>

                    <div class="form-field city">
                        <div class="icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <input type="text" id="city" name="city" placeholder="City" value="<%= user.getCity()%>" required>
                    </div>

                    <div class="form-field contact_number">
                        <div class="icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <input type="tel" id="contact_number" name="contact_number" placeholder="Contact Number" value="<%= user.getContact_number()%>" required>
                    </div>

                    <div class="form-field mother_tongue">
                        <div class="icon">
                            <i class="fas fa-comments"></i>
                        </div>
                        <select id="mother_tongue" name="mother_tongue" required>
                            <option value="<%= user.getMother_tongue()%>" selected><%= user.getMother_tongue()%></option>
                            <option value="siSwati">siSwati</option>
                            <option value="English">English</option>
                            <option value="Zulu">Zulu</option>
                            <option value="Afrikaans">Afrikaans</option>
                            <option value="Tswana">Tswana</option>
                            <option value="Ndebele">Ndebele</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="form-field religion">
                        <div class="icon">
                            <i class="fas fa-pray"></i>
                        </div>
                        <select id="religion" name="religion" required>
                            <option value="<%= user.getReligion()%>" selected><%= user.getReligion()%></option>
                            <option value="Christianity">Christianity</option>
                            <option value="Zionism">Zionism</option>
                            <option value="Catholicism">Catholicism</option>
                            <option value="Anglicanism">Anglicanism</option>
                            <option value="Methodism">Methodism</option>
                            <option value="Islam">Islam</option>
                            <option value="Traditional African Religions">Traditional African Religions</option>
                            <option value="Hinduism">Hinduism</option>
                            <option value="Other">Other</option>
                        </select>
                    </div> 

                    <div class="form-field caste">
                        <div class="icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <select id="caste" name="caste" required>
                            <option value="<%= user.getCaste()%>" selected><%= user.getCaste()%></option>
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

                    
                    <input type="hidden" name="user-type">

                    <button type="submit">
                        Update Profile
                    </button>
                </form>
            </div>
        </div>
    </body>

</html>