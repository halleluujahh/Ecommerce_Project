<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <!-- BEGIN: Head-->

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
        <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="PIXINVENT">
        <title>User View - Vuexy - Bootstrap HTML admin template</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/bootstrap-extended.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/colors.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/components.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/themes/dark-layout.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/themes/semi-dark-layout.css">

        <!-- BEGIN: Page CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/core/menu/menu-types/vertical-menu.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/core/colors/palette-gradient.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/app-user.css">
        <!-- END: Page CSS-->

        <!-- BEGIN: Custom CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!-- END: Custom CSS-->

    </head>
    <!-- END: Head-->

    <!-- BEGIN: Body-->

    <body class="vertical-layout vertical-menu-modern semi-dark-layout 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="dark-layout">

        <!-- BEGIN: Header-->
        <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-dark navbar-shadow">
            <div class="navbar-wrapper">
                <div class="navbar-container content">
                    <div class="navbar-collapse" id="navbar-mobile">
                        <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                            <ul class="nav navbar-nav">
                                <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                            </ul>
                            <ul class="nav navbar-nav bookmark-icons">
                                <!-- li.nav-item.mobile-menu.d-xl-none.mr-auto-->
                                <!--   a.nav-link.nav-menu-main.menu-toggle.hidden-xs(href='#')-->
                                <!--     i.ficon.feather.icon-menu-->
                                <li class="nav-item d-none d-lg-block"></li>
                                <li class="nav-item d-none d-lg-block"></li>
                                <li class="nav-item d-none d-lg-block"></li>
                                <li class="nav-item d-none d-lg-block"></li>
                            </ul>
                        </div>
                        <ul class="nav navbar-nav float-right">
                            <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                                    <c:choose>
                                        <c:when test="${account.role_Id == 3}">
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">Welcome</span><span class="user-status">${account.email}</span></div><span><img class="round" src="${pageContext.request.contextPath}/assets/images/seller.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="page-user-profile.html"><i class="feather icon-user"></i> Edit Profile</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" data-toggle="modal" data-target="#logoutModalAdmin" href="#"><i class="feather icon-power"></i> Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">${account.email}</span><span class="user-status">${account.role_Id}</span></div><span><img class="round" src="${pageContext.request.contextPath}/app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="page-user-profile.html"><i class="feather icon-user"></i> Edit Profile</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" data-toggle="modal" data-target="#logoutModalAdmin" href="#"><i class="feather icon-power"></i> Logout</a>
                                        </div>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <ul class="main-search-list-defaultlist-other-list d-none">
            <li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer"><a class="d-flex align-items-center justify-content-between w-100 py-50">
                    <div class="d-flex justify-content-start"><span class="mr-75 feather icon-alert-circle"></span><span>No results found.</span></div>
                </a></li>
        </ul>
        <!-- END: Header-->


        <!-- BEGIN: Main Menu-->
        <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mr-auto"><a class="navbar-brand" href="${pageContext.request.contextPath}/seller/dashboard">
                            <div class="brand-logo"></div>
                            <h2 class="brand-text mb-0">Seller</h2>
                        </a></li>
                    <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
                </ul>
            </div>
            <div class="shadow-bottom"></div>
            <div class="main-menu-content">
                <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                    <li class=" nav-item"><a href="index.html"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">1</span></a>
                        <ul class="menu-content">
                            <li class=""><a href="${pageContext.request.contextPath}/seller/dashboard"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Analytics</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>Apps</span>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-shopping-bag"></i><span class="menu-title" data-i18n="Ecommerce">Product</span></a>
                        <ul class="menu-content">
                            <li class=""><a href="${pageContext.request.contextPath}/seller/manageProduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li class=""><a href="${pageContext.request.contextPath}/seller/dashboard?page=setting-discounts"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Setting Discounts</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-file"></i><span class="menu-title" data-i18n="Invoice">Invoice</span></a>
                        <ul class="menu-content">
                            <li  class=""><a href="${pageContext.request.contextPath}/seller/manageInvoice"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">List</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>pages</span>
                    </li>
                    <li class=" nav-item active"><a href="${pageContext.request.contextPath}/seller/dashboard?page=view-profile"><i class="feather icon-user"></i><span class="menu-title" data-i18n="Profile">Profile</span></a>
                    </li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/seller/dashboard?page=view-feedback"><i class="feather icon-mail"></i><span class="menu-title" data-i18n="Email">Feedback</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- END: Main Menu-->

        <!-- BEGIN: Content-->
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <!-- page users view start -->
                    <section class="page-users-view">
                        <div class="row">
                            <!-- account start -->
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Account</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <c:choose>
                                                <c:when test="${af.gender eq 'Male'}">
                                                    <div class="users-view-image">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="users-avatar-shadow w-100 rounded mb-2 pr-2 ml-1" alt="avatar">
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="users-view-image">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar8.png" class="users-avatar-shadow w-100 rounded mb-2 pr-2 ml-1" alt="avatar">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="col-12 col-sm-9 col-md-6 col-lg-5">
                                                <table>
                                                    <tr>
                                                        <td class="font-weight-bold">Username</td>
                                                        <td>${af.username}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="font-weight-bold">Email</td>
                                                        <td>${af.email}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="font-weight-bold">Address</td>
                                                        <td>${af.address}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="font-weight-bold">Phone</td>
                                                        <td>${af.phone_number}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="col-12 col-md-12 col-lg-5">
                                                <table class="ml-0 ml-sm-0 ml-lg-0">
                                                    <c:choose>
                                                        <c:when test="${af.status == 1}">
                                                            <tr>
                                                                <td class="font-weight-bold">Status  </td>
                                                                <td>Active</td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr>
                                                                <td class="font-weight-bold">Status</td>
                                                                <td>Deactive</td>
                                                            </tr>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <tr>
                                                        <td class="font-weight-bold">Role</td>
                                                        <td>${af.role}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="font-weight-bold">Gender</td>
                                                        <td>${af.gender}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="font-weight-bold">Date or birth</td>
                                                        <td>${af.dob}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="col-12">
                                                <button href="" class="btn btn-primary mr-1" data-toggle="modal" data-target="#editProfileModal" title="Edit Profile"
                                                        onclick="editProfileModal(`${af.id}`, '${af.email}')">
                                                    <i class="feather icon-edit-1">
                                                    </i> Edit
                                                </button>
                                                <button href="" class="btn btn-primary mr-1" data-toggle="modal" data-target="#changePasswordModal" title="ChangePassword">
                                                    <i class="feather icon-user">
                                                    </i> Change Password
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- account end -->
                            <jsp:include page="../../views/seller/editProfile.jsp"></jsp:include>
                            <jsp:include page="../../views/seller/changePasswordModal.jsp"></jsp:include>
                                <!-- permissions start -->
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header border-bottom mx-2 px-0">
                                            <h6 class="border-bottom py-1 mb-0 font-medium-2"><i class="feather icon-lock mr-50 "></i>Permission
                                            </h6>
                                        </div>
                                        <div class="card-body px-75">
                                            <div class="table-responsive users-view-permission">
                                                <table class="table table-borderless">
                                                    <thead>
                                                        <tr>
                                                            <th>Module</th>
                                                            <th>Read</th>
                                                            <th>Write</th>
                                                            <th>Create</th>
                                                            <th>Delete</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Manage Products</td>
                                                            <td>
                                                                <div class="custom-control custom-checkbox ml-50"><input type="checkbox" id="users-checkbox1" class="custom-control-input" disabled checked>
                                                                    <label class="custom-control-label" for="users-checkbox1"></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="custom-control custom-checkbox ml-50"><input type="checkbox" id="users-checkbox2" class="custom-control-input" disabled checked><label class="custom-control-label" for="users-checkbox2"></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="custom-control custom-checkbox ml-50"><input type="checkbox" id="users-checkbox3" class="custom-control-input" disabled checked><label class="custom-control-label" for="users-checkbox3"></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="custom-control custom-checkbox ml-50"><input type="checkbox" id="users-checkbox4" class="custom-control-input" disabled checked>
                                                                    <label class="custom-control-label" for="users-checkbox4"></label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Manage Invoices</td>
                                                            <td>
                                                                <div class="custom-control custom-checkbox ml-50"><input type="checkbox" id="users-checkbox1" class="custom-control-input" disabled checked>
                                                                    <label class="custom-control-label" for="users-checkbox1"></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="custom-control custom-checkbox ml-50"><input type="checkbox" id="users-checkbox2" class="custom-control-input" disabled checked><label class="custom-control-label" for="users-checkbox2"></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="custom-control custom-checkbox ml-50"><input type="checkbox" id="users-checkbox3" class="custom-control-input" disabled checked><label class="custom-control-label" for="users-checkbox3"></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="custom-control custom-checkbox ml-50"><input type="checkbox" id="users-checkbox4" class="custom-control-input" disabled checked>
                                                                    <label class="custom-control-label" for="users-checkbox4"></label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- permissions end -->
                            </div>
                        </section>
                        <!-- page users view end -->

                    </div>
                </div>
            </div>
            <!-- END: Content-->

            <div class="sidenav-overlay"></div>
            <div class="drag-target"></div>

            <!-- BEGIN: Footer-->
            <footer class="footer footer-static footer-light">
                <p class="clearfix blue-grey lighten-2 mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; <script>document.write(new Date().getFullYear());</script><a class="text-bold-800 grey darken-2" href="" target="_blank">Brava,</a>All rights Reserved</span><span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i class="feather icon-heart pink"></i></span>
                    <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
                </p>
            </footer>
            <!-- END: Footer-->


            <!-- BEGIN: Vendor JS-->
            <script src="${pageContext.request.contextPath}/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app-menu.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/components.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/pages/app-user.js"></script>
        <!-- END: Page JS-->
        <jsp:include page="../seller/logOutModal.jsp"></jsp:include> 
        </body>
        <!-- END: Body-->
        <script>
                    var error = "${errorups}";
                    if (error) {
                        alert("Error: " + error);
                    }

                    var success = "${msgups}";
                    if (success) {
                        alert("Success: " + success);
                    }
    </script>
</html>