<%-- Document : admin Created on : Oct 15, 2024, 10:06:27 AM Author : dsihle875@gmail.com --%>
<%@page import="com.matrimony.models.UserAdd"%>
<%@page import="com.matrimony.models.AdditionalUserDetails" %>
<%@page import="java.util.Base64" %>
<%@page import="java.util.List" %>
<%@page import="com.matrimony.models.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% 
    User user = (User) session.getAttribute("user");
    List<UserAdd> adds = (List<UserAdd>) session.getAttribute("adds");
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
                                <%= user.getFirstname()%>
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
                    <a class="nav-link collapsed" href="admin">
                        <i class="bi bi-grid"></i>
                        <span>Tables</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="additional-tables">
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
                        <li class="breadcrumb-item active">Additional Tables</li>
                    </ol>
                </nav>
            </div>
            <!-- End Page Title -->

            <section class="section dashboard">
                <div class="row">

                    <!-- Left side columns -->
                    <div class="col-lg-12">
                        <div class="row">
                            <!-- Users Table -->
                            <div class="col-12">
                                <div class="card top-selling overflow-auto">

                                    <div class="card-body pb-0" style="height: 400px;">
                                        <h5 class="card-title">User Adds <span>|
                                                Table</span></h5>

                                        <table class="table table-borderless datatable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">User ID</th>
                                                    <th scope="col">User image</th>
                                                    <th scope="col">Username</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Body</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (UserAdd addList : adds) {
                                                        byte[] photoByteUser = addList.getPhoto();
                                                        String base64ImageUsers = Base64.getEncoder().encodeToString(photoByteUser);%>
                                                <tr>
                                            <form action="admineditadd" method="POST">
                                                <th scope="row">#
                                                    <%= addList.getUserId()%>
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
                                                           value="<%= addList.getUserId()%>"
                                                           name="user_id">
                                                <td>
                                                    <%= addList.getName()%>
                                                </td>
                                                <td><input type="text"
                                                           value="<%= addList.getTitle()%>"
                                                           name="lastname">
                                                </td>
                                                <td><input type="text" value="<%= addList.getBody()%>"
                                                           name="email">
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