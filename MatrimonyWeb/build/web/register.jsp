<%-- 
    Document   : register
    Created on : Oct 2, 2024, 7:28:05 PM
    Author     : dsihle875@gmail.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="Find your perfect match on Matrimony - the leading matrimony site for genuine connections." />
        <meta name="author" content="Projects" />
        <meta name="keywords"
              content="Matrimony, marriage, life partner, matrimony site, find a match, wedding, matchmaking" />
        <meta name="theme-color" content="#ff4081" />

        <!-- Open Graph (for Facebook, LinkedIn) -->
        <meta property="og:title" content="Matrimony - Find Your Perfect Match" />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="https://www.matrimony.com" />
        <meta property="og:image" content="https://www.matrimony.com/images/logo/Logo.png" />
        <meta property="og:description"
              content="Matrimony is your trusted platform to connect with your ideal life partner. Join today to find your match." />
        <meta property="og:locale" content="en_US" />

        <!-- Twitter Cards -->
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content="Matrimony - Your Trusted Matchmaking Platform" />
        <meta name="twitter:description" content="Find your life partner on Matrimony - where real connections are made." />
        <meta name="twitter:image" content="https://www.matrimony.com/images/logo/Logo.png" />
        <meta name="twitter:site" content="@Matrimony" />

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <!-- CSS -->
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/form.css">

        <title>Matrimony</title>
    </head>

    <body>
        <div class="login-card">
            <div class="login-card-content">
                <div class="header">
                    <h2>Matrimony</h2>
                    <h3>Find your perfect match</h3>
                    <p>Already have an account? <a href="login">Login</a></p>
                </div>
                <form class="form" method="post" action="register-user" id="multiStepForm">
                    <div class="progress-bar">
                        <div class="progress" id="progress"></div>
                    </div>
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                    <div class="error-message">
                        <p><%= errorMessage%></p>
                    </div>
                    <% }%>

                    <input type="hidden" name="usertype" id="usertype" value="User"/>
                    <!-- Step 1: User Information -->
                    <div class="form-step" id="step1">
                        <div class="form-field firstname">
                            <div class="icon">
                                <i class="fas fa-user"></i>
                            </div>
                            <input type="text" id="firstname" name="firstname" placeholder="First Name" required>
                        </div>
                        <div class="form-field lastname">
                            <div class="icon">
                                <i class="fas fa-user"></i>
                            </div>
                            <input type="text" id="lastname" name="lastname" placeholder="Last Name" required>
                        </div>
                        <div class="form-field email">
                            <div class="icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <input type="email" id="email" name="email" placeholder="Email" required>
                        </div>
                        <div class="form-field password">
                            <div class="icon">
                                <i class="fas fa-lock"></i>
                            </div>
                            <input type="password" id="password" name="password" placeholder="Password">
                        </div>
                        <button type="button" class="next-btn">Next</button>
                    </div>

                    <!-- Step 2: Contact Information -->
                    <div class="form-step" id="step2" style="display: none;">
                        <div class="form-field gender">
                            <div class="icon">
                                <i class="fas fa-venus-mars"></i>
                            </div>
                            <select id="gender" name="gender" required>
                                <option value="" disabled selected>Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="form-field contact_number">
                            <div class="icon">
                                <i class="fas fa-phone"></i>
                            </div>
                            <input type="tel" id="number" name="number" placeholder="Contact Number"
                                   required>
                        </div>
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
                        <button type="button" class="prev-btn">Previous</button>
                        <button type="button" class="next-btn">Next</button>
                    </div>

                    <!-- Step 3: Personal Details -->
                    <div class="form-step" id="step3" style="display: none;">
                        <div class="form-field date_of_birth">
                            <p id="error-message" style="color: red;"></p>
                            <div class="icon">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <input type="date" id="date_of_birth" name="date_of_birth" required onblur="validateAgeOnLeaveFocus()">
                        </div>
                        <div class="form-field height">
                            <div class="icon">
                                <i class="fas fa-arrows-alt-v"></i>
                            </div>
                            <input type="number" id="height" name="height" placeholder="Height (in cm)" required>
                        </div>
                        <div class="form-field marital_status">
                            <div class="icon">
                                <i class="fas fa-heart"></i>
                            </div>
                            <select id="status" name="status" required>
                                <option value="" disabled selected>Select Marital Status</option>
                                <option value="Never Married">Never Married</option>
                                <option value="Divorced">Divorced</option>
                                <option value="Widowed">Widowed</option>
                            </select>
                        </div>
                        <button type="button" class="prev-btn">Previous</button>
                        <button type="button" class="next-btn">Next</button>
                    </div>

                    <!-- Step 4: Location and Background -->
                    <div class="form-step" id="step4" style="display: none;">
                        <div class="form-field country">
                            <div class="icon">
                                <i class="fas fa-globe"></i>
                            </div>
                            <input type="text" id="country" name="country" placeholder="Country" required>
                        </div>
                        <div class="form-field city">
                            <div class="icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <input type="text" id="city" name="city" placeholder="City" required>
                        </div>
                        <div class="form-field mother_tongue">
                            <div class="icon">
                                <i class="fas fa-comments"></i>
                            </div>
                            <select id="language" name="language" required>
                                <option value="" disabled selected>Select your mother tongue</option>
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
                                <option value="" disabled selected>Select your religion</option>
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
                        <!-- Payment Section -->
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
                        <button type="submit">Submit</button>
                        <div class="multi-btn">
                            <button type="button" class="prev-btn">Previous</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- JavaScript -->
        <script src="./assets/js/multi-step-form.js"></script>
        <script>
            function validateAgeOnLeaveFocus() {
                var dob = document.getElementById('date_of_birth').value;
                var today = new Date();
                var birthDate = new Date(dob);
                var age = today.getFullYear() - birthDate.getFullYear();
                var monthDiff = today.getMonth() - birthDate.getMonth();

                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }

                if (age < 18) {
                    document.getElementById('error-message').textContent = "You must be at least 18 years old to sign up.";
                } else {
                    document.getElementById('error-message').textContent = ""; // Clear error if age is valid
                }
            }

        </script>
    </body>

</html>
