<%-- Document : admin Created on : Oct 15, 2024, 10:06:27 AM Author : dsihle875@gmail.com --%>
<%@page import="com.matrimony.models.AdditionalUserDetails" %>
<%@page import="java.util.Base64" %>
<%@page import="java.util.List" %>
<%@page import="com.matrimony.models.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% User user = (User) session.getAttribute("user");
    List<User> users = (List<User>) session.getAttribute("users");
    List<AdditionalUserDetails> details = (List<AdditionalUserDetails>) session.getAttribute("info");
    String views = (String) session.getAttribute("views");
    String likes = (String) session.getAttribute("likes");
%> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Dashboard - Matrimony</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <!-- Bootstrap CSS -->
        <!-- Bootstrap Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
              rel="stylesheet">
        <!-- Simple DataTables CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">


        <style>
            td input {
                border: none;
            }

            td input:hover {
                border: solid 1px black;
                transition: .6s;
            }
        </style>

        <!-- Template Main CSS File -->
        <link href="./assets/css/admin.css" rel="stylesheet">

    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="admin" class="logo d-flex align-items-center">
                    <img src="./assets/img/logo.png" alt="">
                    <span class="d-none d-lg-block">MatrimonyAdmin</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div>
            <!-- End Logo -->


            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">

                    <li class="nav-item dropdown pe-3">

                        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">

                            <span class="d-none d-md-block dropdown-toggle ps-2">
                                <p><a href="logout" class="signup-btn">Logout</a></p><%= user.getFirstname()%>
                            </span>
                        </a>
                        <!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6>
                                    <%= user.getFirstname()%>
                                </h6>
                                <span>Admin</span>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                                    <i class="bi bi-person"></i>
                                    <span>My Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                                    <i class="bi bi-gear"></i>
                                    <span>Account Settings</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Sign Out</span>
                                </a>
                            </li>

                        </ul>
                        <!-- End Profile Dropdown Items -->
                    </li>
                    <!-- End Profile Nav -->

                </ul>
            </nav>
            <!-- End Icons Navigation -->

        </header>
        <!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link " href="admin">
                        <i class="bi bi-grid"></i>
                        <span>Tables</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="additional-tables">
                        <i class="bi bi-grid"></i>
                        <span>Additional Tables</span>
                    </a>
                </li>
            </ul>
        </aside><!-- End Sidebar-->

        <!-- End Sidebar-->

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Tables</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href=r"admin">Home</a></li>
                        <li class="breadcrumb-item active">Tables</li>
                    </ol>
                </nav>
            </div>
            <!-- End Page Title -->

            <section class="section dashboard">
                <div class="row">

                    <!-- Left side columns -->
                    <div class="col-lg-12">
                        <div class="row">

                            <!-- Users Card -->
                            <div class="col-xxl-4 col-md-12">
                                <div class="card info-card sales-card">
                                    <div class="card-body">
                                        <h5 class="card-title">Total Users <span>|
                                                All Time</span></h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-people"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>
                                                    <%= users.size()%>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- End Users Card -->

                            <!-- Like Card -->
                            <!-- Sales Card -->
                            <div class="col-xxl-4 col-md-6">
                                <div class="card info-card sales-card">

                                    <div class="card-body">
                                        <h5 class="card-title">Views <span>| Total Views</span></h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-eye"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6><%= views%></h6>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- End Sales Card -->

                            <div class="col-xxl-4 col-md-6">
                                <div class="card info-card revenue-card">

                                    <div class="card-body">
                                        <h5 class="card-title">Likes <span>| Total Likes</span></h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-heart"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6><%= likes%></h6>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <!-- Users Table -->
                            <div class="col-12">
                                <div class="card top-selling overflow-auto">

                                    <div class="card-body pb-0" style="height: 400px;">
                                        <h5 class="card-title">Users <span>|
                                                Table</span></h5>

                                        <table class="table table-borderless datatable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID </th>
                                                    <th scope="col">Photo </th>
                                                    <th scope="col">Firstname </th>
                                                    <th scope="col">Lastname </th>
                                                    <th scope="col">Email </th>
                                                    <th scope="col">Gender </th>
                                                    <th scope="col">dob </th>
                                                    <th scope="col">Height </th>
                                                    <th scope="col">Marital Status
                                                    </th>
                                                    <th scope="col">Country </th>
                                                    <th scope="col">City </th>
                                                    <th scope="col">Contact Number
                                                    </th>
                                                    <th scope="col">Mother Tongue
                                                    </th>
                                                    <th scope="col">Religion </th>
                                                    <th scope="col">Caste </th>
                                                    <th scope="col">User Type </th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                    <%for (User userList : users) {
                                                            byte[] photoByteUsers = userList.getPhoto();
                                                            String base64ImageUsers = Base64.getEncoder().encodeToString(photoByteUsers);%>
                                                <tr>
                                                <form action="adminedit" method="POST">
                                                    <th scope="row">#
                                                        <%= userList.getUser_id()%>
                                                    </th>
                                                    <% if (!base64ImageUsers.isEmpty()) {%>
                                                    <td scope="row"><a href="#"
                                                                       class="text-primary fw-bold"><img
                                                                src="data:image/png;base64,<%= base64ImageUsers%>"
                                                                alt=""></a>
                                                    </td>
                                                    <% } else { %>
                                                    <td><a href="#" class="text-primary fw-bold"><img
                                                                src="./assets/images/profile.png"
                                                                alt="profile picture"></a>
                                                        </th>
                                                        <% }%>
                                                        <input type="hidden"
                                                               value="<%= userList.getUser_id()%>"
                                                               name="user_id">
                                                    <td><input type="text"
                                                               value="<%= userList.getFirstname()%>"
                                                               name="firstname">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getLastname()%>"
                                                               name="lastname">
                                                    </td>
                                                    <td><input type="text" value="<%= userList.getEmail()%>"
                                                               name="email">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getGender()%>"
                                                               name="gender">
                                                    </td>
                                                    <td><input type="date"
                                                               value="<%= userList.getDate_of_birth()%>"
                                                               name="date_of_birth">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getHeight()%>"
                                                               name="height">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getMarital_status()%>"
                                                               name="marital_status">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getCountry()%>"
                                                               name="country">
                                                    </td>
                                                    <td><input type="text" value="<%= userList.getCity()%>"
                                                               name="city">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getContact_number()%>"
                                                               name="contact_number">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getMother_tongue()%>"
                                                               name="mother_tongue">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getReligion()%>"
                                                               name="religion">
                                                    </td>
                                                    <td><input type="text" value="<%= userList.getCaste()%>"
                                                               name="caste">
                                                    </td>
                                                    <td><input type="text"
                                                               value="<%= userList.getUser_type()%>"
                                                               name="user_type">
                                                    </td>
                                                    <td>
                                                        <button
                                                            style="border: solid 1px white; width: 70px;"
                                                            type="submit"
                                                            class="badge bg-success">Update</button>
                                                        <button
                                                            onclick="window.location.href = 'delete-user?id=<%= user.getUser_id()%>'"
                                                            style="border: solid 1px white; width: 70px;"
                                                            class="badge bg-danger">Delete</button>
                                                    </td>
                                                </form>
                                                </tr>
                                                <% }%>
                                                </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>
                            <!-- End Users -->

                            <!-- User Details -->
                            <div class="col-12">
                                <div class="card recent-sales overflow-auto">
                                    <div class="card-body" style="height: 400px;">
                                        <h5 class="card-title">User Details <span>|
                                                Table</span></h5>

                                        <table class="table table-borderless datatable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">User ID</th>
                                                    <th scope="col">About Self</th>
                                                    <th scope="col">Family Details
                                                    </th>
                                                    <th scope="col">Qualification
                                                    </th>
                                                    <th scope="col">Working At</th>
                                                    <th scope="col">Designation</th>
                                                    <th scope="col">Hobbies</th>
                                                    <th scope="col">Favorite Music
                                                    </th>
                                                    <th scope="col">Favorite Movies
                                                    </th>
                                                    <th scope="col">Favorite Cuisine
                                                    </th>
                                                    <th scope="col">Favorite Books
                                                    </th>
                                                    <th scope="col">Favorite Places
                                                    </th>
                                                    <th scope='col'>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% for (AdditionalUserDetails info : details) {%>
                                                <% if (info != null) {%>
                                                <tr>
                                            <form action="admineditdetails" method="POST">
                                                <th scope="row">#<%= info.getUserId()%>
                                                </th>
                                                <input type="hidden" value="3" name="user_id">
                                                <td><input type="text" value="<%= info.getAboutSelf()%>"
                                                           name="aboutSelf" id="aboutSelf">
                                                </td>
                                                <td><input type="text" value="<%= info.getFamilyDetails()%>"
                                                           name="familyDetails" id="familyDetails">
                                                </td>
                                                <td><input type="text" value="<%= info.getQualification()%>"
                                                           name="qualifications" id="qualifications">
                                                </td>
                                                <td><input type="text" value="<%= info.getWorkingAt()%>"
                                                           name="workingAt" id="workingAt">
                                                </td>
                                                <td><input type="text" value="<%= info.getDesignation()%>"
                                                           name="designation" id="designation">
                                                </td>
                                                <td><input type="text" value="<%= info.getHobbies()%>"
                                                           name="hobbies" id="hobbies">
                                                </td>
                                                <td><input type="text"
                                                           value="<%= info.getFavouriteGenre()%>"
                                                           name="favouriteMusic" id="favouriteMusic">
                                                </td>
                                                <td><input type="text"
                                                           value="<%= info.getFavouriteMovies()%>"
                                                           name="favouriteMovies" id="favouriteMovies">
                                                </td>
                                                <td><input type="text"
                                                           value="<%= info.getFavouriteCuisine()%>"
                                                           name="favouriteCuisine" id="favouriteCuisine">
                                                </td>
                                                <td><input type="text"
                                                           value="<%= info.getFavouriteBooks()%>"
                                                           name="favouriteBooks" id="favouriteBooks">
                                                </td>
                                                <td><input type="text"
                                                           value="<%= info.getFavouritePlaces()%>"
                                                           name="favouritePlaces" id="favouritePlaces">
                                                </td>
                                                <td>
                                                    <button
                                                        style="border: solid 1px white; width: 70px;"
                                                        type="submit"
                                                        class="badge bg-success">Update</button>
                                                </td>
                                            </form>
                                            </tr>

                                            <% } else { %>

                                            <tr>
                                                <td>table content
                                                    empty</td>
                                            </tr>

                                            <% }
                                                }%>

                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>





                        </div>
                    </div>

                </div>
            </section>


        </main>
        <!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <div class="copyright">
                &copy; Copyright <strong><span>Matrimony Site</span></strong>. All
                Rights Reserved
            </div>
            <div class="credits">
                Designed by <a href="admin">ASIT</a>
            </div>
        </footer>
        <!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-XEj6vZD8doxzXSO+W6QF0GEBxZP8fMIRSU3d11AmI+hT3LfgUetnRaW5cTxds1fE"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
                integrity="sha384-6wIMp7XmvXEpPnsgWtDflYrPmfzzN75VsZpL70Zn6cpxbEFL+S3bT+k6fhPjDQMG"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/7.4.1/tinymce.min.js"
                integrity="sha512-TDS3vtbiUCZzBBZO8LFud171Hw+ykrQgkrvjwV+i+XsI0LC46PR4affO+9VbgcR79KreoN7J0HKup9mrle4gRA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script src="./assets/js/admin.js"></script>

        <script>
                                                                document.addEventListener("DOMContentLoaded", function () {
                                                                    const dataTable = new simpleDatatables.DataTable(".datatable");
                                                                });
        </script>

    </body>

</html>