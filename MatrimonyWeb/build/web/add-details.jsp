<%-- 
    Document   : add-details
    Created on : Oct 10, 2024, 7:42:04 AM
    Author     : dsihle875@gmail.com
--%>

<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <style>
            .form{
                width: 600px;
                
            }
            
        </style>

        <title>Matrimony</title>
    </head>
    <body>
        <section>
            <div class="login-card">
                <div class="login-card-content">
                    <div class="header">
                        <h2>Matri<span class="highlight">mony</span></h2>
                        <h3>Tell Us More About Yourself</h3>
                    </div>
                    <form action="submitAdditionalUserDetails" method="POST" class="form">

                        <!-- Personal Section -->
                        <fieldset id="personalSection">
                            <legend>Personal Information</legend>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-info-circle"></i>
                                </div>
                                <textarea id="aboutSelf" name="aboutSelf" placeholder="About Self" rows="4" required></textarea>
                            </div>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-users"></i>
                                </div>
                                <textarea id="familyDetails" name="familyDetails" placeholder="Family Details" rows="4" required></textarea>
                            </div>
                            <button type="button" onclick="showNextSection('professionalSection')">Next</button>
                        </fieldset>

                        <!-- Professional Section -->
                        <fieldset id="professionalSection" style="display: none;">
                            <legend>Professional Information</legend>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-graduation-cap"></i>
                                </div>
                                <input type="text" id="qualification" name="qualification" placeholder="Qualification" required>
                            </div>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-building"></i>
                                </div>
                                <input type="text" id="workingAt" name="workingAt" placeholder="Working At" required>
                            </div>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-user-tie"></i>
                                </div>
                                <input type="text" id="designation" name="designation" placeholder="Designation" required>
                            </div>
                            <button type="button" onclick="showNextSection('personalSection')">Previous</button>
                            <button type="button" onclick="showNextSection('likingsSection')">Next</button>
                        </fieldset>

                        <!-- Likings Section -->
                        <fieldset id="likingsSection" style="display: none;">
                            <legend>Likings</legend>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-palette"></i>
                                </div>
                                <input type="text" id="hobbies" name="hobbies" placeholder="Hobbies" required>
                            </div>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-music"></i>
                                </div>
                                <input type="text" id="favoriteMusic" name="favoriteMusic" placeholder="Favorite Music" required>
                            </div>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-film"></i>
                                </div>
                                <input type="text" id="favoriteMovies" name="favoriteMovies" placeholder="Favorite Movies" required>
                            </div>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-utensils"></i>
                                </div>
                                <input type="text" id="favoriteCuisines" name="favoriteCuisines" placeholder="Favorite Cuisines" required>
                            </div>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-book"></i>
                                </div>
                                <input type="text" id="favoriteBooks" name="favoriteBooks" placeholder="Favorite Books" required>
                            </div>
                            <div class="form-field">
                                <div class="icon">
                                    <i class="fas fa-globe"></i> 
                                </div>
                                <input type="text" id="favoritePlace" name="favoritePlace" placeholder="Favorite Place" required>
                            </div>
                            <button type="button" onclick="showNextSection('professionalSection')">Previous</button>
                            <button type="submit">Submit</button>
                        </fieldset>
                    </form>

                </div>
            </div>
        </section>

        <script>
            function showNextSection(sectionId) {
                const sections = ['personalSection', 'professionalSection', 'likingsSection'];
                sections.forEach(id => document.getElementById(id).style.display = 'none');
                document.getElementById(sectionId).style.display = 'block';
            }
        </script>
    </body>
</html>
