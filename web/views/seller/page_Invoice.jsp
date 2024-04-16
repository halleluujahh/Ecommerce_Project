<%-- 
    Document   : page_Invoice
    Created on : Feb 19, 2024, 4:34:03 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Invoice - Vuexy - Bootstrap HTML admin template</title>
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/invoice.css">
        <!-- END: Page CSS-->

        <!-- BEGIN: Custom CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!-- END: Custom CSS-->

    </head>
    <!-- END: Head-->

    <!-- BEGIN: Body-->


    <!-- BEGIN: Body-->
    <body class="vertical-layout vertical-menu-modern semi-dark-layout 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="dark-layout">

        <!-- BEGIN: Header-->
        <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-dark navbar-shadow">
            <div class="navbar-wrapper">
                <div class="navbar-container content">
                    <div class="navbar-collapse" id="navbar-mobile">
                        <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">

                            <ul class="nav navbar-nav bookmark-icons">
                                <!-- li.nav-item.mobile-menu.d-xl-none.mr-auto-->
                                <!--   a.nav-link.nav-menu-main.menu-toggle.hidden-xs(href='#')-->
                                <!--     i.ficon.feather.icon-menu-->

                            </ul>
                            <ul class="nav navbar-nav">

                                <!-- select.bookmark-select-->
                                <!--   option Chat-->
                                <!--   option email-->
                                <!--   option todo-->
                                <!--   option Calendar-->
                                </li>
                            </ul>
                        </div>
                        <ul class="nav navbar-nav float-right">
                            <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                                    <c:choose>
                                        <c:when test="${account.role_Id == 3}">
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">Welcome</span><span class="user-status">${account.email}</span></div><span><img class="round" src="${pageContext.request.contextPath}/assets/images/seller.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="${pageContext.request.contextPath}/seller/dashboard?page=view-profile"><i class="feather icon-user"></i> Edit Profile</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" data-toggle="modal" data-target="#logoutModalAdmin" href="#"><i class="feather icon-power"></i> Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">${account.email}</span><span class="user-status">${account.role_Id}</span></div><span><img class="round" src="${pageContext.request.contextPath}/app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="${pageContext.request.contextPath}/seller/dashboard?page=view-profile"><i class="feather icon-user"></i> Edit Profile</a>
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
                            <li><a href="${pageContext.request.contextPath}/seller/manageProduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li class=""><a href="${pageContext.request.contextPath}/seller/dashboard?page=setting-discounts"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Setting Discounts</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-file"></i><span class="menu-title" data-i18n="Invoice">Invoice</span></a>
                        <ul class="menu-content">
                            <li  class="active"><a href="${pageContext.request.contextPath}/seller/manageInvoice"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">List</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>pages</span>
                    </li>
                    <li class=" nav-item"><a href="${pageContext.request.contextPath}/seller/dashboard?page=view-profile"><i class="feather icon-user"></i><span class="menu-title" data-i18n="Profile">Profile</span></a>
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
                    <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="row breadcrumbs-top">
                            <div class="col-12">
                                <h2 class="content-header-title float-left mb-0">Invoice</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/seller/manageInvoice">Invoice List</a>
                                        </li>
                                        <li class="breadcrumb-item active">Invoice Details
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                        <div class="form-group breadcrum-right">
                        </div>
                    </div>
                </div>
                <div class="content-body">
                    <!-- invoice functionality start -->
                    <section class="invoice-print mb-1">
                        <div class="row">

                            <fieldset class="col-12 col-md-5 mb-1 mb-md-0">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Email" aria-describedby="button-addon2">
                                    <div class="input-group-append" id="button-addon2">
                                        <button class="btn btn-outline-primary" type="button">Send Invoice</button>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="col-12 col-md-7 d-flex flex-column flex-md-row justify-content-end">
                                <button class="btn btn-primary btn-print mb-1 mb-md-0"> <i class="feather icon-file-text"></i> Print</button>
                            </div>
                        </div>
                    </section>
                    <!-- invoice functionality end -->
                    <!-- invoice page -->
                    <section class="card invoice-page">
                        <div id="invoice-template" class="card-body">
                            <!-- Invoice Company Details -->
                            <div id="invoice-company-details" class="row">
                                <div class="col-sm-6 col-12 text-left pt-1">
                                    <div class="media pt-1">
                                        <img src="${pageContext.request.contextPath}/app-assets/images/logo/logo.png" alt="company logo" />
                                    </div>
                                </div>
                                <div class="col-sm-6 col-12 text-right">
                                    <h1>Invoice</h1>
                                    <div class="invoice-details mt-2">
                                        <h6>INVOICE NO.</h6>
                                        <p>${invoiceForm.id}</p>
                                        <h6 class="mt-2">INVOICE DATE</h6>
                                        <p>${invoiceForm.invoice_date}</p>
                                    </div>
                                </div>
                            </div>
                            <!--/ Invoice Company Details -->

                            <!-- Invoice Recipient Details -->
                            <div id="invoice-customer-details" class="row pt-2">
                                <div class="col-sm-6 col-12 text-left">
                                    <div class="recipient-info my-2">
                                        <h1>Thanks for using our Shop</h1>
                                        <h5>Mr/Mss ${invoiceForm.username}</h5>
                                    </div>
                                    <div class="recipient-contact pb-2">                                       
                                    </div>
                                </div>
                                <div class="col-sm-6 col-12 text-right">
                                    <h5>Address</h5>
                                    <div class="company-info my-2">
                                        <p>${invoiceForm.address}</p>
                                    </div>
                                    <div class="company-contact">
                                        <p>
                                            <i class="feather icon-mail"></i>
                                            ${invoiceForm.email}
                                        </p>
                                        <p>
                                            <i class="feather icon-phone"></i>
                                            ${invoiceForm.phoneNumber}
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!--/ Invoice Recipient Details -->

                            <!-- Invoice Items Details -->
                            <div id="invoice-items-details" class="pt-1 invoice-items-table">
                                <div class="row">                                   
                                    <div class="table-responsive col-12">
                                        <table class="table table-borderless">
                                            <thead>
                                                <tr>
                                                    <th>PRODUCT NAME</th>
                                                    <th>COLOR</th>
                                                    <th>SIZE</th>
                                                    <th>GENDER</th>
                                                    <th>AMOUNT</th>
                                                    <th>PRICE</th>
                                                </tr>
                                            </thead>
                                            <c:forEach items="${listIfd}" var="Ifd">
                                                <tbody>
                                                    <tr>
                                                        <td>${Ifd.productName}</td>
                                                        <td>${Ifd.productColor}</td>
                                                        <td>${Ifd.productSize}</td>
                                                        <td>${Ifd.productGender}</td>
                                                        <td>${Ifd.productQuantity}</td>
                                                        <td>${Ifd.price}</td>
                                                    </tr>
                                                </tbody>                                           
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div id="invoice-total-details" class="invoice-total-table">
                                <div class="row">
                                    <div class="col-7 offset-5">
                                        <div class="table-responsive">
                                            <table class="table table-borderless">
                                                <tbody>
                                                    <tr>
                                                        <th>TOTAL</th>
                                                        <td>${invoiceForm.totalPrice}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </section>
                    <!-- invoice page end -->

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
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/pages/invoice.js"></script>
        <!-- END: Page JS-->

    </body>
    <!-- END: Body-->

</html>
