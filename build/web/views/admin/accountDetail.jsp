<%-- 
    Document   : accountDetail
    Created on : Mar 10, 2024, 10:32:06 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
        <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="PIXINVENT">
        <title>Product Details - Admin</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/extensions/swiper.min.css">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/app-ecommerce-details.css">
        <!-- END: Page CSS-->

        <!-- BEGIN: Custom CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!-- END: Custom CSS-->
        <style>
            .color-circle {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: inline-block;
                margin-right: 5px;
            }
            .error {
                color: red;
            }
            .btn-custom-size {
                padding: 0.375rem 0.75rem;
                font-size: 0.9rem;
                line-height: 1.5;
            }
            .circle {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                font-weight: bold;
                background-color: rgb(0, 220, 0);
                box-shadow: 0 0 20px 10px rgba(0, 235, 0, 0.2),
                    0 0 2px 5px rgba(0, 230, 0, 0.2),
                    0 0 5px 2px rgba(0, 230, 0, 0.1);
            }

            .circle-1 {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                font-weight: bold;
                background-color: rgb(192, 192, 192);
                box-shadow: 0 0 20px 10px rgba(128, 128, 128, 0.2),
                    0 0 2px 5px rgba(128, 128, 128, 0.2),
                    0 0 5px 2px rgba(128, 128, 128, 0.1);
            }
        </style>
    </head>
    <!-- END: Head-->

    <!-- BEGIN: Body-->

    <body id="body" class="vertical-layout vertical-menu-modern semi-dark-layout 2-columns ecommerce-application navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="dark-layout">

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
                                        <c:when test="${account.role_Id == 2}">
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">Welcome</span><span class="user-status">${account.email}</span></div><span><img class="round" src="${pageContext.request.contextPath}/assets/images/admin.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <div class="dropdown-divider"></div><a class="dropdown-item" data-toggle="modal" data-target="#logoutModalAdmin" href="#"><i class="feather icon-power"></i> Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- END: Header-->


        <!-- BEGIN: Main Menu-->
        <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mr-auto"><a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard">
                            <div class="brand-logo"></div>
                            <h2 class="brand-text mb-0">Admin</h2>
                        </a></li>
                    <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
                </ul>
            </div>
            <div class="shadow-bottom"></div>
            <div class="main-menu-content">
                <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                    <li class=" nav-item"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">1</span></a>
                        <ul class="menu-content">
                            <li><a href="dashboard-analytics.html"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Analytics</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>Apps</span>
                    </li>

                    <li class=" nav-item"><a href="#"><i class="feather icon-shopping-bag"></i><span class="menu-title" data-i18n="Ecommerce">Product</span></a>
                        <ul class="menu-content">
                            <li><a href="${pageContext.request.contextPath}/admin/manageproduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=view-details"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Details">Setting Products</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=manage-discount"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Details">Manage Discount</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-user"></i><span class="menu-title" data-i18n="User">User</span></a>
                        <ul class="menu-content">
                            <li  class="active"><a href="${pageContext.request.contextPath}/admin/dashboard?page=manageUser"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">Manage Accounts</span></a>
                            </li>
                        </ul>
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
                    <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="row breadcrumbs-top">
                            <div class="col-12">
                                <h2 class="content-header-title float-left mb-0">Manage Accounts</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard?page=manageUser">Accounts List</a>
                                        </li>
                                        <li class="breadcrumb-item active">Details
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-body">
                    <!-- user details details start -->
                    <section class="app-ecommerce-details">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-5">
                                        <form action="${pageContext.request.contextPath}/admin/dashboard?action=update-account-details" method="POST">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="personal-info">
                                                                <h5 class="card-text">Personal Information</h5>
                                                                <div class="form-group">
                                                                    <input type="hidden" class="form-control" value="${Account_Form.email}" name="oldEmail">
                                                                </div>
                                                                <div class="form-group">
                                                                    <input type="hidden" class="form-control" value="${Account_Form.id}" name="accountID">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Email:</label>
                                                                    <input id="emailInput" type="email" class="form-control" value="${Account_Form.email}" name="email">
                                                                    <div id="emailError1" class="error"></div>
                                                                    <c:if test="${not empty emailRegex|| not empty Required}">
                                                                        <div class="error">${emailRegex}${Required}</div>
                                                                    </c:if>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Username:</label>
                                                                    <input id="usernameInput" type="text" class="form-control" value="${Account_Form.username}" name="username">
                                                                    <div id="usernameError1" class="error"></div>
                                                                    <c:if test="${not empty usernameRegex || not empty Required}">
                                                                        <div class="error">${usernameRegex}${Required}</div>
                                                                    </c:if>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Phone number:</label>
                                                                    <input id="phonenumberInput" type="tel" class="form-control" value="${Account_Form.phone_number}" name="phone_number">
                                                                    <div id="phonenumberError1" class="error"></div>
                                                                    <c:if test="${not empty phonenumberRegex || not empty Required}">
                                                                        <div class="error">${phonenumberRegex}${Required}</div>
                                                                    </c:if>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Date of birth:</label>
                                                                    <input id="dobInput" type="date" class="form-control" value="${Account_Form.dob}" name="dob">
                                                                    <div id="dobError1" class="error"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <!-- Right column for role and address -->
                                                            <div class="role-address">
                                                                <h5 class="card-text">Role & Address</h5>
                                                                <br>
                                                                <div class="form-group">
                                                                    <label>Role:</label>
                                                                    <select class="form-control" id="roleSelect1" name="role" required>
                                                                        <c:forEach items="${listR}" var="r">
                                                                            <option <c:if test="${Account_Form.role_Id eq r.id}">selected=""</c:if> value="${r.id}">${r.role}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                    <div id="roleError1" class="error"></div>
                                                                    <c:if test="${not empty Required}">
                                                                        <div class="error">${Required}</div>
                                                                    </c:if>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Gender:</label>
                                                                    <select class="form-control" id="genderSelect1" name="gender" required>
                                                                        <c:forEach items="${listGenders}" var="g">
                                                                            <option <c:if test="${Account_Form.gender_id eq g.id}">selected=""</c:if> value="${g.id}">${g.gender}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                    <div id="genderError1" class="error"></div>
                                                                    <c:if test="${not empty Required}">
                                                                        <div class="error">${Required}</div>
                                                                    </c:if>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Address:</label>
                                                                    <input id="addressInput" type="text" class="form-control" value="${Account_Form.address}" name="address">
                                                                    <div id="addressError1" class="error"></div>
                                                                    <c:if test="${not empty addressRegex || not empty Required}">
                                                                        <div class="error">${addressRegex}${Required}</div>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="text-center mt-4">
                                                        <button class="btn btn-success btn-custom-size" onclick="validateUpdateAccountForm()">
                                                            <i class="feather icon-edit"></i> <span style="color: white" class="ml-1">Save Changes</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-7">
                                        <div class="table-responsive">
                                            <h1 class="text-center mb-2">History Update</h1>
                                            <h5>Total history: ${pagination.totalRecord}</h4>
                                                <table class="table table-striped">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th class="align-middle">Update Date</th>
                                                            <th class="align-middle">Username</th>
                                                            <th class="align-middle">Email</th>
                                                            <th class="align-middle">Phone number</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listH}" var="h">
                                                            <tr>
                                                                <td class="align-middle">${h.update_date}</td>
                                                                <td class="align-middle">${h.username}</td>
                                                                <td class="align-middle">${h.email}</td>
                                                                <td class="align-middle">${h.phone_number}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <!-- List History Pagination Starts -->
                                                <section id="ecommerce-pagination">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination justify-content-center mt-2">
                                                                    <c:if test="${pagination.page > 1}">
                                                                        <li class="page-item prev-item"><a class="page-link" href="${pagination.urlPattern}pagination=1">Start</a></li>
                                                                        </c:if>
                                                                        <c:if test="${pagination.page > 1}">
                                                                        <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 1}">Previous</a></li>
                                                                        </c:if>
                                                                    <!--PAGE - 2 (in case last page )-->
                                                                    <c:if test="${pagination.page == pagination.totalPage && pagination.page > 2}">
                                                                        <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 2}">${pagination.page - 2}</a></li>
                                                                        </c:if>
                                                                    <!--PAGE - 1 (in case last page )-->
                                                                    <c:if test="${pagination.page == pagination.totalPage && pagination.page > 1}">
                                                                        <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 1}">${pagination.page - 1}</a></li>
                                                                        </c:if>
                                                                    <!--PAGE-->
                                                                    <c:if test="${pagination.totalPage == 1}">
                                                                        <li class="page-item active" aria-current="page"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page}">${pagination.page}</a></li>
                                                                        </c:if>
                                                                    <!--PAGE + 1-->
                                                                    <c:if test="${pagination.page < pagination.totalPage}">
                                                                        <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">${pagination.page + 1}</a></li>
                                                                        </c:if>
                                                                    <!--PAGE + 2-->
                                                                    <c:if test="${pagination.page + 1 < pagination.totalPage}">
                                                                        <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 2}">${pagination.page + 2}</a></li>
                                                                        </c:if>
                                                                    <!--NEXT-->
                                                                    <c:if test="${pagination.page != pagination.totalPage && pagination.totalPage > 0}">
                                                                        <li class="page-item "><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">Next</a></li>
                                                                        </c:if>
                                                                    <!--LAST-->
                                                                    <c:if test="${pagination.page != pagination.totalPage && pagination.totalPage > 0}">
                                                                        <li class="page-item next-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.totalPage}">Last</a></li>
                                                                        </c:if>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </div>
                                                </section>
                                                <!-- List History Pagination Ends -->        
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </section>
                    <!-- user details end -->
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
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/extensions/swiper.min.js"></script>
        <!-- END: Page Vendor JS--> 

        <!-- BEGIN: Theme JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app-menu.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/components.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/pages/app-ecommerce-details.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/forms/number-input.js"></script>
        <!-- END: Page JS-->

        <jsp:include page="../admin/logOutModal.jsp"></jsp:include> 

        </body>
        <!-- END: Body-->

        <script>
                console.log("errorua:", errorua);


                console.log("msgua:", msgua);


                var errorua = "${errorua}";
                if (errorua) {
                    alert("Error: " + errorua);
                }

                var msgua = "${msgua}";
                if (msgua) {
                    alert("Success: " + msgua);
                }

                function validateUpdateAccountForm() {
                    let accountEmail1 = $('#emailInput').val();
                    let accountUsername = $('#usernameInput').val();
                    let accountPhonenumber = $('#phonenumberInput').val();
                    let accountDob = $('#dobInput').val();
                    let accountAddress = $('#addressInput').val();
                    let roleID = $('#roleSelect1').val();
                    let genderID = $('#genderSelect1').val();

                    $('.error').html('');

                    if (roleID === '') {
                        $('#roleError1').html('Please choose role!');
                    }
                    if (genderID === '') {
                        $('#genderError1').html('Please choose gender!');
                    }
                    if (accountDob === '') {
                        $('#dobError1').html('Please choose date of birth!');
                    } else {
                        var dobDate = new Date(accountDob);
                        var currentDate = new Date();

                        var hundredYearsAgo = new Date();
                        hundredYearsAgo.setFullYear(currentDate.getFullYear() - 100);

                        var eighteenYearsAgo = new Date();
                        eighteenYearsAgo.setFullYear(currentDate.getFullYear() - 18);

                        if (dobDate > hundredYearsAgo && dobDate < eighteenYearsAgo) {
                            $('#dobError1').html('');
                        } else {
                            $('#dobError1').html('Please choose a valid date of birth!');
                        }
                    }

                    if (accountEmail1 === '') {
                        $('#emailError1').html('Email cannot be blank');
                    } else if (accountEmail1.length < 3) {
                        $('#emailError1').html('Email must be at least 3 characters long.');
                    } else if (!/^(?!.*\s{2})[A-Za-z0-9@.\s]+$/.test(accountEmail1)) {
                        $('#emailError1').html('Email must contain only letters and number');
                    }

                    if (accountAddress === '') {
                        $('#addressError1').html('Address cannot be blank');
                    } else if (accountAddress.length < 6) {
                        $('#addressError1').html('Address must be at least 6 characters long.');
                    } else if (!/^(?!.*\s{2})(?!.*,{2})[A-Za-z0-9\s,]+$/.test(accountAddress)) {
                        $('#addressError1').html('Address must contain only letters, numbers and \',\'.');
                    }

                    if (accountUsername === '') {
                        $('#usernameError1').html('Username cannot be blank');
                    } else if (accountUsername.length < 10) {
                        $('#usernameError1').html('Username must be at least 10 characters long.');
                    } else if (!/^(?!.*\s{2})[A-Za-z\s]+$/.test(accountUsername)) {
                        $('#usernameError1').html('Username must contain only letters');
                    }

                    if (accountPhonenumber === '') {
                        $('#phonenumberError1').html('Phone number cannot be blank');
                    } else if (!/^\d{10}$/.test(accountPhonenumber)) {
                        $('#phonenumberError1').html('Phone number must contain exactly 10 digits');
                    } else if (accountPhonenumber.charAt(0) !== '0') {
                        $('#phonenumberError1').html('Phone number must start with 0');
                    }


                    let error = '';
                    $('.error').each(function () {
                        error += $(this).html();
                    });
                    if (error === '') {
                        if (confirm('Are you sure you want to update this account?')) {
                            $('#updateProductForm').submit();
                        } else {
                            event.preventDefault();
                        }
                    } else {
                        event.preventDefault();
                    }
                }
    </script>
</html>
